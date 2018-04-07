#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-out => *.Int,
;

=finish
0 -> 0
1 -> 1
0! -> 1
1! -> 1
!0 -> 1
!1 -> 0
!0! -> 0
!1! -> 0
0!! -> 1
1!! -> 1
!!0 -> 0
!!1 -> 1
!0!! -> 0
!!!1 -> 0
!!!0!!!! -> 0
!!!1!!!! -> 0
