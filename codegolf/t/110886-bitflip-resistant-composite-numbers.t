#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.Int,
    thaw-out => *.comb(/ \d+ /)».Int,
;

=finish
10 -> 
84 -> 84
260 -> 84, 184, 246, 252
