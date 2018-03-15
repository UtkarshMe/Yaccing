%{

#include <stdio.h>
#include "types.h"

extern int yylex();
extern int yyerror (char *);

%}

%token AMPERSAND BRACE_OPEN BRACE_CLOSE SYM_COMMA SYM_EQUAL
%token STRING NUMBER IDENTIFIER


%%

token:      {
                printf("token");
            };

%%


YYSTYPE yylval;

int main (int argc, char *argv[])
{
    yyparse();
}

int yyerror (char *s)
{
    yyparse();
    return 0;
}
