#!/usr/bin/env perl6

#--------------------------------------.
# Dinesman's multiple-dwelling problem |
#--------------------------------------'

# For the task: https://rosettacode.org/wiki/Dinesman%27s_multiple-dwelling_problem
# Language: Perl 6
# Author: Sam S <smls75@gmail.com>


sub parse_and_solve ($text) {
    my %ids;
    my $expr = (grammar {
        rule TOP { <fact>+ { make join ' && ', $<fact>».made } }
        
        rule fact { <name> (not)? <position>
                    { make sprintf $<position>.made.fmt($0 ??  "!(%s)" !! "%s"),
                                   $<name>.made }
        }
        rule position {
            || on bottom             { make "\@f[%s] == 1"                            }
            || on top                { make "\@f[%s] == +\@f"                         }
            || lower than <name>     { make "\@f[%s] < \@f[{$<name>.made}]"           }
            || higher than <name>    { make "\@f[%s] > \@f[{$<name>.made}]"           }
            || directly below <name> { make "\@f[%s] == \@f[{$<name>.made}] - 1"      }
            || directly above <name> { make "\@f[%s] == \@f[{$<name>.made}] + 1"      }
            || adjacent to <name>    { make "\@f[%s] == \@f[{$<name>.made}] + (-1|1)" }
            || on <ordinal>          { make "\@f[%s] == {$<ordinal>.made}"            }
            || { note "Failed to parse line " ~ +$/.prematch.comb(/^^/); exit 1; }
        }
        
        token name    { :i <[a..z]>+              { make %ids{~$/} //= (state $)++ } }
        token ordinal { [1st | 2nd | 3rd | \d+th] { make +$/.match(/(\d+)/)[0]     } }
    }).parse($text).made;
    
    EVAL 'for [1..%ids.elems].permutations -> @f {
              say %ids.kv.map({ "$^a=@f[$^b]" }) if (' ~ $expr ~ ');
          }'
}

parse_and_solve Q:to/END/;
    Baker not on top
    Cooper not on bottom
    Fletcher not on top
    Fletcher not on bottom
    Miller higher than Cooper
    Smith not adjacent to Fletcher
    Fletcher not adjacent to Cooper
    END
