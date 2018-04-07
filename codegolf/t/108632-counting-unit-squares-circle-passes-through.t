#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.Int,
    thaw-out => *.Int,
;

=finish
0 → 0
1 → 4
4 → 28
5 → 28
49 → 388
50 → 380
