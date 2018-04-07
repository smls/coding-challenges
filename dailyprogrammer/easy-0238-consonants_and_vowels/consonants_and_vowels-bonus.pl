#!/usr/bin/env perl

#-----------------------.
# Consonants and Vowels | <http://redd.it/3q9vpn> - incl. bonus challenge
#-----------------------'

# Also programmatically generates the list of consonants to ensure there are no
# typos.


my @vowels = qw(a e i o u);
my %vowels = map { $_ => 1 } @vowels;
my @consonants = grep { !$vowels{$_} } 'a'..'z';

chomp(my $pattern = readline);
die "Only v V c C are allowed in the input string.\n" if $pattern =~ /[^vVcC]/;

$pattern =~ s/v/   $vowels[rand @vowels]        /ge;
$pattern =~ s/V/uc $vowels[rand @vowels]        /ge;
$pattern =~ s/c/   $consonants[rand @consonants]/ge;
$pattern =~ s/C/uc $consonants[rand @consonants]/ge;

print "$pattern\n";
