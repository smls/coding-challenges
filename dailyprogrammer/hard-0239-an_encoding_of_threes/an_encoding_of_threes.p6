#!/usr/bin/env perl6

#-----------------------.
# An Encoding of Threes | <http://redd.it/3rrtxh> - memoized recursive solution
#-----------------------'

# Rather slow, even with the "is cached" memoization. A potentially faster
# solution would be to build a trie from the dictionary and use that to prune
# search branches which don't produce prefixes of valid words. But I did not
# have an efficient trie implementation at hand, so I'm pruning only branches
# which don't produce ASCII letter sequences at all.


my $dict = 'inc/enable1.txt'.IO.words.map(*.lc).Set;
.say for threes-decode(get).grep({ $dict{.lc} });

say threes-decode(get);

sub threes-decode ($N, $path = '') is cached {
    my @next;
    state %allowed = ("a".."z", "A".."Z").flat».ord».base(3)».Str.Set;
    
    if $path.chars >= 4 and %allowed{$path} {
        my $letter = :3("$path").chr;
        return $letter if $N == 1;s
        @next.push: ('', $letter);
        @next.push: ($path, '') if $path.chars == 4;
    }
    else {
        return Empty if $path eq "0" or $path.chars == 5;
        @next.push: ($path, '');
    }
    
    return Empty if $N <= 1;
    
    [@next.map: -> [$path, $letter] {
        slip $letter «~« (-2..2).map: {
            |threes-decode ($N + $_) div 3, $path~.abs, if ($N + $_) %% 3
        }
    }];
}
