/*  Amshumaan Varma
	17CS30025
	Compilers Assignment 2
*/

// Main Function


#include "myl.h" // headder to include

int main() {
	
	// Read a string from input and print it and also no of characters printed

	printStr("\nEnter any String : ");

	char read[BUFF];
	int len = 0;

	len = readStr(read); // returns length of input string

	while(len == 0) { // If no string is input, Prompt for another string
		printStr("No String Input");
		printStr("\nEnter any String : ");
		len = readStr(read);
	}

	printStr("Then input String is : ");

	printStr(read);

	printStr("\nNo of Characters : ");

	printInt(len);



    // Read integer from input and print it

	printStr("\nEnter a Positive Integer : ");

	int p_num = 0, dig;
	int flag;

	flag = readInt(&p_num); // returns OK on successful read, eale ERR

	while (flag == ERR) { // if the input is invalid, prompt for another input
		printStr("The Entered Integer is Invalid");
		printStr("\nEnter a Positive Integer : ");
		flag = readInt(&p_num);
	}

	printStr("The entered number is : ");

	dig = printInt(p_num); // returns no of characters printed

	printStr("No of Characters : ");

	printInt(dig);

	


	// Read negetive integer from input and print it.

	printStr("\nEnter a Negetive Integer : ");

	int n_num = 0;
	
	flag = readInt(&n_num); // returns OK on successful read, eale ERR

	while (flag == ERR) { // if the input is invalid, prompt for another input
		printStr("The Entered Integer is Invalid");
		printStr("\nEnter a Negetive Integer : ");
		flag = readInt(&n_num);
	}

	printStr("The entered number is : ");

	dig = printInt(n_num); // returns no of characters printed

	printStr("No of Characters : ");

	printInt(dig);


	


	// Read real number from input and print it

	printStr("\nEnter a Positive Real Number : ");

	float p_f = 0;

	flag = readFlt(&p_f); // returns OK on successful read, eale ERR

	while (flag == ERR) { // if the input is invalid, prompt for another input
		printStr("The Entered Real Number is Invalid");
		printStr("\nEnter a Positive Real Number : ");
		flag = readFlt(&p_f);
	}

	printStr("The entered number is : ");

	dig = printFlt(p_f); // returns no of characters printed

	printStr("No of Characters : ");

	printInt(dig);




	// Read negetive real number from input and print it

	printStr("\nEnter a Negetive Real Number : ");

	float n_f = 0;

	flag = readFlt(&n_f); // returns OK on successful read, eale ERR

	while (flag == ERR) { // if the input is invalid, prompt for another input
		printStr("The Entered Real Number is Invalid");
		printStr("\nEnter a Negetive Real Number : ");
		flag = readFlt(&n_f);
	}

	printStr("The entered number is : ");

	dig = printFlt(n_f); // returns no of characters printed

	printStr("No of Characters : ");

	printInt(dig);

	return 0;
}
