#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in  => *.lines,
    thaw-out => *.lines.map(*.split("  ").map(*.words.reverse».Int)),
;

=finish
##

0 0  1 0

    #
#####
#

4 0
0 1  1 1  2 1  3 1  4 1
0 2

# ###
### #

0 0  2 0  3 0  4 0
0 1  1 1  2 1  4 1
