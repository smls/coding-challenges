#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-out => {?/True/},
;

=finish
ABCDEF -> True
ZYX    -> True
no     -> True
tree   -> True
q      -> True
ABCDC  -> False
yes    -> False
deed   -> False
