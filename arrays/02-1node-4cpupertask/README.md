# Ejemplo 2: 

En este caso, reservamos solo 1 nodo y 4 CPU para cada tarea de trabajo.

Preste atención a eso: reservamos sólo 1 nodo para cada tarea, pero eso no significa que slurm asignará más nodos si se necesitan más recursos. En realidad depende del número de cores 

```sh 
squeue -l
```
```
JOBID PARTITION     NAME     USER    STATE       TIME TIME_LIMI  NODES NODELIST(REASON)
1659_1   express 02-1node user  RUNNING       0:05   1:00:00      1 node1308-1
1659_2   express 02-1node user  RUNNING       0:05   1:00:00      1 node1308-1
1659_3   express 02-1node user  RUNNING       0:05   1:00:00      1 node1308-1
1659_4   express 02-1node user  RUNNING       0:05   1:00:00      1 node1308-1
1659_5   express 02-1node user  RUNNING       0:05   1:00:00      1 node1309-1
1659_6   express 02-1node user  RUNNING       0:05   1:00:00      1 node1309-1
1659_7   express 02-1node user  RUNNING       0:05   1:00:00      1 node1309-1
1659_8   express 02-1node user  RUNNING       0:05   1:00:00      1 node1309-1
1659_9   express 02-1node user  RUNNING       0:05   1:00:00      1 node1309-4
1659_10   express 02-1node user  RUNNING       0:05   1:00:00      1 node1309-4
```

Como hemos reservado para 4 CPU, 1 un nodo para cada tarea y hay 10 tareas (10 tareas * 4 CPU = 40 CPU). Como los nodos con arquitectura sandy tiene 16 cores vemos que el trabajo se ejecuta en 3 nodos diferentes. 

> TRES=cpu=4,mem=4G,nodo=1



## Conclusiones importantes

* El parámetro "n" es la cantidad de núcleos utilizados por cada tarea de trabajo de matriz

* El parámetro "N" es el número de nodos utilizados por cada tarea de trabajo de matriz. Cuando un nodo termina sus CPU disponibles para ejecutar el trabajo de matriz, slurm asignará otro nodo con más CPU disponibles, y así sucesivamente.

* Si tenemos una tarea de trabajo de matriz que no puede usar más de una CPU, el parámetro "n" debe establecerse en 1, de lo contrario, estaremos solicitando más recursos de los que necesitamos.

* Si obligamos al trabajo de matriz a usar solo un nodo, la cantidad de tareas que podremos ejecutar será la misma que la cantidad de nodos de CPU/la cantidad de núcleos que solicitamos para ejecutar la tarea.

* En el script, y probablemente esa sea la conclusión más importante, los parámetros configurados (memoria, número de nodo, número de núcleo, etc.) son para cada trabajo del arreglo, no para todo el trabajo del arreglo.

* En otras palabras, si pedimos 4 nodos, no los reservamos para todos los trabajos del arreglo, sino para cada tarea del arreglo. Si la tarea necesita solo un nodo, estaremos desperdiciando recursos. Si solicitamos más núcleos de los que la tarea puede usar, nuevamente estaremos desperdiciando recursos.