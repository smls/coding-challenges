#!/usr/bin/env perl6

react {
    my $port = 4004;
    my %connections;
    
    whenever IO::Socket::Async.listen('localhost', $port) -> $conn {
        my $name;
        
        $conn.print: "Please enter your name: ";
        
        whenever $conn.Supply(:enc<utf8>).lines -> $message {
            if !$name {
                if %connections{$message} {
                    $conn.print: "Name already taken, choose another one: ";
                }
                else {
                    $name = $message;
                    %connections{$name} = $conn;
                    broadcast "+++ %s arrived +++", $name;
                }
            }
            else {
                broadcast "%s> %s", $name, $message;
            }
            LAST {
                broadcast "--- %s left ---", $name;
                %connections{$name}:delete;
            }
            QUIT {
                default { say .perl; }
            }
        }
    }
    
    sub broadcast ($format, $from, *@message) {
        my $text = sprintf $format, $from, |@message;
        say $text;
        for %connections.kv -> $name, $conn {
            $conn.print: "$text\n" if $name ne $from;
        };
    }
    
    say "Listening on port $port";
}

say "Quitting.";
