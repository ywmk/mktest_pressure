#!/bin/bash

source ./config.sh

# # # ------------- 基本环境（自行搭建）
# # Linux
# # python = 3.11
# # pytorch = 2.4.0
# # cuda = 12.1.1

# # ------------- 1.git 环境（0-1搭建）
# 安装git
apt-get install git
# 下载到工作目录
git config --global http.version HTTP/1.1   #修改http方式,不然http2.0容易报错
mkdir -p  "${root}/${local_pressure}" #/root/mkyuwen/mktest_local_pressure 构建工作目录
cd "${root}/${local_pressure}"  
git init
# git clone https://github.com/ywmk/mktest_pressure.git mktest_pressure #TODO:

# # ------------- 2. evalscope, transformers, vllm/sglang环境
# --------------install inference_engine_name 
$inference_engine_name='vllm'    # 'vllm', 'sglang'
if [[ ${inference_engine_name} == "vllm" ]];then
  pip install vllm
fi
if [[ ${inference_engine_name} == "sglang" ]];then
  pip install sglang  #todo：install sglang
fi
# --------------install evalscope-perf
pip install evalscope
pip install evalscope[perf] #安装模型压测模块的依赖
# --------------install transformer , absl
pip install transformers
pip install absl-py


# # ------------- 3. modelscope下载模型和tokenizer
# 1. modelscope获取Token 去 https://modelscope.cn/my/apitokens 创建你的 
#    Token=70fa3b17-aaf0-4497-9c27-d0129313306b
# 2. Token配置到环境变量 export MODELSCOPE_ACCESS_TOKEN="70fa3b17-aaf0-4497-9c27-d0129313306b"
# 3. 确认模型名字 https://www.modelscope.cn/models/Qwen/Qwen2.5-0.5B-Instruct
# 下载model，tokenizer
mkdir -p "${model_cache_dir}"
python get_model.py

# # ------------- 4. 启动server
##watch -n 5 nvidia-smi
# # -------- 基于vllm的 (基于sglang的 #TODO)
bash -x start_server.sh 
bash -x evalscope_perf.sh
