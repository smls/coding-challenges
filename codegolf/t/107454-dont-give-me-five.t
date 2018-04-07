#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in  => *.split(',')».Int.Capture,
    thaw-out => *.Int,
;

=finish
1, 9 -> 8
4, 17 -> 12
50,60 -> 1
-59,-50 -> 0
