#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    extract-code => {S:g/\n//},
    thaw-in => *.comb(/\d+/)».Int.Capture,
    thaw-out => *.lines».comb(/\w+/)».List.any,
;

=finish
1 1

|WC

1 2

|WC C CC
|WC W WC
|CC C WC

2 2

|WW W CC C WC
|WW W CC W WW
|WC C CC C WC
|WC C CC W WW
