from modelscope.hub.snapshot_download import snapshot_download

# 下载模型文件
snapshot_download('Qwen/Qwen2.5-0.5B-Instruct', cache_dir='/mkyuwen/mktest_pressure/models')