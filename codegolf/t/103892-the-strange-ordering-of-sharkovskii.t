#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
#     thaw-in => {(.words».Int.Array,).Capture},
    thaw-in => *.words».Int.Capture,
    thaw-out => {?/True/},
;

# {my \u=*>.max;.[0]==first .any,flat [1,2,4...u].&{(3*$_,5*$_...u for $_),.reverse}}
# 
# {my \u=*>@_.max;@_[0]==first @_.any,flat [1,2,4...u].&{(3*$_,5*$_...u for $_),.reverse}}
# 
# ->\a,\b{my \u=*>max a,b;a==first a|b,flat [1,2,4...u].&{(3*$_,5*$_...u for $_),.reverse}}

=finish
3 11      -> True
9 6       -> True
48 112    -> True
49 112    -> True
158 158   -> True
36 24     -> True
14 28     -> True
144 32    -> True
32 32     -> True
32 8      -> True
3 1       -> True
1 1       -> True
1 2       -> False
1 5       -> False
11 5      -> False
20 25     -> False
2 8       -> False
256 255   -> False
256 257   -> False
72 52     -> False
2176 1216 -> False
2176 2496 -> False
