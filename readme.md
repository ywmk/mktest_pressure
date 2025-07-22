# 目录
/mkyuwen/mktest_pressure

# 环境准备
Linux
python = 3.11
pytorch = 2.4.0
cuda = 12.1.1

# 安装必要软件
1. 安装 vllm 和 transformers
pip install vllm 
pip install transformers

# 下载 Qwen2.5-0.5B-Instruct 模型和 tokenizer
## modelscope获取Token
去 https://modelscope.cn/my/apitokens 创建你的 Token
70fa3b17-aaf0-4497-9c27-d0129313306b
## Token配置到环境变量
export MODELSCOPE_ACCESS_TOKEN="70fa3b17-aaf0-4497-9c27-d0129313306b"
## 确认模型名字
https://www.modelscope.cn/models/Qwen/Qwen2.5-0.5B-Instruct
## 下载model，tokenizer
python get_mdoel.py
## vllm启动服务 （注意model路径）
bash start_server.sh
### 检验
curl http://localhost:8110/v1/models
```
{"object":"list","data":[{"id":"Qwen2.5-0.5B-Instruct","object":"model","created":1753201516,"owned_by":"vllm","root":"./models/Qwen/Qwen2.5-0.5B-Instruct","parent":null,"max_model_len":32768,"permission":[{"id":"modelperm-f65e90a446134260bae2b73af90e3b01","object":"model_permission","created":1753201516,"allow_create_engine":false,"allow_sampling":true,"allow_logprobs":true,"allow_search_indices":false,"allow_view":true,"allow_fine_tuning":false,"organization":"*","group":null,"is_blocking":false}]}]}
```
id是vllm中--served-model-name的名字
## evalscope 跑压测
bash perf.sh


