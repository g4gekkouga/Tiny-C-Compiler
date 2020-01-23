/*  Amshumaan Varma
	17CS30025
	Compilers Assignment 2
*/

// Print String Function

#include "myl.h"

int printStr(char* s) { // Function to print string

	int len = 0, bytes;

	while (s[len] != '\0') { // Get length of the stringh
		len++;
	}

	bytes = len + 1;


	__asm__ __volatile__ ( // Assembly Code to print a string
		
		"movl $1, %%eax \n\t"
		"movq $1, %%rdi \n\t"
		"syscall \n\t"
		:
		:"S"(s), "d"(bytes)
	) ; 

	return len; // Return no of characters printed

}


