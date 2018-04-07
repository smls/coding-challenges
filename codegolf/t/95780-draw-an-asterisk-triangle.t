#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.Int,
    thaw-out => *.Str,
;

=finish
1

*

4

*
**
***
****

5

*
**
***
****
*****
