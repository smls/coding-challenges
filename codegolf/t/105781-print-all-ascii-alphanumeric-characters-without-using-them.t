#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-out => *.comb,
;

=finish
abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
