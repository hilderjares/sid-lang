%{

#include <stdio.h>

int yylex();
int yyerror(char *s);

%}

%start program

%token INICIO FIM DIVISAO EXPOENTE FLOAT MULT BRAC_ESR BRAC_DIR MAIS MENOS IGUAL TERMINADOR INTEGER ID DIGIT

%%

program: INICIO stmt_list FIM;

stmt_list: stmt | 
           stmt TERMINADOR stmt_list; 

stmt: ID IGUAL expression;

/* expression: expression MAIS term |
            expression MENOS term |
            term; */

/* term: term MULT factor |
      term DIVISAO factor |
      factor;
 */

e: {};

expression: term expressionl;

expressionl: MAIS term expressionl |
             MENOS term expressionl |
             e;

term: factor terml;

terml: MULT factor terml |
       DIVISAO factor terml |
       e;

factor: exp EXPOENTE factor |
        exp;

exp: ID |
     INTEGER |
     FLOAT |
     BRAC_ESR expression BRAC_DIR
;  

%%

int yyerror(char *s) {
	printf("Syntax Error on line %s\n", s);
	return 0;
}

int main() {
    yyparse();
    return 0;
}