%{

#include "y.tab.h"

%}

%option noyywrap

%%

\@                      { return AMPERSAND; }
\{                      { return BRACE_OPEN; }
\}                      { return BRACE_CLOSE; }
\=                      { return SYM_EQUAL; }
\,                      { return SYM_COMMA; }
[a-zA-Z_]+              { yylval.sval = yytext; return IDENTIFIER; }
[0-9]+\.[0-9]*          { yylval.sval = yytext; return NUMBER; }
.*                      { yylval.sval = yytext; return STRING; }

%%
