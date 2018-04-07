#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.lines.map(*.substr(1)).Array,
;

=finish
|SIMPLE

SIMPLE

|POLLS
|EPEES

PEOPLELESS

|LYES
|APRONS

LAYPERSONS

|ABCDE
|a c
|123 567

Aa1B 2Cc3D E567

|"\n$?*
|
|,(.)" 

",\(n.$)?"* 
