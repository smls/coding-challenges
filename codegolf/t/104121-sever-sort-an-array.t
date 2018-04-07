#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

use MONKEY-SEE-NO-EVAL;

golf-ok
    thaw-in  => &thaw,
    thaw-out => {.&thaw.List},
;

sub thaw ($string) { $string.subst(']', ',]', :g).EVAL.Array }

# {map {|+«.[0].reverse},m/:s([(\-?\d+)<?{[>=] $0}>] +)+/[0]}
# {(|+«.reverse for m/:s([(\-?\d+)<?{[>=] $0}>] +)+/[0;*;0])}
# {+«map |*.reverse,m/:s([(\-?\d+)<?{[>=] $0}>] +)+/[0;*;0]}

=finish
[1] -> [1]
[1, 1] -> [1, 1]
[1, 2] -> [1, 2]
[2, 1] -> [1, 2]
[2, 3, 1] -> [2, 1, 3]
[2, 1, 3] -> [1, 2, 3]
[2, 1, 2] -> [1, 2, 2]
[2, 1, 1] -> [1, 1, 2]
[3, 1, 1, 2] -> [1, 1, 3, 2]
[3, 2, 1, 2] -> [1, 2, 3, 2]
[3, 1, 2, 2] -> [1, 3, 2, 2]
[1, 3, 2, 2] -> [1, 2, 2, 3]
[1, 0, 5, -234] -> [0, 1, -234, 5]
[1, 0, 1, 0, 1] -> [0, 1, 0, 1, 1]
[1, 2, 3, 4, 5] -> [1, 2, 3, 4, 5]
[5, 4, 3, 2, 1] -> [1, 2, 3, 4, 5]
[2, 1, 5, 4, 3] -> [1, 2, 3, 4, 5]
[2, 3, 1, 5, 4] -> [2, 1, 3, 4, 5]
[5, 1, 4, 2, 3] -> [1, 5, 2, 4, 3]
[5, 2, 7, 6, 4, 1, 3] -> [2, 5, 1, 4, 6, 7, 3]
[-5, -2, -7, -6, -4, -1, -3] -> [-5, -7, -2, -6, -4, -3, -1]
[14, 5, 3, 8, 15, 7, 4, 19, 12, 0, 2, 18, 6, 11, 13, 1, 17, 16, 10, 9] -> [3, 5, 14, 8, 4, 7, 15, 0, 12, 19, 2, 6, 18, 11, 1, 13, 9, 10, 16, 17]
