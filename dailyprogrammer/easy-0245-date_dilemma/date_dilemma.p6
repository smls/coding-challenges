#!/usr/bin/env perl6

#--------------.
# Date Dilemma | <http://redd.it/3wshp>
#--------------'

for lines».comb(/<[0..9]>+/) {
    say Date.new: |(.[0].chars == 4 ?? (     .[0], .[1], .[2])
                                    !! (2000+.[2], .[0], .[1]))».Int
}

# 
# for lines».comb(/<[0..9]>+/) {
#     if .[0].chars == 4 { say Date.new:      .[0], .[1], .[2] }
#     else               { say Date.new: 2000+.[2], .[0], .[1] }
# }
