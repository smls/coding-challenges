#!/usr/bin/env perl

#-----------------.
# Brace expansion |
#-----------------'

# For the task: https://rosettacode.org/wiki/Brace_expansion
# Language: Perl
# Author: Sam S <smls75@gmail.com>

# Not submitted, because it doesn't comply with the exact task requirements.


use warnings;
use strict;

use File::Glob qw(:bsd_glob);

sub brace_expand {
    my $input = shift;
    
    return bsd_glob($input, GLOB_BRACE | GLOB_QUOTE | GLOB_NOCHECK);
}


$| = 1;
while ($_ = <>) {
    chomp($_);
    print "$_\n" =~ s///r for brace_expand $_;
    print "\n";
}
