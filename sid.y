%{

#include <stdio.h>

int yylex();
int yyerror(char *s);

%}

%start program
%token INICIO FIM DIVISAO EXPOENTE FLOAT MULT BRAC_ESR BRAC_DIR MAIS MENOS IGUAL TERMINADOR INTEGER ID DIGIT

%%

program: INICIO declaration_list FIM;

declaration_list: stmt_list;

stmt_list: stmt | 
           stmt TERMINADOR; 

stmt: ID IGUAL expression;

expression: expression MAIS term |
            expression MENOS term |
            INTEGER;

term: term MULT factor |
      term DIVISAO factor |
      factor;

factor: exp '^' factor |
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