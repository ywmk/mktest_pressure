#!/bin/bash


source ./config.sh


function run_server(){
    other_params=$1

    if [[ $inference_engine_name == "vllm" ]]
    then
        echo "run vllm"
        # 启动 vLLM，自动识别 safetensors
        # log看到 INFO 07-23 00:14:08 [api_server.py:1457] Starting vLLM API server 0 on http://0.0.0.0:8110 即成功
        # 按照0.7设置，显存为9944MiB / 12288MiB
        # 在perf的时候，--model=--served-model-name的名字, 不然就是 --model的一长串路路径了
        python -m vllm.entrypoints.openai.api_server \
          --model $model_dir \
          --tokenizer $model_dir \
          --port $service_port \
          --served-model-name $served_model_name \
          ${other_params}  
    fi
}

other_params="--gpu-memory-utilization 0.7"
run_server "${other_params}"