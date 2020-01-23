/*  Amshumaan Varma
	17CS30025
	Compilers Assignment 2
*/

// Print Float Function

#include "myl.h"

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



