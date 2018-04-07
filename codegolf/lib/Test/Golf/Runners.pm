use v6;
use MONKEY-SEE-NO-EVAL;

unit module Golf::Runners;

#| Given a filename, return:
#| * A function generator.
#| * A Bool saying whether it expects input in serialized form.
#| * A Bool saying whether it returns output in serialized form.
our sub choose ($_) {
    when /'.function.p6' $/ { &perl6-function-runner, False, False }
    when / '.printer.p6' $/ { &perl6-printer-runner,  False, True  }
    when / '.mutator.p6' $/ { &perl6-mutator-runner,  False, False }
    when /         '.p6' $/ { &perl6-oneliner-runner, True,  True  }
    default { die "Don't know how to run snippet '$_'." }
}


#----[ Runners ]----

#| Turn the source code of a Perl 6 function, into a function object
sub perl6-function-runner (Str $code) {
    EVAL "($code)";
}

#| Turn the source code of a Perl 6 block that prints to STDOUT, into a function object
sub perl6-printer-runner (Str $code) {
    -> |input { run-prog «perl6 -e "($code)(|{input.perl})"» }
}

#| Turn the source code of a Perl 6 block that mutates its argument, into a function object
sub perl6-mutator-runner (Str $code) {
    my &f = EVAL "($code)";
    -> \input {
        my \output = input.perl.EVAL;
        f output;
        output
    }
}

#| Turn the source code of a Perl 6 program that prints to STDOUT, into a function object
multi perl6-oneliner-runner (Str $code) {
    ({ run-prog «perl6 -e "$code"», |@_ })
}

#| Turn the source code of a Perl 6 program that prints to STDOUT, into a function object
multi perl6-oneliner-runner (IO::Path $file) {
    ({ run-prog «perl6 "$file"», |@_ })
}

#----[ Helper functions ]----

#| Run a program, optionally passing a given input string to its STDIN,
#| and return the STDOUT output as a string
multi run-prog (@command, $input) {
    my $in = run('echo', $input, :out).out;
    run(|@command, :$in, :out).out.slurp-rest
}
multi run-prog (@command) {
    run(|@command, :out).out.slurp-rest
}
