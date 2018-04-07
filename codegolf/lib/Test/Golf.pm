use v6;
use Test;
use Test::Golf::Snippet;

unit module Test::Golf;

#| Test if all code golf snippets associated with the calling test file,
#| satisfy the given test cases.
#| Golf snippets are expected to be in the parent directory of the test file's
#| directory, and have the same filename except with a different suffix in
#| place of ".t".
#| If no test-cases are passed, the test file's `=finish` block is used,
#| interpreted as alternating input and output strings separated by double
#| newlines.
multi golf-ok (
  $solution?,
  :@test-cases!,     #= List of input=>output pairs
  :&thaw-in,         #= Callback for deserializing an input string
  :&thaw-out,        #= Callback for deserializing an expected output string
  :&thaw-result,     #= Callback for deserializing a result string
  :&normalize-result,#= Callback for normalizing a result string
  :&extract-code,    #= Regex or callback for extracting the portion of a golf
                     #= snippet to be tested
  :&code-constraint, #= A condition to test the source code itself against
  :$run-from-file,   #= Whether to treat it as a self-modifying program
  :$chomp = True,    #= Whether to chomp outputs of STDOUT-based solutions
  :$skip             #= Whether to skip all the tests (value = message string)
) is export {
    my $test-file = $*PROGRAM;
    my $name = $test-file.basename.subst(/'.t' $/, '')
        ~ (".$solution" if $solution);
    
    my @golf = $test-file.parent.parent.child('src')
        .dir(test => /^ $name < - .>/)
        .map({ Golf::Snippet.new:
            file => $_,
            :&extract-code,
            :$run-from-file,
            :$chomp,
        })
    ;
    END {done-testing}
    
    if ($skip) {
        my $test-count = @golf * @test-cases;
        
        skip($skip);
        return;
    }
    
    my @thawed = do if &thaw-in or &thaw-out {
        do (&thaw-in ?? thaw-in(.key) !! .key) =>
        (&thaw-out ?? thaw-out(.value) !! .value) for @test-cases
    }
    
    for @golf -> $golf {
        given $golf.bytes, $golf.chars -> ($b, $c) {
            diag "$b bytes{", $c characters" if $c != $b}";
        }
        
        if &code-constraint {
            ok code-constraint($golf.code), "{$golf.name} - code constraint";
        }
        
        my @tests := ($golf.serialize-input || !@thawed ?? @test-cases
                                                        !! @thawed);
        
        for @tests {
            my \input = .key;
            my \expected = .value;
            
            my \result = do given input {
                when Capture { $golf.run(|input) }
                when Nil     { $golf.run() }
                default      { $golf.run(input) }
            }
            
#             (result ~~ Seq ?? result.cache !! result).&{
            
            my \got = (result)\
                .&{ $_ ~~ Seq                              ?? .cache             !! $_ }\
                .&{ &&normalize-result                     ?? .&normalize-result !! $_ }\
                .&{ &thaw-result && $golf.serialize-output ?? .&thaw-result      !! $_ }
            
            my $test-name = $golf.name ~
                (input~~Nil ?? " (no input)" !! " {pretty-print input}");
            
            is-structurally expected, got, $test-name;
        }
        
        $golf.clean-up;
    }
}

multi golf-ok (Str :$test-cases!, :&split-data, *@_, *%c) {
    golf-ok test-cases => (&split-data
        ?? split-data($test-cases).map({ $_ ~~ Pair ?? $_ !! [=>] $_ })
        !! parse-testcases $test-cases), |@_, |%c
}

multi golf-ok (*@_, *%c) {
    golf-ok test-cases => CALLER::<$=finish>, |@_, |%c
}

sub parse-testcases ($raw) {
    my \a = do given $raw.chomp {
        my @arrow = '->', '→';
        if .lines.all.comb(/" " @arrow " "/) == 1 {
            .lines.map({ [=>] .split(/" "+ @arrow " "/) })
        }
        elsif /\n\n/ {
            .split("\n\n").pairup
        }
        else {
            ((Nil) => $_,)
        }
    }
    a
}

sub is-structurally (Mu \expected, Mu \got, $test-name) {
    given expected {
        when Junction          { ok got eqv expected,      $test-name }
        when Callable {
            if .count == 1     { ok ?expected.(got),        $test-name }
            else               { ok ?expected.(got, expected), $test-name }
        }
        default {
            if got ~~ Junction { is-deeply ?got, expected,  $test-name }
            else               { is-deeply got, expected,  $test-name }
        }
    }
}


#----[ Helper functions ]----

#| Pretty-print a Perl 6 value/object for use in TAP output
sub pretty-print (\value) {
    my $gist = "«{value.gist.subst: "\n", '␤', :g}»";
}


# sub is-threeway ($in, $out, $expected) {
#     if not @$out eqv @$expected {
#         say table(
#             <in want got>,
#             |roundrobin @$in, @$expected, @($out // ('' xx @$in))
#         ).indent(1);
#         exit;
#     }
# }

# sub table (+lol ($head, **@body)) {
#     my @widths = (zip lol).map: *.map(*.chars).max;
#     my $format = (" %-{$_}s " for @widths).join('|') ~ "\n";
#     [~] (sprintf $format, |$head),
#         ('-' x $_+2 for @widths).join('+') ~ "\n",
#         |(sprintf $format, .map(*.Str) for @body)
# }
