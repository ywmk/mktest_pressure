from modelscope.hub.snapshot_download import snapshot_download
from absl import app, flags

from config import *

FLAGS = flags.FLAGS


def get_model():
    # 下载模型文件
    # snapshot_download('Qwen/Qwen2.5-0.5B-Instruct', cache_dir='/mkyuwen/mktest_pressure/models')
    snapshot_download(model_id=FLAGS.model_name, cache_dir=FLAGS.model_cache_dir)


def main(argv):
    get_model()


if __name__ == "__main__":
    app.run(main)