%{

#include <stdio.h>

extern int yylex();
extern int yyerror (char *);

%}

%union {
    double  dval;
    int     ival;
    char    *sval;
};

%token <ival> AMPERSAND BRACE_OPEN BRACE_CLOSE SYM_COMMA SYM_EQUAL
%token <sval> STRING NUMBER IDENTIFIER


%%

identifier:
            IDENTIFIER
                        { printf("rule: %s", $1); }
            | /* nothing */
                        { printf("rule: nothing"); }
            ;


%%


int main (int argc, char *argv[])
{
    yyparse ();
}

int yyerror (char *s)
{
    printf ("\nwell, shit : %s", s);
    yyparse();
    return 0;
}
