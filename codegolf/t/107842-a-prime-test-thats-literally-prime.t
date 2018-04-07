#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    code-constraint => *.ords.sum.is-prime,
;

=finish
2 -> True
3 -> True
4 -> False
15 -> False
17 -> True
