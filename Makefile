create_analex:
	lex sid.l
	gcc -o sid lex.yy.c -ll

run_analex:
	./sid < main.sid.txt

create_syntactic:
	yacc -d sid.y
	gcc -g lex.yy.c y.tab.c -o exec

run:
	./exec < main.sid.txt
