#!/bin/bash

#SBATCH --job=01-icelake-nodes       #  Nombre del trabajo
#SBATCH --partition=batch           # Partición (express/sbatch/long/fatnodes)
#SBATCH --nodes=1                   # Nº de nodos
#SBATCH --mem=8000M                # Memoria solicitada por nodo (30000M or 60000M)
#SBATCH --tasks-per-node=1          # Nº tareas por nodo
#SBATCH --constrain=ilk           # sandy, ilk (icelake)... arquitecture
#SBATCH --time=02:00                # Límite de tiempo

#SBATCH --output=%x_%j.log         # Log de salida estandar
#SBATCH --error=%x_%j.err          # Log de salida errores
#SBATCH -D .                       # Directorio de trabajo

#SBATCH --mail-user=EMAIL           # Donde será enviado el mail
#SBATCH --mail-type=END,FAIL        # Eventos email
##########################################################


# UN COMENTARIO
echo "Comienza mi script"
pwd
hostname
date
sleep 120
echo "Finaliza mi script"