#!/usr/bin/env perl6

role Cish::Tokens {
    token OP_MULTIPLY   { '*'  }
    token OP_DIVIDE     { '/'  }
    token OP_ADD        { '+'  }
    token OP_SUBTRACT   { '-'  }
    token OP_LESS       { '<'  }
    token OP_LESSEQUAL  { '<=' }
    token OP_GREATER    { '>'  }
    token OP_NOTEQUAL   { '!=' }
    token OP_ASSIGN     { '='  }
    token OP_AND        { '&&' }
    
    token LEFTPAREN     { '(' }
    token RIGHTPAREN    { ')' }
    token LEFTBRACE     { '{' }
    token RIGHTBRACE    { '}' }
    token SEMICOLON     { ';' }
    token COMMA         { ',' }
    
    token KEYWORD_IF    { 'if'    <|w> }
    token KEYWORD_WHILE { 'while' <|w> }
    token KEYWORD_PRINT { 'print' <|w> }
    token KEYWORD_PUTC  { 'putc'  <|w> }
    
    token IDENTIFIER {
        <[_a..z]><[_a..z0..9]>*  { make ~$/ }
    }
    
    token INTEGER {
        | <[0..9]>+ <|w>  { make +$/ }
#         | "'" (<-[']>*) [ "'" | $ { error "" } ]
    }  # '
    
    token STRING {
        \" [
          | <-["\s]>
          | \\n
          | \\(.) { die "Invalid escape sequence \\$0" }
          | $     { die "End-of-file" }
          | $$    { die "End-of-line" }
        ]+
#         \" (<-["]>+) \"
#         a
    }  # "
    
    token END_OF_INPUT  { $ }
    
    token ws {
        | <?after \w>  [| [\s | <comment>]+  <?before \w>
                        | [\s | <comment>]*  <?before \W> ]
        | <?after \W>  [| [\s | <comment>]*  <?before \w>
                        | [\s | <comment>]*  <?before \w> ]
    }
    token ws      { [\s | <comment>]* }  # ||
    token comment { '/*' .+? ['*/' | $ { die "End-of-file in comment\n"} ] }
    
    sub error ($a) { die  }
}

grammar Cish::Lexer does Cish::Tokens {
    rule TOP {
        <.ws>
        [
          | <OP_MULTIPLY>  | <OP_DIVIDE>     | <OP_ADD>        | <OP_SUBTRACT>
          | <OP_LESS>      | <OP_LESSEQUAL>  | <OP_GREATER>    | <OP_NOTEQUAL>
          | <OP_ASSIGN>    | <OP_AND>        | <LEFTPAREN>     | <RIGHTPAREN>
          | <LEFTBRACE>    | <RIGHTBRACE>    | <SEMICOLON>     | <COMMA>
          | <KEYWORD_IF>   | <KEYWORD_WHILE> | <KEYWORD_PRINT> | <KEYWORD_PUTC>
          | <IDENTIFIER>   | <INTEGER>       | <STRING>        | <END_OF_INPUT>
        ]*
        [ $ | (\w+ | .) { die "Invalid token '$0'" } ]
        { make $/.caps.map({ .key => .value.made }) }
    }
}

Cish::Lexer.subparse(slurp);
dd $/.ast;

