#!/usr/bin/env perl6

#----------------------.
# Jenny's Fruit Basket | <http://redd.it/3v4zsf> - Iterative bruteforce solution
#----------------------'

my @fruits = lines».split(" ").sort(+*[1]);
my @names  = @fruits»[0];
my @prices = @fruits»[1]».Int;

for find-coefficients(500, @prices) -> @quantities {
    say "$j: ", (@names Z @quantities)
        .map(-> [$name, $qty] { "$qty $name"~("s" if $qty > 1) if $qty })
        .join(", ");
}

sub find-coefficients ($goal, @terms) {
    gather {
        my @coefficients;
        
        loop (my $i = 0; $i < @terms; @coefficients[$i]++) {
            given [+](@coefficients Z* @terms) <=> $goal {
                when Less { $i = 0                      }
                when More { @coefficients[$i] = 0; $i++ }
                when Same { take @coefficients.values }
            }
        }
    }
}
