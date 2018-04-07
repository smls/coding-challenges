#!/usr/bin/env perl6

#--------------------------------------.
# Mini Challenge: Multiplication table | <http://redd.it/3o4tpz>
#--------------------------------------'

my $n = +get;
my $format = " %{chars $n * $n}d" x $n;

say sprintf $format, (1..$n X* $_) for 1..$n;
