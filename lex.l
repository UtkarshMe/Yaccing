%{

#include <string.h>
#include "types.h"
#include "y.tab.h"

%}

%option noyywrap

%%

"@"                     { return SYM_AMPERSAND; }
"{"                     { return BRACE_OPEN; }
"}"                     { return BRACE_CLOSE; }
"="                     { return SYM_EQUAL; }
","                     { return SYM_COMMA; }
[a-zA-Z_0-9]+           { strcpy(yylval.sval, yytext); return IDENTIFIER; }
[.\n]                   {}

%%
