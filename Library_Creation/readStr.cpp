/*  Amshumaan Varma
	17CS30025
	Compilers Assignment 2
*/

// Read String Function

#include "myl.h" 

int readStr(char *s) { // Function to read input string

	int len;

	__asm__ __volatile__ ( // assembly code to read input as string
		"syscall"
		: "=a" (len)
		: "0" (SYS_READ), "D" (STDIN_FILENO), "S" (s), "d" (BUFF)
		: "rcx", "r11", "memory", "cc"
	);

	len--;

	s[len] = '\0'; // Terminate the string

	return len; // Return length of string..without including null character
}