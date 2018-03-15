%{

#include "types.h"
#include "tokens.h"

extern YYSTYPE yylval;

%}

%option noyywrap

%%

\@                      { yylval.ival = '@'; return AMPERSAND; }
\{                      { return BRACE_OPEN; }
\}                      { return BRACE_CLOSE; }
\=                      { return SYM_EQUAL; }
\,                      { return SYM_COMMA; }
[a-zA-Z_]               { return IDENTIFIER; }
[0-9]*\.[0-9]*          { return NUMBER; }
.*                      { return STRING; }

%%
