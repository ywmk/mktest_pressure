#!/bin/bash


source ./config.sh


function run_perf(){
    other_params=$1

    evalscope perf \
      --parallel ${parallel} \
      --number ${number} \
      --model ${model} \
      --url ${url} \
      --port ${service_port} \
      --api openai \
      --dataset ${dataset} \
      --max-tokens 512 \
      --min-tokens 512 \
      --prefix-length 0 \
      --min-prompt-length 512 \
      --max-prompt-length 512 \
      --tokenizer-path ${tokenizer_path} \
      --extra-args '{"ignore_eos": true}' \
      ${other_params}
}

other_params="--min-prompt-length 128"
run_perf "${other_params}"