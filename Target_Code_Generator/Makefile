 # Assignment No : 6
# Assignment : Machine Independent Code Generator for tinyC 
# Name : K Snehal Reddy (17CS30020)
#        P Amshumaan Varma (17CS30020)
# file: Makefile

# make - to create the files
# make run - to compile the test files
# make clean - to remove the files
# make clean_output - to remove the output files

a.out: y.tab.o lex.yy.o ass6_17CS30020_17CS30025_translator.o ass6_17CS30020_17CS30025_target_translator.o
	g++ -g ass6_17CS30020_17CS30025_translator.o ass6_17CS30020_17CS30025_target_translator.o lex.yy.o y.tab.o -lfl
lex.yy.c: ass6_17CS30020_17CS30025.l
	flex ass6_17CS30020_17CS30025.l
y.tab.c: ass6_17CS30020_17CS30025.y
	yacc -dtv ass6_17CS30020_17CS30025.y
ass6_17CS30020_17CS30025_target_translator.o: ass6_17CS30020_17CS30025_target_translator.cxx
	g++ -g -c ass6_17CS30020_17CS30025_target_translator.cxx
ass6_17CS30020_17CS30025_translator.o: ass6_17CS30020_17CS30025_translator.cxx ass6_17CS30020_17CS30025_translator.h
	g++ -g -c ass6_17CS30020_17CS30025_translator.cxx ass6_17CS30020_17CS30025_translator.h
lex.yy.o: lex.yy.c
	g++ -g -c lex.yy.c
y.tab.o:    y.tab.c
	g++ -g -DYYDEBUG -c y.tab.c

libass2_17CS30020_17CS30025.a: ass2_17CS30020_17CS30025.o
	ar -rcs libass2_17CS30020_17CS30025.a ass2_17CS30020_17CS30025.o

ass2_17CS30020_17CS30025.o: ass2_17CS30020_17CS30025.c myl.h
	gcc -Wall  -c ass2_17CS30020_17CS30025.c


clean_files:
	rm lex.yy.c y.tab.h y.output y.tab.c lex.yy.o y.tab.o ass6_17CS30020_17CS30025_translator.o ass6_17CS30020_17CS30025_translator.h.gch ass6_17CS30020_17CS30025_target_translator.o a.out

clean_quad:
	rm ass6_17CS30020_17CS30025_quads_1.out ass6_17CS30020_17CS30025_quads_2.out ass6_17CS30020_17CS30025_quads_3.out ass6_17CS30020_17CS30025_quads_4.out ass6_17CS30020_17CS30025_quads_5.out

clean_test:
	rm ass6_17CS30020_17CS30025_test_1.o ass6_17CS30020_17CS30025_test_2.o ass6_17CS30020_17CS30025_test_3.o ass6_17CS30020_17CS30025_test_4.o ass6_17CS30020_17CS30025_test_5.o

clean_asm:
	rm ass6_17CS30020_17CS30025_test_1.asm ass6_17CS30020_17CS30025_test_2.asm ass6_17CS30020_17CS30025_test_3.asm ass6_17CS30020_17CS30025_test_4.asm ass6_17CS30020_17CS30025_test_5.asm	

clean_exe:
	rm test_1 test_2 test_3 test_4 test_5	

clean_lib:
	rm libass2_17CS30020_17CS30025.a ass2_17CS30020_17CS30025.o

clean:
	make clean_files
	make clean_test
	make clean_lib

clean_output:
	make clean_quad
	make clean_asm
	make clean_exe

test_1: ass6_17CS30020_17CS30025_test_1.o libass2_17CS30020_17CS30025.a
	gcc -g ass6_17CS30020_17CS30025_test_1.o -o test_1 -L. -lass2_17CS30020_17CS30025
	mv ass6_17CS30020_17CS30025_test_1.s ass6_17CS30020_17CS30025_test_1.asm

ass6_17CS30020_17CS30025_test_1.o: ass6_17CS30020_17CS30025_test_1.s myl.h
	gcc -g -Wall  -c ass6_17CS30020_17CS30025_test_1.s -o ass6_17CS30020_17CS30025_test_1.o

test_2: ass6_17CS30020_17CS30025_test_2.o libass2_17CS30020_17CS30025.a
	gcc -g ass6_17CS30020_17CS30025_test_2.o -o test_2 -L. -lass2_17CS30020_17CS30025
	mv ass6_17CS30020_17CS30025_test_2.s ass6_17CS30020_17CS30025_test_2.asm\

ass6_17CS30020_17CS30025_test_2.o: ass6_17CS30020_17CS30025_test_2.s myl.h
	gcc -g -Wall  -c ass6_17CS30020_17CS30025_test_2.s -o ass6_17CS30020_17CS30025_test_2.o

test_3: ass6_17CS30020_17CS30025_test_3.o libass2_17CS30020_17CS30025.a
	gcc -g ass6_17CS30020_17CS30025_test_3.o -o test_3 -L. -lass2_17CS30020_17CS30025
	mv ass6_17CS30020_17CS30025_test_3.s ass6_17CS30020_17CS30025_test_3.asm

ass6_17CS30020_17CS30025_test_3.o: ass6_17CS30020_17CS30025_test_3.s myl.h
	gcc -g -Wall  -c ass6_17CS30020_17CS30025_test_3.s -o ass6_17CS30020_17CS30025_test_3.o

test_4: ass6_17CS30020_17CS30025_test_4.o libass2_17CS30020_17CS30025.a
	gcc -g ass6_17CS30020_17CS30025_test_4.o -o test_4 -L. -lass2_17CS30020_17CS30025
	mv ass6_17CS30020_17CS30025_test_4.s ass6_17CS30020_17CS30025_test_4.asm

ass6_17CS30020_17CS30025_test_4.o: ass6_17CS30020_17CS30025_test_4.s myl.h
	gcc -g -Wall  -c ass6_17CS30020_17CS30025_test_4.s -o ass6_17CS30020_17CS30025_test_4.o

test_5: ass6_17CS30020_17CS30025_test_5.o libass2_17CS30020_17CS30025.a
	gcc -g ass6_17CS30020_17CS30025_test_5.o -o test_5 -L. -lass2_17CS30020_17CS30025
	mv ass6_17CS30020_17CS30025_test_5.s ass6_17CS30020_17CS30025_test_5.asm

ass6_17CS30020_17CS30025_test_5.o: ass6_17CS30020_17CS30025_test_5.s myl.h
	gcc -g -Wall  -c ass6_17CS30020_17CS30025_test_5.s -o ass6_17CS30020_17CS30025_test_5.o

run: 
	./a.out < ass6_17CS30020_17CS30025_test_1.c > ass6_17CS30020_17CS30025_quads_1.out
	./a.out < ass6_17CS30020_17CS30025_test_2.c > ass6_17CS30020_17CS30025_quads_2.out
	./a.out < ass6_17CS30020_17CS30025_test_3.c > ass6_17CS30020_17CS30025_quads_3.out
	./a.out < ass6_17CS30020_17CS30025_test_4.c > ass6_17CS30020_17CS30025_quads_4.out
	./a.out < ass6_17CS30020_17CS30025_test_5.c > ass6_17CS30020_17CS30025_quads_5.out

	./a.out < ass6_17CS30020_17CS30025_test_1.c
	mv output.s ass6_17CS30020_17CS30025_test_1.s
	make test_1

	./a.out < ass6_17CS30020_17CS30025_test_2.c
	mv output.s ass6_17CS30020_17CS30025_test_2.s
	make test_2

	./a.out < ass6_17CS30020_17CS30025_test_3.c
	mv output.s ass6_17CS30020_17CS30025_test_3.s
	make test_3

	./a.out < ass6_17CS30020_17CS30025_test_4.c
	mv output.s ass6_17CS30020_17CS30025_test_4.s
	make test_4

	./a.out < ass6_17CS30020_17CS30025_test_5.c
	mv output.s ass6_17CS30020_17CS30025_test_5.s
	make test_5
