#!/usr/bin/env perl6

#----------------.
# Guess Who(is)? | <http://redd.it/3xdmtw> - using a nested array
#----------------'



    sub ip-to-number ($ip) {
        do given $ip.split('.') {
            .[0] +< 24 +
            .[1] +< 16 +
            .[2] +<  8 +
            .[3] +<  0
        }
    }

sub MAIN ($ip-file, $query-file) {
    
    my $t;
    $t = now;
    
    my @addresses;
    
    my @ranges =
        $ip-file.IO.lines
        .race(batch => 1)
        .map({
            my ($start, $end, $name) = .split(' ', 3);
            $start = ip-to-number($start);
            $end   = ip-to-number($end);
            [$name, $start..$end, $end-$start]
            
        })
        .sort(*[2]);
    
    note "read time: ", now - $t;
    $t = now;
    
    for @ranges -> [$name, @range, $length] {
        say "$name {@range.gist}";
        @addresses[$_ div 65536][$_ % 65536] = $name for @range;
    }
    
    dd @ranges;
    note "index time: ", now - $t;
    $t = now;
    exit;
    
    for $query-file.IO.lines {
        my $ip = ip-to-number($_);
        say "$ip {@addresses[$ip div 65536][$ip % 65536] // '<unknown>'}";
    };
    
    note "lookup time: ", now - $t;
}
