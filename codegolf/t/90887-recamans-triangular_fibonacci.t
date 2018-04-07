#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    extract-code => *.trans("\n"=>'')
;

=finish
1n3x(r+f)*3

0
6
12
24

1nx(rf)-3

-3
