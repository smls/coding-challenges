#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.words».Int.List,
    thaw-out => *.Int,
    skip => "Rakudo regression https://github.com/rakudo/rakudo/issues/1695",
;

=finish
5 7 3 2 1 2 2 7 5   -> 42
1 2 3 4 3 3 1       -> 36
1 2 2 2 4 3 3 1     -> 32
2 2 2               -> 8
7 2 3 6 8 6 2 5 4 3 -> 288
3 3 8 9 1 7 7 2 2 4 -> 9
3 2 6 5 4 1 8 8 7 9 -> 4032
7 4 2 8 8 3 9 9 5 6 -> 31104
