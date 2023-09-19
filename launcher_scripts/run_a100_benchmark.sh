# llama2_7b
bash run_llama_pretrain.sh llama2_7b 1 4096 1 1 False 1
bash run_llama_pretrain.sh llama2_7b 1 4096 1 1 False 2
bash run_llama_pretrain.sh llama2_7b 1 4096 2 1 True 4
bash run_llama_pretrain.sh llama2_7b 1 4096 4 1 True 4
bash run_llama_pretrain.sh llama2_7b 1 4096 4 1 True 8
bash run_llama_pretrain.sh llama2_7b 1 4096 8 1 True 8
bash run_llama_pretrain.sh llama2_7b 1 4096 1 2 False 2
bash run_llama_pretrain.sh llama2_7b 1 4096 2 2 True 1
bash run_llama_pretrain.sh llama2_7b 1 4096 2 4 True 4
bash run_llama_pretrain.sh llama2_7b 1 4096 1 4 False 2
bash run_llama_pretrain.sh llama2_7b 1 4096 1 8 False 1
# llama2_13b
bash run_llama_pretrain.sh llama2_13b 2 4096 2 1 True 1
bash run_llama_pretrain.sh llama2_13b 2 4096 2 2 True 2
bash run_llama_pretrain.sh llama2_13b 2 4096 2 4 True 2
bash run_llama_pretrain.sh llama2_13b 2 4096 1 2 False 1
bash run_llama_pretrain.sh llama2_13b 2 4096 1 4 False 1
# llama1_30b
bash run_llama_pretrain.sh llama1_30b 4 4096 2 4 True 1
bash run_llama_pretrain.sh llama1_30b 4 4096 2 8 True 1
bash run_llama_pretrain.sh llama1_30b 4 4096 4 1 True 1
bash run_llama_pretrain.sh llama1_30b 4 4096 4 2 True 2
bash run_llama_pretrain.sh llama1_30b 4 4096 4 4 True 2
# llama2_70b
bash run_llama_pretrain.sh llama2_70b 8 4096 8 2 True 2 40
bash run_llama_pretrain.sh llama2_70b 8 4096 8 4 True 2 20
bash run_llama_pretrain.sh llama2_70b 8 4096 8 8 True 2 10
bash run_llama_pretrain.sh llama2_70b 8 4096 4 8 True 2 10
