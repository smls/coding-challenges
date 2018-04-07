#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.words».Int.Capture,
    thaw-out => *.Int,
;

=finish
3 1 1 1    -> 1
6 1 1 1    -> 1
1000 3 2 3 -> 2
7 3 4 3    -> 2
