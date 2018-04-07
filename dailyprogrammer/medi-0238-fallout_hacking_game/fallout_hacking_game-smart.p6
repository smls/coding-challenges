#!/usr/bin/env perl6

#----------------------.
# Fallout Hacking Game | <http://redd.it/3qjnil> - with better word selection
#----------------------'

# Rather than simply choosing random words of a certain length, this version
# also requires a minimum number of total letter overlaps between them.
# 
# I used a naive brute-force implementation - it simply keeps choosing random
# sets of words of the correct length, until it finds a set that fulfills the
# overlap condition.


sub get-words ($difficulty) {
    my %setting =
        1 => (4     , 7),
        2 => (5..6  , 5),
        3 => (7..8  , 3),
        4 => (9..11 , 1),
        5 => (12..15, 0),
    ;
    my ($length, $similarity) = %setting{$difficulty}».pick;

    my @dict = 'enable1.txt'.IO.lines.grep(*.chars == $length);

    my @words = @dict.pick($length + 1)
        until letter-overlaps(@words) >= $similarity;
    @words;
}

sub letter-overlaps (*@words) {
    [+] ([Z] @words».fc».comb).map({ .elems - .Set.elems })
}

sub guess ($secret, $i) {
    my $word = prompt "Guess ({4 - $i} left)? ";
    ($secret.fc.comb Z $word.fc.comb).flat.grep(* eq *).elems;
}

sub play {
    my $difficulty = +prompt 'Difficulty (1-5)? ';
    my @words = get-words $difficulty;

    say .uc for @words;

    my $secret = @words.pick;
    my $l = $secret.chars;

    for ^4 {
        my $g = guess $secret, $_;
        if $g == $l { say 'You win !'; return }
        else        { say "$g/$l correct" }
    }

    say "You lose, the word was $secret"
}

play;
