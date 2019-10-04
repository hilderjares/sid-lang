%{
    #include <stdlib.h>
    #include "y.tab.h"

    void showError();
%}

BRAC_ESR \(
BRAC_DIR \)
MAIS [+]
MENOS [-]
IGUAL [=]
TERMINADOR [;]
INTEGER [0-9]+
ID [a-zA-Z_][a-zA-Z0-9_]*
DIGIT [0-9]
DIVISAO [\/]
MULT [*]
EXPOENTE \^

%%


[ \t\n] ;

begin {
    return INICIO;
}

end {
    return FIM;
}

{INTEGER} {
    return INTEGER;
}

{DIGIT}+"."{DIGIT}* {
    return FLOAT;
}

{BRAC_ESR} {
    return BRAC_ESR;
}

{BRAC_DIR} {
    return BRAC_DIR;
}

{ID} {
    return ID;
}

{TERMINADOR} {
    return TERMINADOR;
}

{MAIS} { 
    return MAIS;
}

{MENOS} {    
    return MENOS;
}

{IGUAL} {    
    return IGUAL;
}

{DIVISAO} {
    return DIVISAO;
}

{MULT} {
    return MULT;
}

{EXPOENTE} {
    return EXPOENTE;
}

\/\/(.*) {};	

\/\*(.*\n)*.*\*\/  {};		

. {
    showError();
    /*exit(0);*/
}

%%

void showError(){
    printf("Lex erro!");
}

int yywrap (void) {
    return 1;
}

/* 
int yyerror(char *s) {
	printf("Lex error on line %s\n", s);
	return 0;
} 
*/

/*
int main() {
    yylex();
}
*/