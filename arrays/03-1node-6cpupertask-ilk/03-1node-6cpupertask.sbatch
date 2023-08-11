#!/bin/bash

#SBATCH --job=03-1nodes-6cpupertask-ilk     
#SBATCH --partition=express
#SBATCH --nodes=1
#SBATCH --ntasks=6
#SBATCH --array=1-10:1
#SBATCH --mem=8GB
#SBATCH --constrain=ilk
#SBATCH --time=1:00:00

#SBATCH --output=%x.%a.%j.log         # stdr & stderr log
#SBATCH --chdir=.                       

#SBATCH --mail-user=myemail@hpc.iter.es
#SBATCH --mail-type=END,FAIL        
#################################################

echo "Comienza mi job"
echo "-n 4"
echo ${SLURM_ARRAY_TASK_ID}
sleep 20
echo "Finaliza mi job"