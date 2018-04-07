#!/usr/bin/env perl6

#-----------------.
# Set Game Solver | <http://redd.it/3ke4l6>
#-----------------'

for lines.combinations(3) -> @cards {
    say @cards.join(" ") if all(zip(@cards».comb)».unique) == 1|3;
}
