#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in  => *.Int,
    thaw-out => *.Int,
;

=finish
5        -> 3
30       -> 6
31       -> 7
32       -> 5
100      -> 8
200      -> 9
