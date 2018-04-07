#!/usr/bin/perl


sub tokenize {
    my ($string, $sep, $esc) = (shift, quotemeta shift, quotemeta shift);
    
    my @fields = $string =~ /\G (?:^ | $sep) \K (?: [^$sep$esc] | $esc.)*/gsx;
    return map { s/$esc(.)/$1/gsr } @fields;
}

sub tokenize {
    my ($string, $sep, $esc) = (shift, quotemeta shift, quotemeta shift);
    my @fields = split /$esc . (*SKIP)(*FAIL) | $sep/sx, $string, -1;
    return map { s/$esc(.)/$1/gsr } @fields;
}


print "'$_'\n" for tokenize("one^|uno||three^^^^|four^^^|^cuatro|", '|', '^');
