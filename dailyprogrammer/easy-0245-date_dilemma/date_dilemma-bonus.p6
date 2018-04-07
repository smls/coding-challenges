#!/usr/bin/env perl6

#--------------.
# Date Dilemma | <http://redd.it/3wshp>
#--------------'

    my $today = Date.new(2014, 12, 24);

    grammar MessyDate {
        rule TOP {
            |    <date>                 { make $<date>.made }
            | :i <duration> ago         { make $today.earlier: |$<duration>.made }
            | :i <duration> from <date> { make $<date>.made.later: |$<duration>.made }
        }
        
        rule date {
            | [ || <month> (<sep>?) <day>   [$0 <year>]?
                || <day>   (<sep>?) <month> [$0 <year>]?
                || <year>  (<sep>?) <month>  $0 <day>    ]
              { make Date.new: $<year>.made//$today.year, |$<month day>».made }
            
            | :i today          { make $today }
            | :i yesterday      { make $today - 1 }
            | :i tomorrow       { make $today + 1 }
            | :i last <weekday> { make $today - ($today.day-of-week - $<weekday>.made) % 7 || 7 }
            | :i next <weekday> { make $today + ($<weekday>.made - $today.day-of-week) % 7 || 7 }
            | :i last <unit>    { make $today.earlier: |($<unit>.made => 1) }
            | :i next <unit>    { make $today.later:   |($<unit>.made => 1) }
        }
        
        rule duration {
            <count> <unit> { make $<unit>.made => $<count>.made }
        }
        
        token year {
            | <number(4)>        { make +$<number> }
            | <number(2, 0..49)> { make 2000 + $<number> }
            | <number(2, 50..*)> { make 1900 + $<number> }
        }
        
        token month {
            | <number(1..2, 1..12)> { make +$<number> }
            | :i Jan[uary]?   { make  1 }
            | :i Feb[ruary]?  { make  2 }
            | :i Mar[ch]?     { make  3 }
            | :i Apr[il]?     { make  4 }
            | :i May          { make  5 }
            | :i Jun[e]?      { make  6 }
            | :i Jul[y]?      { make  7 }
            | :i Aug[ust]?    { make  8 }
            | :i Sep[tember]? { make  9 }
            | :i Oct[ober]?   { make 10 }
            | :i Nov[ember]?  { make 11 }
            | :i Dec[ember]?  { make 12 }
        }
        
        token day { <number(1..2, 1..31)> { make +$<number> } }
        
        token weekday {
            | :i Mon[day]?    { make 1 }
            | :i Tue[sday]?   { make 2 }
            | :i Wed[nesday]? { make 3 }
            | :i Thu[rsday]?  { make 4 }
            | :i Fri[day]?    { make 5 }
            | :i Sat[urday]?  { make 6 }
            | :i Sun[day]?    { make 7 }
        }
        
        token sep   { <[-/.\h]> }
        token count { (<[0..9]>+) { make +$0 }  |  an? { make 1 } }
        token unit  { :i (day|week|month|year) s? { make $0.lc } }
        
        multi token number ($digits)        {  <[0..9]> ** {$digits} }
        multi token number ($digits, $test) { (<[0..9]> ** {$digits}) <?{ +$0 ~~ $test }> }
    }

    for lines() {
        say MessyDate.parse($_).made // "failed to parse '$_'";
    }


