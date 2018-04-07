#!/usr/bin/env perl6

#----------------------.
# Jenny's Fruit Basket | <http://redd.it/3v4zsf> - Dynamic programming solution
#----------------------'

my @fruits = lines».split(" ").sort(-*[1]);
my @names  = @fruits»[0];
my @prices = @fruits»[1]».Int;

my $j = 0;
for find-coefficients(500, @prices) -> @quantities {
    say "$j: ", (@names Z @quantities)
        .map(-> [$name, $qty] { "$qty $name"~("s" if $qty > 1) if $qty })
        .join(", ");
}
say $j;

sub find-coefficients ($goal, @terms) {
    gather {
        my @initial = 0 xx @terms;
        
        my %partials = (0 => [@initial,]);
        my @todo = (@initial,);
        my %seen-partials := SetHash.new;
        my %seen-solutions := SetHash.new;
        
        while @todo {
            $j++;
            my @current := @todo.shift;
            my $sum = [+] @current Z* @terms;
            
            next if $sum > $goal;
            
            %partials{$sum}.push: @current;
            
            # Find solutions by adding known partials to the current partial
            for %partials{$goal - $sum}[*] -> @known {
                .take if !%seen-solutions{~$_}++ given list @current Z+ @known;
            }
            
            # Schedule additional iterations
            if $sum <= $goal div 2 {
                for @terms.keys {
                    my @next = @current;
                    @next[$_]++;
                    @todo.push: @next if !%seen-partials{~@next}++;
                }
            }
        }
    }
}
