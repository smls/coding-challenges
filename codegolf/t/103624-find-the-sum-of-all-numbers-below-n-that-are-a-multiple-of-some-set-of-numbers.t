#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.comb(/\d+/)».Int.Capture,
    thaw-out => *.Int,
;

=finish
50, 2       -> 600
10, 3, 5    -> 23
28, 4, 2    -> 182
19, 7, 5    -> 51
50, 2, 3, 5 -> 857
