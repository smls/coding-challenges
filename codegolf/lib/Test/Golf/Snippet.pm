use v6;
use Test::Golf::Runners;

#| A program or fragment of golf code
unit class Golf::Snippet;

#----[ Public attributes ]----

has Str $.name;   #= Name identifying this golf code snippet.
has Str $.code;   #= It's actual source code.
has Int $.bytes;  #= The length of its source code, in bytes.
has Int $.chars;  #= The length of its source code, in Unicode graphemes.

has Bool $.serialize-input;  #= Whether it expects serialized input.
has Bool $.serialize-output; #= Whether it returns serialized output.

has IO::Path $.path;  #= It's path, in case it is stored in the filesystem.

#----[ Private attributes ]----

has &!run;

#----[ Methods ]----

#| Constructor
submethod BUILD (
    IO::Path :$file!,  #= The file that the contains the source code of the golf
                       #= snippet. (Type is inferred from filename.)
    :&extract-code,    #= Callback or regex to extract the relevant source code.
                       #= (By default, the file's whole content is used.)
    :$run-from-file,   #= Whether to run the code from a stand-alone temporary
                       #= file in the filesystem (e.g. for self-modifying code).
    :$chomp = True,    #= Whether to chomp serialized outputs
) {
    $!name = $file.basename;
    
    $!code = $file.slurp.chomp;
    with &extract-code {
        when Regex    { $!code = ~$!code.match(&extract-code) }
        when Callable { $!code = extract-code $!code }
    }
    
    ($!chars, $!bytes) = $!code.chars, $!code.encode.bytes;
    
    (my &generate-runner, $!serialize-input, $!serialize-output)
        = Golf::Runners::choose($file);
    
    if $run-from-file {
        $!path = $*SPEC.tmpdir.child("golf-{^99999 .pick}-$!name");
        $!path.spurt: $!code;
        &!run = generate-runner $!path;
    }
    else {
        &!run = generate-runner $!code;
    }
    
    &!run = &chomp o &!run if $chomp and $!serialize-output;
}

#| Execute the code snippet
method run (|c) { &!run(|c) }

#| Call this when the snippet is no longer needed.
method clean-up {
    .unlink with $!path;
    &!run = { die "Can't run golf snippet after calling `clean-up`." };
}
