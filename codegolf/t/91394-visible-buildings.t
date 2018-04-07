#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in  => *.Int,
    thaw-out => *.lines.map(*.comb),
;

=finish
1

@

3

***
*@*
***

5

 * * 
*****
 *@* 
*****
 * * 

7

 ** ** 
* * * *
*******
  *@*  
*******
* * * *
 ** ** 
