/*  Amshumaan Varma
	17CS30025
	Compilers Assignment 2
*/

// Print Integer Function

#include "myl.h"

int printInt(int n) { // Function to print Integer
	
	char buff[BUFF];
	
	int i=0, j, k, bytes;
	
	if(n == 0) buff[i++] = '0'; // Check if integer is zero
	
	else{
		
		if(n < 0) { // Check if integer is  negetive
		buff[i++]='-';
		n = -n;
		}
	
		while(n){ // Convert the integer into string
			
			int dig = n%10;
			buff[i++] = (char)('0' + dig);
			n /= 10;
		}
		
		if(buff[0] == '-') j = 1; // If negetive, invert from 2nd Index
		
		else j = 0;
		
		k=i-1;
		while(j<k){ // Invert the string, as the integer is entered in reverse order
			
			char temp=buff[j];
			buff[j++] = buff[k];
			buff[k--] = temp;
		}
	}
	
	buff[i]='\n'; // New line after printing the integer
	bytes = i+1;
	
	__asm__ __volatile__ ( // Assembly Code to print a string
		
		"movl $1, %%eax \n\t"
		"movq $1, %%rdi \n\t"
		"syscall \n\t"
		:
		:"S"(buff), "d"(bytes)
	) ; 

	return i; // Return no of characters printed
}



