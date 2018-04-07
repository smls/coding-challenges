#!/usr/bin/env perl6

#------------------.
# A Game of Threes | <http://redd.it/3r7wxz>
#------------------'

my $num = +get;

while $num != 1 {
    given $num % 3 {
        when 0 { say "$num 0"             }
        when 1 { say "$num -1"; $num -= 1 }
        when 2 { say "$num 1" ; $num += 1 }
    }
    $num /= 3;
}

say 1;
