# Amshumaan Varma
# 17CS30025
# Compilers Assignment 2

# MakeFile


# Depends on all the functions used in main()
a.out: main.o libprintInt.a libprintStr.a libreadInt.a libreadFlt.a libprintFlt.a libreadStr.a 
	c++ main.o -L. -lprintInt -lprintStr -lreadInt -lreadFlt -lprintFlt -lreadStr

main.o: main.cpp myl.h
	c++ -Wall -c main.cpp


# Generating libraries for all the file with the functions used in main()
libprintInt.a: printInt.o
	ar -rcs libprintInt.a printInt.o

printInt.o: printInt.cpp myl.h
	c++ -Wall -c printInt.cpp

libprintStr.a: printStr.o
	ar -rcs libprintStr.a printStr.o

printStr.o: printStr.cpp myl.h
	c++ -Wall -c printStr.cpp

libreadInt.a: readInt.o
	ar -rcs libreadInt.a readInt.o

readInt.o: readInt.cpp myl.h
	c++ -Wall -c readInt.cpp

libreadFlt.a: readFlt.o
	ar -rcs libreadFlt.a readFlt.o

readFlt.o: readFlt.cpp myl.h
	c++ -Wall -c readFlt.cpp

libprintFlt.a: printFlt.o
	ar -rcs libprintFlt.a printFlt.o

printFlt.o: printFlt.cpp myl.h
	c++ -Wall -c printFlt.cpp

libreadStr.a: readStr.o
	ar -rcs libreadStr.a readStr.o

readStr.o: readStr.cpp myl.h
	c++ -Wall -c readStr.cpp

# Remove all the generated files during compilation
clean:
	rm a.out main.o libprintInt.a printInt.o libprintStr.a printStr.o libreadInt.a readInt.o libreadFlt.a readFlt.o libprintFlt.a printFlt.o libreadStr.a readStr.o