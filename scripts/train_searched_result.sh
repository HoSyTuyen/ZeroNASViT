#!/bin/bash
python3 -m torch.distributed.launch --nproc_per_node=4 --use_env train.py \
--data-path '../../dataset/cifar100' --data-set 'CIFAR100' --gp --change_qk --relative_position \
--mode retrain --model_type 'AUTOFORMER' --dist-eval --cfg './experiments/subnet_autoformer/TF_TAS-T.yaml' --output_dir './OUTPUT/sample'


