sub f(\a){flat $_,f a[+$_..*]with first {[<=] $_},:end,[\R,] a}
