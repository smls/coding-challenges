#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.Int,
;

=finish
1 -> One more LUL and I'm out
2 -> One more "One more LUL and I'm out" and I'm out
3 -> One more "One more "One more LUL and I'm out" and I'm out" and I'm out
8 -> One more "One more "One more "One more "One more "One more "One more "One more LUL and I'm out" and I'm out" and I'm out" and I'm out" and I'm out" and I'm out" and I'm out" and I'm out
