#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.Int,
    thaw-out => *.Int,
;

=finish
0 -> 4
1 -> 14
2 -> 29
3 -> 52
4 -> 87
5 -> 132
6 -> 185
