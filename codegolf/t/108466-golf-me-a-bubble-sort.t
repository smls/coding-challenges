#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in  => *.comb(/ \d+ /)».Int.Array,
    thaw-out => *.comb(/ \d+ /)».Int.Array,
;

=finish
1 2 5 4 3 -> 1 2 3 4 5
10 5 9 2 1 6 8 3 7 4 -> 1 2 3 4 5 6 7 8 9 10
