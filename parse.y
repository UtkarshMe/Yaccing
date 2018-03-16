%{

#include <stdio.h>
#include <string.h>
#include "types.h"

extern int yylex();
extern int yyerror (char *);

#define YYDEBUG 1

%}

%union {
    int     ival;
    char    sval[10000];
    Entry   entry_val;
    Field   field_val;
};

%token  <ival>      SYM_AMPERSAND BRACE_OPEN BRACE_CLOSE SYM_COMMA SYM_EQUAL
%token  <sval>      IDENTIFIER

%type   <sval>      name key string string_all
%type   <field_val> field fields
%type   <entry_val> entry


%%

bibtex:         /* nothing */
                | entry bibtex
                        {
                            printf("\nname: %s\nkey: %s\nfield: \nvalue: \n\n",
                                $1.name, $1.key);//, $1.fields -> name, $1.fields -> value);
                        }
                ;

entry:          SYM_AMPERSAND name BRACE_OPEN key SYM_COMMA fields BRACE_CLOSE
                        {
                            $$.name   = strdup($2);
                            $$.key    = strdup($4);
                            /*$$.fields = &$6;*/
                        }
                ;

name:           IDENTIFIER
                        {
                            strcpy($$, $1);
                        }
                ;

key:            IDENTIFIER
                        {
                            strcpy($$, $1);
                        }
                ;

fields:         field SYM_COMMA fields
                        {
                            $$.name = strdup($1.name);
                        }
                | field
                        {
                            $$.name = strdup($1.name);
                        }
                ;

field:          IDENTIFIER SYM_EQUAL string
                        {
                            $$.name  = strdup($1);
                            $$.value = strdup($3);
                        }
                ;

string:         IDENTIFIER string
                        {
                            sprintf($$, "%s %s", strdup($1), strdup($2));
                        }
                | IDENTIFIER
                        {
                            strcpy($$, $1);
                        }
                | BRACE_OPEN string_all BRACE_CLOSE
                        {
                            strcpy($$, $2);
                            printf("entry: %s", $2);
                        }
                ;

string_all:     IDENTIFIER
                        {
                            strcpy($$, $1);
                        }
                | SYM_COMMA string_all
                        {
                            sprintf($$, ", %s", strdup($2));
                        }
                | IDENTIFIER string_all
                        {
                            sprintf($$, "%s %s", strdup($1), strdup($2));
                        }
                | /* empty */
                        {
                            strcpy($$, "");
                        }
                ;

%%


int main (int argc, char *argv[])
{
    yyparse ();
}

int yyerror (char *s)
{
    printf ("%s\n", s);
    return 0;
}
