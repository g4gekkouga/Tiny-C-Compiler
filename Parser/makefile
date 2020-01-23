 
# Name : Pericherla Amshumaan Varma
# Roll No : 17CS30025
# Assignment No : 4
# File : Make File


a.out: ass4_17CS30025.tab.c lex.yy.c
	gcc lex.yy.c ass4_17CS30025_main.c -lfl

lex.yy.c: ass4_17CS30025.l ass4_17CS30025.tab.h
	flex ass4_17CS30025.l

ass4_17CS30025.tab.h ass4_17CS30025.tab.c: ass4_17CS30025.y
	bison -d ass4_17CS30025.y

clean:
	rm ass4_17CS30025.tab.h ass4_17CS30025.tab.c lex.yy.c a.out

test:
		./a.out <ass4_17CS30025_test.c
