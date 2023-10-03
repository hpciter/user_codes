# Ejemplo 3: 

En este caso, reservamos solo 1 nodo y 6 CPU para cada tarea de trabajo de matriz. 

Preste atención a eso: reservamos sólo 1 nodo para cada tarea, pero eso no significa que slurm asignará más nodos si se necesitan más recursos. En realidad depende del número de cores del nodo.

```sh 
squeue -l
```
```
  JOBID PARTITION     NAME     USER    STATE       TIME TIME_LIMI  NODES NODELIST(REASON)
1679_9   express 03-1node myuser  RUNNING       0:04   1:00:00      1 node17101-1
1679_10   express 03-1node myuser  RUNNING       0:04   1:00:00      1 node17102-1
1679_1   express 03-1node myuser  RUNNING       0:05   1:00:00      1 node17101-1
1679_2   express 03-1node myuser  RUNNING       0:05   1:00:00      1 node17101-1
1679_3   express 03-1node myuser  RUNNING       0:05   1:00:00      1 node17101-1
1679_4   express 03-1node myuser  RUNNING       0:05   1:00:00      1 node17101-1
1679_5   express 03-1node myuser  RUNNING       0:05   1:00:00      1 node17101-1
1679_6   express 03-1node myuser  RUNNING       0:05   1:00:00      1 node17101-1
1679_7   express 03-1node myuser  RUNNING       0:05   1:00:00      1 node17101-1
1679_8   express 03-1node myuser  RUNNING       0:05   1:00:00      1 node17101-1
```

Como hemos reservado para 6 CPU, 1 un nodo para cada tarea y hay 10 tareas (10 tareas * 6 CPU = 60 CPU). Como los nodos con arquitectura icelake tiene 64 y _hay hueco_ cores vemos que el trabajo se ejecuta en el mismo nodo. 

> TRES=cpu=6,mem=8G,nodo=1



## Conclusiones importantes

* El parámetro "n" es la cantidad de núcleos utilizados por cada tarea de trabajo de matriz

* El parámetro "N" es el número de nodos utilizados por cada tarea de trabajo de matriz. Cuando un nodo termina sus CPU disponibles para ejecutar el trabajo de matriz, slurm asignará otro nodo con más CPU disponibles, y así sucesivamente.

* Si tenemos una tarea de trabajo de matriz que no puede usar más de una CPU, el parámetro "n" debe establecerse en 1, de lo contrario, estaremos solicitando más recursos de los que necesitamos.

* Si obligamos al trabajo de matriz a usar solo un nodo, la cantidad de tareas que podremos ejecutar será la misma que la cantidad de nodos de CPU/la cantidad de núcleos que solicitamos para ejecutar la tarea.

* En el script, y probablemente esa sea la conclusión más importante, los parámetros configurados (memoria, número de nodo, número de núcleo, etc.) son para cada trabajo del arreglo, no para todo el trabajo del arreglo.

* En otras palabras, si pedimos 4 nodos, no los reservamos para todos los trabajos del arreglo, sino para cada tarea del arreglo. Si la tarea necesita solo un nodo, estaremos desperdiciando recursos. Si solicitamos más núcleos de los que la tarea puede usar, nuevamente estaremos desperdiciando recursos.
