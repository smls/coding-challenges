#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in  => *.Int,
    thaw-out => *.Int,
;

=finish
0 -> 1
1 -> 1
5 -> 3
10 -> 1
59 -> 5
100 -> 10
1001 -> 12
