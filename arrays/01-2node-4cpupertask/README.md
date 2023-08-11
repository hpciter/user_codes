# Ejemplo 1: El trabajo reserva 2 nodos y 4 CPU para cada tarea.

**Este ejemplo hace una reserva errónea de recursos**

Enviaremos 10 tareas de trabajo para ver cuál es el comportamiento del trabajo.

Para cada tarea del trabajo, slurm asignará 2 nodos y 4 CPU para cada tarea (en total). **Sin embargo, no significa que slurm use 4 CPU para cada tarea**, en este caso, tenemos un proceso que no usa múltiples núcleos para cada hilo. 

Otra cosa importante es que slurm asigna 2 nodos para cada tarea, pero solo usa 1 nodo porque el proceso a ejecutarse no puede ejecutarse en modo de múltiples nodos (por ejemplo, si no es compatilbe con OpenMPI no es compatible). Por esta razón, node002 nunca ejecutará ningún trabajo.

Por lo tanto, el parámetro “N” debe ser “1”.


```sh 
squeue -l
```

```sh 
JOBID PARTITION     NAME     USER    STATE       TIME TIME_LIMI  NODES NODELIST(REASON)
1649_1   express 01-2node user  RUNNING       0:04   1:00:00      2 node1308-1,node1309-1
1649_2   express 01-2node user  RUNNING       0:04   1:00:00      2 node1308-1,node1309-1
1649_3   express 01-2node user  RUNNING       0:04   1:00:00      2 node1308-1,node1309-1
1649_4   express 01-2node user  RUNNING       0:04   1:00:00      2 node1308-1,node1309-1
1649_5   express 01-2node user  RUNNING       0:04   1:00:00      2 node1308-1,node1309-1
1649_6   express 01-2node user  RUNNING       0:04   1:00:00      2 node1308-1,node1309-1
1649_7   express 01-2node user  RUNNING       0:04   1:00:00      2 node1309-[1,4]
1649_8   express 01-2node user  RUNNING       0:04   1:00:00      2 node1309-[1,4]
1649_9   express 01-2node user  RUNNING       0:04   1:00:00      2 node1309-[1,4]
1649_10   express 01-2node user  RUNNING       0:04   1:00:00      2 node1309-4,node1310-2
```


## Conclusiones importantes

* El parámetro "n" es la cantidad de núcleos utilizados por cada tarea de trabajo de matriz

* El parámetro "N" es el número de nodos utilizados por cada tarea de trabajo de matriz. Cuando un nodo termina sus CPU disponibles para ejecutar el trabajo de matriz, slurm asignará otro nodo con más CPU disponibles, y así sucesivamente.

* Si tenemos una tarea de trabajo de matriz que no puede usar más de una CPU, el parámetro "n" debe establecerse en 1, de lo contrario, estaremos solicitando más recursos de los que necesitamos.

* Si obligamos al trabajo de matriz a usar solo un nodo, la cantidad de tareas que podremos ejecutar será la misma que la cantidad de nodos de CPU/la cantidad de núcleos que solicitamos para ejecutar la tarea.

* En el script, y probablemente esa sea la conclusión más importante, los parámetros configurados (memoria, número de nodo, número de núcleo, etc.) son para cada trabajo del arreglo, no para todo el trabajo del arreglo.

* En otras palabras, si pedimos 4 nodos, no los reservamos para todos los trabajos del arreglo, sino para cada tarea del arreglo. Si la tarea necesita solo un nodo, estaremos desperdiciando recursos. Si solicitamos más núcleos de los que la tarea puede usar, nuevamente estaremos desperdiciando recursos.