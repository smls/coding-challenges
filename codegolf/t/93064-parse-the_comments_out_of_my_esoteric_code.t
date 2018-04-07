#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.lines,
;

=finish
hello         #Line one
              #Line two
       world! #Line three

hello  world!

E                                                   #This comment intentionally left blank
 ac                                                 #
   h s                                              #
      ecti                                          #
          on is                                     #
                one c                               #
                     haracte                        #
                            r longer                #
                                     than the       #
                                              last! #

Each section is one character longer than the last!

4          #This number is 7
 8         #
  15       #That last comment is wrong.
    16     #
      23   #
        42 #

4815162342

Hello                     #Comment 1
      world               #Comment 2
           ,              #Comment 3
             how          #Comment 4
                 are      #Comment 5
                     you? #Comment 6

Hello world, how are you?

Prepare                               #
        for...                        #
                        extra spaces! #

Prepare for...          extra spaces!
