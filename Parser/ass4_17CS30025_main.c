/* 
Name : Pericherla Amshumaan Varma
Roll No : 17CS30025
Assignment No : 4
File : main() function to print the tokens, .c file
*/

#include <stdio.h>
#include <stdlib.h>

int yyparse();


// Main function to get the token from lex code and print it to terminal and .txt file
int main() {
  
  int token;
  
  while(1) yyparse();
        
  return 0;
}
