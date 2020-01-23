 
# Name : Pericherla Amshumaan Varma
# Roll No : 17CS30025
# Assignment No : 3
# File : Makefile


a.out:	lex.yy.c
		gcc lex.yy.c -lfl

lex.yy.c:	ass3_17CS30025.l ass3_17CS30025_main.c
		flex ass3_17CS30025.l ass3_17CS30025_main.c

clean:
		rm a.out lex.yy.c

# make test will run the code with test input 

test:
		./a.out <ass3_17CS30025_test.c