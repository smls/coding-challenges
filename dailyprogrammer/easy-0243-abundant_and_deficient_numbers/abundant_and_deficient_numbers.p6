#!/usr/bin/env perl6

#--------------------------------.
# Abundant and Deficient Numbers | <http://redd.it/3uuhdk>
#--------------------------------'

# for lines() -> $n {
#     given (1..$n/2).grep($n %% *).sum {
#         when * > $n { say "$n abundant by {$_ - $n}" }
#         when * < $n { say "$n deficient" }
#         default     { say "$n neither" }
#     }
# }

for lines() -> $n {
    my $sum = (1..$n/2).grep($n %% *).sum;
    say "$n " ~ ($sum > $n ?? "abundant by {$sum - $n}" !!
                 $sum < $n ?? "deficient" !! "neither");
}
