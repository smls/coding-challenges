#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.Int,
    thaw-out => *.Int,
;

=finish
1 -> 1
5 -> 6
63 -> 104
