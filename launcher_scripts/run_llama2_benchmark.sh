# llama2_7b
bash run_llama_pretrain.sh llama2_7b 1 1024 1 1 False 4
bash run_llama_pretrain.sh llama2_7b 1 2048 1 1 False 2
bash run_llama_pretrain.sh llama2_7b 1 4096 1 1 False 1
# llama2_13b
bash run_llama_pretrain.sh llama2_13b 2 1024 2 1 True 4
bash run_llama_pretrain.sh llama2_13b 2 2048 2 1 True 2
bash run_llama_pretrain.sh llama2_13b 2 4096 2 1 True 1
# llama2_70b
bash run_llama_pretrain.sh llama2_70b 8 1024 4 4 True 4 20
bash run_llama_pretrain.sh llama2_70b 8 1024 2 8 True 2 10
bash run_llama_pretrain.sh llama2_70b 8 2048 4 4 True 2 20
bash run_llama_pretrain.sh llama2_70b 8 2048 2 8 True 1 10
bash run_llama_pretrain.sh llama2_70b 8 4096 8 4 True 4 20
bash run_llama_pretrain.sh llama2_70b 8 4096 4 8 True 1 10

# lora
bash run_llama_lora.sh llama2_7b 1 1024 1 1 False 8
bash run_llama_lora.sh llama2_7b 1 2048 1 1 False 4
bash run_llama_lora.sh llama2_7b 1 4096 1 1 False 2
bash run_llama_lora.sh llama2_13b 1 1024 1 1 False 4
bash run_llama_lora.sh llama2_13b 1 2048 1 1 False 2
bash run_llama_lora.sh llama2_13b 1 4096 1 1 False 1
bash run_llama_lora.sh llama2_70b 1 1024 4 1 True 4 null
bash run_llama_lora.sh llama2_70b 1 2048 4 1 True 2 null
bash run_llama_lora.sh llama2_70b 1 4096 4 1 True 1 null