#!/usr/bin/env perl6

#-------------------------------------.
# Mini Challenge: Palindromic Numbers | <http://redd.it/3o4tpz>
#-------------------------------------'

say (0..*).map(*.base: 2).grep: { $_ eq .flip }
