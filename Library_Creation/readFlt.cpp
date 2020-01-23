/*  Amshumaan Varma
	17CS30025
	Compilers Assignment 2
*/

// Read Float Function

#include "myl.h"

int readFlt(float *f) { // Function to read Float Number from input
    char buff[BUFF];
    int d;

    __asm__ __volatile__ ( // assembly code to read input as string
        "syscall"
        : "=a" (d)
        : "0" (SYS_READ), "D" (STDIN_FILENO), "S" (buff), "d" (sizeof(buff))
        : "rcx", "r11", "memory", "cc"
    );

    d--;

    buff[d--] = '\0'; // Terminate the string

    float val = 0;
    float frac = 0.1;

    int i = 0, flag = 0, flag1 = 0;

    while (buff[d] == ' ') d--; // Remove trailing Spaces

    buff[++d] = '\0';

    while (buff[i] == ' ') i++; // Remove Preceeding spaces


    if (buff[i] == '-') { // Check for negetive number
    	flag1 = 1;
    	i++;
    }

    for (; i < d; i++) {
        
        if (buff[i] == '.') { // Makr on Decimal point encounter
        	
        	if (flag == 1) return ERR; // If more than one decimal points occur, return Error
            
            flag = 1;
            continue;
        }

        else if (flag == 0) {

        	if(!(buff[i]>='0' && buff[i]<='9')) return ERR; // If any char other than 0 to 9  return Error
            
            val = val*10 + (buff[i]-'0'); // Converting integer part 
        }

        else {
        	
        	if(!(buff[i]>='0' && buff[i]<='9')) return ERR;

            val = val + frac*(buff[i]-'0'); // Converting Fractional part
            frac = frac / 10.0f;
        }
    }

    if (flag1 == 1) val = val*(-1.0f); // Negetive Number

    *f = val; // Save number input

    return OK;
}

