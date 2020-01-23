/*  Amshumaan Varma
	17CS30025
	Compilers Assignment 2
*/

// Read Integer Function

#include "myl.h"

int readInt(int *n) { // Function to read integer from input

	char buff[BUFF];
	int d;


	__asm__ __volatile__ ( // assembly code to read input as string 
		"syscall"
		: "=a" (d)
		: "0" (SYS_READ), "D" (STDIN_FILENO), "S" (buff), "d" (BUFF)
		: "rcx", "r11", "memory", "cc"
	);

	d--;

	buff[d--] = '\0'; // Terminate the string

	int num = 0;
	int i = 0, flag = 0; 

	while (buff[d] == ' ') d--; // Remove trailing Spaces

	buff[++d] = '\0';

	while (buff[i] == ' ') i++; // Remove preceeding spaces

	if (buff[i] == '-') { // Check if num is negetive
		flag = 1;
		i++;
	}

	for(;i < d ;i++){  // convert the unsigned part of the string into integer           
        
        if(!(buff[i]>='0' && buff[i]<='9')) return ERR; // If any char other than 0 to 9  return Error
        
        num = num*10 + (buff[i]-'0');
    }  

    if (flag == 1) num = num*(-1); // Negetive Integer               
   
    *n = num; // Save input number

	return OK; 
}

