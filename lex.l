%{

#include "types.h"
#include "tokens.h"

extern YYSTYPE yylval;

%}

%option noyywrap

%%

\@                      { yylval = '@'; return AMPERSAND; }
\{                      { return BRACE_OPEN; }
\}                      { return BRACE_CLOSE; }
\=                      { return SYM_EQUAL; }
\,                      { return SYM_COMMA; }
[0-9]*\.[0-9]*          { return NUMBER; }
.*                      { return STRING; }

%%
