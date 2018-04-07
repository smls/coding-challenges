#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.Int,
    thaw-out => *.Numeric,
;

=finish
0 -> 1
1 -> 0.0
2 -> -1.0
3 -> 0.0
6 -> -61.0
10 -> -50521.0
20 -> 370371188237525.0
