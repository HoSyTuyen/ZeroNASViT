#PBS -l select=1:ncpus=40:ngpus=8
#PBS -l walltime=100:00:00
#PBS -N train_searched_result_IN1K
#PBS -j oe
#PBS -o log/train_searched_result_IN1K.log
#PBS -q gold
#PBS -v CONTAINER_IMAGE=nvcr.io/nvidia/pytorch:20.06-py3

echo "CONTAINER_IMAGE=nvcr.io/nvidia/pytorch:20.06-py3"

cd "$PBS_O_WORKDIR" || exit $?
echo ${PBS_O_WORKDIR}

USER=hosy_tuyen # Replace with your own HPC account name

if [ -d "./log/" ]
then
  echo "Log folder exists"
else
  mkdir log
  echo "Create log folder"
fi

nvidia-smi
python_alias="/home/users/${USER}/.conda/envs/ZeroNASViT/bin/python3.7"
#export PYTHONPATH=/home/users/$USER/sutddev/mmselfsup/:$PYTHONPATH

cmd="${python_alias} -m torch.distributed.launch train_alphanet.py --config-file configs/train_alphanet.yml"
echo ${cmd}
eval ${cmd}