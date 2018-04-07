#!/usr/bin/env perl6

#----------------------.
# Fallout Hacking Game | <http://redd.it/3qjnil>
#----------------------'

# Translation of someone else's Python 3 solution: https://yy.reddit.com/r/dailyprogrammer/comments/3qjnil/20151028_challenge_238_intermediate_fallout/cwfrzpm


sub get-words ($difficulty) {
    my %lengths = 1 => 4..6,   2 => 7..8,  3 => 9..11,
                  4 => 12..13, 5 => 14..15;

    my $length = %lengths{$difficulty}.pick;

    'inc/enable1.txt'.IO.lines.grep(*.chars == $length).pick($length + 1);
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
