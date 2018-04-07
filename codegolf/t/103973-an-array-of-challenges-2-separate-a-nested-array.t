#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

use MONKEY-SEE-NO-EVAL;

golf-ok
    thaw-in  => &thaw,
    thaw-out => &thaw,
;

sub thaw ($string) { $string.subst(']', ',]', :g).EVAL.Array }


# {sub a{$^a~~List??|[map {[$_]},|map &a,|$a]!!$a};[map &a,@_]}
# {sub f(\a){a~~List??|[map {[$_]},|map &f,|a]!!a};[.map: &f]}

=finish
[]                             -> []
[[1, 2]]                       -> [[1], [2]]
[3, [4, 5]]                    -> [3, [4], [5]]
[3, [3, [3]]]                  -> [3, [3], [[3]]]
[[6, [[7]]]]                   -> [[6], [[[7]]]]
[[5, 10], 11]                  -> [[5], [10], 11]
[1, [2, 3], [4, 4, [5, 2], 1]] -> [1, [2], [3], [4], [4], [[5]], [[2]], [1]]
