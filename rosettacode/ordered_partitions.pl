#!/usr/bin/env perl

#--------------------.
# Ordered_Partitions |
#--------------------'

# For the task: http://rosettacode.org/wiki/Ordered_Partitions
# Language: Perl
# Author: Sam S <smls75@gmail.com>

# This one I didn't develop from scratch, but rather translated it from the
# Perl 6 solution by TimToady on the same page.


use strict;
use warnings;
use List::Util 1.33 qw(sum pairmap);

sub partition {
    my @mask = @_;
    my $last = sum @mask or return [map {[]} 0..$#mask];
    
    return pairmap {
        $b ? do {
            local $mask[$a] = $b - 1;
            map { push @{$_->[$a]}, $last; $_ }
                partition(@mask);
        } : ()
    } %mask[0..$#mask];
}

# Output:

print "(" . join(', ', map { "{".join(', ', @$_)."}" } @$_) . ")\n"
    for partition( @ARGV ? @ARGV : (2, 0, 2) );

# The set of ordered partitions is not necessarily returned in lexicographical order itself; but it's supposed to be a *set* so that's hopefully okay.
