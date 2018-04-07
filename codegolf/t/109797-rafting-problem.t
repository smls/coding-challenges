#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;
use MONKEY-SEE-NO-EVAL;

golf-ok
    thaw-in => *.EVAL.Capture,
    thaw-out => *.EVAL».Bag.Bag,
    normalize-result => *».Bag.Bag,
;


=finish
6,  [2,5]         -> [5], [2]
4,  [1,1,1,1,1]   -> [1,1,1], [1,1]
6,  [2,3,2]       -> [2,2], [3]
6,  [2,3,2,3]     -> [2,3], [2,3]
6,  [2,3,2,3,2]   -> [2,2,2], [3,3]
12, [10,8,6,4,2]  -> [10], [8,2], [6,4]
6,  [4,4,4]       -> [4], [4], [4]
12, [12,7,6,6]    -> [12], [7], [6,6]
