#!/usr/bin/env perl6

#---------------.
# X-mass lights | <http://redd.it/3xpgj8>
#---------------'

sub MAIN ($led-V, $led-mA, $battery-V, $battery-mAh, $hours) {
    my $battery-mA = $battery-mAh / $hours;
    
    my $leds-serial   = Int($battery-V / $led-V);
    my $leds-parallel = Int($battery-mA / $led-mA);
    my $leds          = $leds-serial * $leds-parallel;
    
    my $resistor-V = $battery-V % $led-V;
    my $resistor-Ω = $resistor-V / $battery-mA * 1000;
    
    if $leds > 0 {
        say "Resistor: $resistor-Ω ohm";
        say "Scheme:";
        draw-circuit $leds-parallel, $leds-serial;
    }
}

sub draw-circuit ($parallel, $serial) {
    my $line = join '---', '|>|' xx $serial;
    my $padd = ' ' x $line.chars;
    
    .say for flat "*--$line--*",
                 (" | $padd | ",
                  " --$line-- ") xx $parallel-1;
}
