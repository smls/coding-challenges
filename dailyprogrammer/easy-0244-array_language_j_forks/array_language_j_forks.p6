#!/usr/bin/env perl6

#-----------------------------------.
# Array language (part 3) - J Forks | <http://redd.it/3wdm0w>
#-----------------------------------'

sub sum    ($y, $x=0) { $y.sum + $x   }
sub count  ($y, $x=0) { $y.elems + $x }
sub divide ($y, $x=1) { $y / $x       }

multi Fork (&f, &g, &h) {
    sub (|args) { g f(|args), h(|args) }
}
multi Fork (&f, &g, *@rest where * !%% 2) {
    sub (|args) { g f(|args), Fork(|@rest)(|args) }
}

say Fork(&sum, &divide, &count)([1, 2, 3, 4, 5]);
say Fork(&sum, &divide, &sum, &divide, &count)([1, 2, 3, 4, 5]);
