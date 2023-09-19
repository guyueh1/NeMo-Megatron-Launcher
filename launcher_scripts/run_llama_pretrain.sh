NML=/lustre/fsw/joc/guyueh/NeMo-Megatron-Launcher

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


python3 main.py \
  stages=[training] \
  container=nvcr.io/nvidian/bignlp-train:23.08-nemofw-nightly \
  launcher_scripts_path=${NML}/launcher_scripts \
  training=llama/${MODEL} \
  training.run.name=${MODEL}_${NUM_NODES}n:training_mbs_${MICRO_BATCH_SIZE}_seq_${SEQ_LENGTH}_tp_${TP}_pp_${PP}_sp_${SP} \
  training.trainer.max_steps=${TRAIN_STEPS} \
  training.trainer.val_check_interval=${TRAIN_STEPS} \
  training.trainer.num_nodes=${NUM_NODES} \
  training.model.global_batch_size=${GLOBAL_BATCH_SIZE} \
  training.model.micro_batch_size=${MICRO_BATCH_SIZE} \
  training.model.encoder_seq_length=${SEQ_LENGTH} \
  training.model.max_position_embeddings=${SEQ_LENGTH} \
  training.model.data.seq_length=${SEQ_LENGTH} \
  training.model.tensor_model_parallel_size=${TP} \
  training.model.pipeline_model_parallel_size=${PP} \
  training.model.sequence_parallel=${SP} \
  training.model.virtual_pipeline_model_parallel_size=${VPP} \
  training.exp_manager.create_wandb_logger=False \
  training.model.tokenizer.model=${NML}/launcher_scripts/data/llama2_tokenizer.model \
  training.model.data.data_prefix=[] \
  training.model.data.data_impl=mock \
  training.exp_manager.checkpoint_callback_params.save_nemo_on_train_end=${SAVE_NEMO} \
  training.run.time_limit=0-00:30:00