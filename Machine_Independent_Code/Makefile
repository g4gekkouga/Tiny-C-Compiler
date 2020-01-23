 # Assignment No : 5
# Assignment : Machine Independent Code Generator for tinyC 
# Name : K Snehal Reddy (17CS30020)
#        P Amshumaan Varma (17CS30020)
# file: Makefile


a.out: y.tab.o lex.yy.o ass5_17CS30020_17CS30025_translator.o 
	g++ -g ass5_17CS30020_17CS30025_translator.o lex.yy.o y.tab.o -lfl
lex.yy.c: ass5_17CS30020_17CS30025.l
	flex ass5_17CS30020_17CS30025.l
y.tab.c: ass5_17CS30020_17CS30025.y
	yacc -dtv ass5_17CS30020_17CS30025.y
ass5_17CS30020_17CS30025_translator.o: ass5_17CS30020_17CS30025_translator.cxx ass5_17CS30020_17CS30025_translator.h
	g++ -g -c ass5_17CS30020_17CS30025_translator.cxx ass5_17CS30020_17CS30025_translator.h
lex.yy.o: lex.yy.c
	g++ -g -c lex.yy.c
y.tab.o:    y.tab.c
	g++ -g -DYYDEBUG -c y.tab.c

# make clean -- to remove the created files
clean:
	rm lex.yy.c y.tab.h y.output y.tab.c lex.yy.o y.tab.o ass5_17CS30020_17CS30025_translator.o ass5_17CS30020_17CS30025_translator.h.gch a.out

#make clean_quad -- to remove the generated quad files
clean_quad:
	rm ass5_17CS30020_17CS30025_quads_1.out ass5_17CS30020_17CS30025_quads_2.out ass5_17CS30020_17CS30025_quads_3.out ass5_17CS30020_17CS30025_quads_4.out ass5_17CS30020_17CS30025_quads_5.out

# make run -- to compile the test codes
run: 
	./a.out < ass5_17CS30020_17CS30025_test_1.c > ass5_17CS30020_17CS30025_quads_1.out
	./a.out < ass5_17CS30020_17CS30025_test_2.c > ass5_17CS30020_17CS30025_quads_2.out
	./a.out < ass5_17CS30020_17CS30025_test_3.c > ass5_17CS30020_17CS30025_quads_3.out
	./a.out < ass5_17CS30020_17CS30025_test_4.c > ass5_17CS30020_17CS30025_quads_4.out
	./a.out < ass5_17CS30020_17CS30025_test_5.c > ass5_17CS30020_17CS30025_quads_5.out

