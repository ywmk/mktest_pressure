# -*- coding: UTF-8 -*-
import os
from absl import app, flags
FLAGS = flags.FLAGS

# flags.DEFINE_integer("epochs", 1, "")
# flags.DEFINE_bool("eager", False, "")

#------------ proj 配置
root='/root/mkyuwen'
local_pressure='mktest_local_pressure/mktest_pressure_param'
##---------- proj.model 配置
model_name='Qwen/Qwen2.5-0.5B-Instruct'  #需要去https://www.modelscope.cn/models/Qwen/Qwen2.5-0.5B-Instruct确认
model_cache_dir=f"{root}/{local_pressure}/models"
model_dir=f"{model_cache_dir}/{model_name}"

# common
flags.DEFINE_string("model_name", model_name, "")
flags.DEFINE_string("model_cache_dir", model_cache_dir, "")

