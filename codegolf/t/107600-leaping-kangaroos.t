#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in  => *.Int,
;

=finish
1

o

2

 o o
o o o

3

  o   o   o   o
 o o o o o o o o
o   o   o   o   o

4

   o     o     o     o     o     o     o     o
  o o   o o   o o   o o   o o   o o   o o   o o
 o   o o   o o   o o   o o   o o   o o   o o   o
o     o     o     o     o     o     o     o     o
