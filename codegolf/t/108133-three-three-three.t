#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    code-constraint => &check,
    test-cases => [ (Nil) => &check ],
    :!chomp,
;

sub check ($str) {
    .values.all %% 3 and .elems >= 3 given $str.comb.Bag
}
