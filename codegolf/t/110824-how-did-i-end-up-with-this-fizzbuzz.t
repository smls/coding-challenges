#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.Int,
    thaw-out => *.Numeric,
;

=finish
1    -> 1
6    -> 3
15   -> 6
313  -> 100
3677 -> 1001
