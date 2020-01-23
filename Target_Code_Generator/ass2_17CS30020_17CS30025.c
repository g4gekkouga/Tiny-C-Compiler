
/*  Amshumaan Varma
	17CS30025
	Compilers Assignment 2
*/

#include "myl.h"
#define SYS_READ 0
#define STDIN_FILENO 0


int printFlt(float f) { // function to print float number

	char buff[BUFF];

	int num;
	num = (int)f;

	float frac;

	int i = 0;
	int j, k;


	if(num == 0) buff[i++] = '0'; // if integer part is zero
	
	else{

		frac = f - (float)num;
		
		if(num < 0) { // if negetive number
		buff[i++]='-';
		num = num*(-1);
		f = f*(-1.0f);
		frac = f - (int)f;		
		}
	
		while(num){
			
			int dig = num%10; // convert integer part to string
			buff[i++] = (char)('0' + dig);
			num /= 10;
		}
		
		if(buff[0] == '-') j = 1;
		
		else j = 0;
		
		k=i-1;
		while(j<k){ // Invert the string
			
			char temp=buff[j]; 
			buff[j++] = buff[k];
			buff[k--] = temp;
		}
	}

	buff[i++]='.'; // Include decimal point

	int count = 0; // Ni of decimal places = 6
	int temp_num;
	float g = 0.000001; // If fraction less than this, the remaining 0s till 6 decimal places

	while (frac >= g && count < 6) {
		frac = frac * 10.0f;
		temp_num = (int)frac;
		frac = frac - (float)(temp_num);
		buff[i++] = (char)('0' + temp_num);
		count++;
		g = g * 10.0f; // as one decimal place is done, higher restriction on frac part
	}

	while (count < 6) { // Fix remaining digits as 0 till 6 decimal places
		buff[i++] = '0';
		count++;
	}

	buff[i++] = '\n'; // New line after printing the Float Number 
	
	__asm__ __volatile__ ( // Assembly Code to print a string
		
		"movl $1, %%eax \n\t"
		"movq $1, %%rdi \n\t"
		"syscall \n\t"
		:
		:"S"(buff), "d"(i)
	) ; 

	return --i; // Return no of characters printed


}


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
