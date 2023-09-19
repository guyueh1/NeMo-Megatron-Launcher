NML=/lustre/fsw/joc/guyueh/NeMo-Megatron-Launcher
NEMO=/lustre/fsw/joc/guyueh/NeMo

MODEL=${1:-"llama2_7b"}
NUM_NODES=${2:-1}
SEQ_LENGTH=${3:-1024}
TP=${4:-1}
PP=${5:-1}
SP=${6:-"False"}
MICRO_BATCH_SIZE=${7:-1}
VPP=${8:-null}
SAVE_NEMO=${9:-False}

TRAIN_STEPS=21
GLOBAL_BATCH_SIZE=128

CLUSTER_ACCOUNT=coreai_dlalgo_llm
CLUSTER_PARTITION=luna

python3 main.py \
  stages=[peft] \
  container=nvcr.io/nvidian/bignlp-train:23.08-nemofw-nightly \
  container_mounts=[${NEMO}:/opt/NeMo] \
  launcher_scripts_path=${NML}/launcher_scripts \
  cluster.partition=${CLUSTER_PARTITION} \
  cluster.account=${CLUSTER_ACCOUNT} \
  cluster.gpus_per_node=null \
  cluster.job_name_prefix=${CLUSTER_ACCOUNT}- \
  peft=llama/squad \
  peft.model.restore_from_path=${NML}/launcher_scripts/data/llama2/${MODEL} \
  peft.run.model_train_name=${MODEL} \
  peft.run.name=${MODEL}_${NUM_NODES}n:peft_mbs_${MICRO_BATCH_SIZE}_seq_${SEQ_LENGTH}_tp_${TP}_pp_${PP}_sp_${SP} \
  peft.trainer.max_steps=${TRAIN_STEPS} \
  peft.trainer.val_check_interval=${TRAIN_STEPS} \
  peft.trainer.num_nodes=${NUM_NODES} \
  peft.model.global_batch_size=${GLOBAL_BATCH_SIZE} \
  peft.model.micro_batch_size=${MICRO_BATCH_SIZE} \
  peft.model.data.train_ds.max_seq_length=${SEQ_LENGTH} \
  ++peft.model.data.train_ds.pad_to_max_length=True \
  peft.model.tensor_model_parallel_size=${TP} \
  peft.model.pipeline_model_parallel_size=${PP} \
  peft.model.sequence_parallel=${SP} \
  ++peft.model.virtual_pipeline_model_parallel_size=${VPP} \
  peft.exp_manager.create_wandb_logger=False \
  training.exp_manager.checkpoint_callback_params.save_nemo_on_train_end=${SAVE_NEMO} \
  peft.run.time_limit=0-00:30:00