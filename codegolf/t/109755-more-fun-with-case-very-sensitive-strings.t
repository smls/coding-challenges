#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok split-data => *.split("\n\n")».lines;

=finish
A
A

Ok
Ok

OK
KO

Hello, World!
Wdlro, Holle!

0123456789
0123456789

The quick brown Fox jumps over the lazy doge
Feg odyza lehtr Tev ospmu jxon wor bkci uqeh

odd
ddo

racecar
racecar

EtOn Em OsN R AaToNsIsIhT!!1!
ThIs Is NoT A RaNsOmEnOtE!!1!
