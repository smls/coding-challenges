#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in  => *.comb(/ \d+ /)».Int.Capture,
    thaw-out => *.comb(/ \d+ /)».Int,
;

=finish
0, 1000 -> 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 89, 135, 175, 518, 598
10, 20 -> 
1305, 1306 -> 1306
12157692622039623500, 12157692622039623600 -> 12157692622039623539
