#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.split(", ").&{.[0].Int, .[1].comb(/ \d /)».Int}.Capture,
    thaw-out => *.Int,
;

=finish
4, (1 2) -> 2111
6, (5 5 5 5 5 5 5 5 5 5 1 5 5 5 5 5 5 5 5 5 5) -> 115151
