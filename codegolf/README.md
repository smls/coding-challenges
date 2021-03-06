# My [codegolf.stackexchange.com](https://codegolf.stackexchange.com/) Code Submissions

In this folder, I keep many of the solutions I've written for code-golf challenges at the [Programming Puzzles & Code Golf](https://codegolf.stackexchange.com/) StackExchange site, together with unit tests.


## Statistics

|                          |         |
|--------------------------|--------:|
| Code solutions:          | **116** |
| Enabled unit test files: |  **99** |
| Enabled unit tests:      | **891** |

Currently, all of these are written in the [Perl 6](https://perl6.org/) programming language, but I may write solutions in other languages in the future.

These aren't _all_ the solutions I've submitted &ndash; you can browse all [over on StackExchange](https://codegolf.stackexchange.com/users/14880/smls?tab=answers).


## Running unit tests

To run _all_ the unit test, fire the following shell command in this folder *(requires both Perl and Perl 6 installed, and takes around 3 minutes on my machine)*:

    prove -e perl6 t

To run tests for a single task, simply run one of the files in the `t` folder, such as *(requires only Perl 6 installed)*:

    t/108675-is-this-word-lexically-ordered.t

Note that some of the code solutions may cause warnings to be printed to STDERR when run, that should be ignored. The code-golf challenges allowed this.


## Repository structure

#### Solution files

Each code solution is represented by a file in the `src` directory, with a file name constructed as follows:

```
108675-is-this-word-lexically-ordered               -- task ID
                                     .2             -- solution index (optional)
                                       .function.p6 -- extension
```

#### Task URLs

The task ID is derived from the task URL &ndash; in the example shown above, this would be:  
https://codegolf.stackexchange.com/questions/108675/is-this-word-lexically-ordered


#### Solution types

The file extension specifies how the code solution should be parsed/interpreted:

| Extension      | Must be parsed as | Input             | Output
|---------------:|-------------------|-------------------|------------------------------
| `.function.p6` | Perl 6 function¹  | Function argument | Function return value
| `.mutator.p6`  | Perl 6 function¹  | Function argument | Function argument (modified)
| `.printer.p6`  | Perl 6 function¹  | Function argument | STDOUT
| `.p6`          | Perl 6 program    | STDIN             | STDOUT

<sup>1) Meaning a Perl 6 subroutine, block lambda, or [WhateverCode](https://docs.perl6.org/type/Whatever)-lambda.</sup>

#### Unit test files

The unit test files live in the `t` folder, with a file name consisting of the task ID in question and the extension `.t`.

They use a custom data-driven test framework I've written in Perl 6, that resides in the `lib` folder.
