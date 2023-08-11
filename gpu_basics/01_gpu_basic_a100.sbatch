#!/bin/bash

#SBATCH --job=01-gpu_basic_a100        
#SBATCH --partition=express
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --gres=gpu:a100:1
#SBATCH --mem=8G
#SBATCH --time=1:00:00

#SBATCH --output=%x_%j.log         # stdr & stderr log
#SBATCH -D .                       

#SBATCH --mail-user=myemail@hpc.iter.es
#SBATCH --mail-type=END,FAIL        
#################################################

echo "Finish my script"
echo "Module loads"

module purge
module load NVHPC/22.11-CUDA-11.8.0

nvidia-smi
sleep 20

echo "Finish my script"