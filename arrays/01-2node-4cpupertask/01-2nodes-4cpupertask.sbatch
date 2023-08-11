#!/bin/bash

#SBATCH --job=01-2nodes-4cpupertask     
#SBATCH --partition=express
#SBATCH --nodes=2
#SBATCH --ntasks=4
#SBATCH --array=1-10:1
#SBATCH --mem=8GB
#SBATCH --constrain=sandy
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