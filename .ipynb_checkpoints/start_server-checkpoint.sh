#!/bin/bash

# 给脚本执行权限
# chmod +x start_vllm_safetensors.sh

MODEL_DIR="./models/Qwen/Qwen2.5-0.5B-Instruct"

# 启动 vLLM，自动识别 safetensors
python -m vllm.entrypoints.openai.api_server \
  --model $MODEL_DIR \
  --tokenizer $MODEL_DIR \
  --port 8110 \
  --gpu-memory-utilization 0.7 \
  --served-model-name Qwen2.5-0.5B-Instruct

# log看到 INFO 07-23 00:14:08 [api_server.py:1457] Starting vLLM API server 0 on http://0.0.0.0:8110 即成功
# 按照0.7设置，显存为9944MiB / 12288MiB
# 在perf的时候，--model=--served-model-name的名字, 不然就是 --model的一长串路路径了