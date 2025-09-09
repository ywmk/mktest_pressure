#!/bin/bash

#------------ git 配置
git_username='ywmk'
git_password='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'  #2025-12-4到期
# # ----------- evalscope 配置
# #modelscope获取Token
# #去 https://modelscope.cn/my/apitokens 创建你的 Token
# $evalscope_token='70fa3b17-aaf0-4497-9c27-d0129313306b'
# export MODELSCOPE_ACCESS_TOKEN="${evalscope_token}"

#------------ proj 配置
root='/root/mkyuwen'
local_pressure='mktest_local_pressure/mktest_pressure_param'
inference_engine_name='vllm'    # 'vllm', 'sglang'
##---------- proj.model 配置
model_name='Qwen/Qwen2.5-0.5B-Instruct'  #需要去https://www.modelscope.cn/models/Qwen/Qwen2.5-0.5B-Instruct确认
model_cache_dir="${root}/${local_pressure}/models"
model_dir="${model_cache_dir}/${model_name}"
##--------- proj.service 配置
service_port=8110
served_model_name="Qwen2.5-0.5B-Instruct"  #即curl http://localhost:8110/v1/models中的key:id字段，即vllm中--served-model-name的名字，即perf中的key:model字段

#-------------- perf 配置
parallel='1 10 50'
number='10 50 100'
model=$served_model_name #'Qwen2.5-0.5B-Instruct'
url="http://127.0.0.1:${service_port}/v1/chat/completions"
dataset="random"  #TODO：不同数据集
tokenizer_path=$model_dir
