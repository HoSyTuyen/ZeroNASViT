#PBS -l select=1:ncpus=2:ngpus=1
#PBS -N setup
#PBS -j oe
#PBS -o setup.log
#PBS -q gold
#PBS -v CONTAINER_IMAGE=nvcr.io/nvidia/pytorch:20.06-py3

echo "CONTAINER_IMAGE=nvcr.io/nvidia/pytorch:20.06-py3"


cd "$PBS_O_WORKDIR" || exit $?
echo ${PBS_O_WORKDIR}

USER=hosy_tuyen # Replace with your own HPC account name


cmd="/opt/conda/bin/conda create --force -y -n ZeroNASViT -f environment.yml"
echo ${cmd}
eval ${cmd}
