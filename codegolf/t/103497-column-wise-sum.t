#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.lines.map(*.words».Int).List,
    thaw-out => *.words».Int,
;

=finish
0

0

1
1 1 1 1

2 1 1 1

1
1 2
1 2 3
1 2 3 4

4 6 6 4

 1 6 2 -6
-1 2 3  5

 0 8 5 -1
