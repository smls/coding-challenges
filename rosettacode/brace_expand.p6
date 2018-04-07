#!/usr/bin/env perl6

grammar BraceExpansion {
    token TOP  { ( <meta> | . )* }
    token meta { '{' <alts> '}' | \\ .  }
    token alts { <alt>+ % ',' }
    token alt  { ( <meta> | <-[ , } ]> )* }
}
 
sub crosswalk($/) {
    [X~] '', $0.map: -> $/ { ([$<meta><alts><alt>.&alternatives]) or ~$/ }
}

sub alternatives($_) {
    when :not { () }
    when 1    { '{' X~ $_».&crosswalk X~ '}' }
    default   { $_».&crosswalk }
}

sub brace-expand($s) { crosswalk BraceExpansion.parse($s) }

sub bxtest(*@s) {
    for @s -> $s {
        say "\n$s";
        for brace-expand($s) {
            say "    ", $_;
        }
    }
}

bxtest Q:to/END/.lines;
    ~/{Downloads,Pictures}/*.{jpg,gif,png}
    It{{em,alic}iz,erat}e{d,}, please.
    {,{,gotta have{ ,\, again\, }}more }cowbell!
    {}} some }{,{\\{ edge, edge} \,}{ cases, {here} \\\\\}
    END
