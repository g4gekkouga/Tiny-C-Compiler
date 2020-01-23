/* 
Name : Pericherla Amshumaan Varma
Roll No : 17CS30025
Assignment No : 3
File : main() function to print the tokens, .c file
*/

#include <stdio.h>
#include <stdlib.h>

// To bypass the content inside multi line comments
void multi_comment(void) {
  char c, prev = 0;
  while ((c = input()) != 0) {     // EOF --> 0
    if (c == '/' && prev == '*') {
      printf("End of MultiLine Comment\n");
      return;
    }
    prev = c;
    if (c == '\n') printf("Inside Multi Line Comment\n");
  }
  printf("No end of MultiLine Comment Detected\n");
  return;
}

// o bypass the single line comment
void single_comment(void) {
  char c;
  while ((c = input()) != '\n') continue;  // New Line --> '\n'
  printf("End of Comment\n");
  return;
}

// Main function to get the token from lex code and print it to terminal and .txt file
int main() {

   int open = 1;
   FILE *fptr;
   fptr = fopen("token.txt", "w"); // File to write token stream
   if(fptr == NULL)
   {
      printf("Error in Opening txt file");
      open = 0;
   }

  
  int token;
  while (token = yylex()) {
    switch (token) {

      case M_COM:     printf("<MULTILINE-COMMENT, %d, %s>\n", token, yytext);
                      if (open) fprintf(fptr, "<MULTILINE-COMMENT, %d, %s>\n", token, yytext);
                      multi_comment();
                      break;
      
      case S_COM:     printf("<SINGLELINE-COMMENT, %d, %s>\n", token, yytext);
                      if (open) fprintf(fptr, "<SINGLELINE-COMMENT, %d, %s>\n", token, yytext);
                      single_comment();
                      break;
      
      case E_SEQ:     printf("<ESCAPE-SEQUENCE, %d, %s>\n", token, yytext);
                      if (open) fprintf(fptr, "<ESCAPE-SEQUENCE, %d, %s>\n", token, yytext);
                      break;

      case PUNC:      printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
                      if (open) fprintf(fptr, "<PUNCTUATOR, %d, %s>\n", token, yytext);
                      break;

      case KEY:       printf("<KEYWORD, %d, %s>\n", token, yytext);
                      if (open) fprintf(fptr, "<KEYWORD, %d, %s>\n", token, yytext);
                      break;                

      case S_LIT:     printf("<STRING-LITERAL, %d, %s>\n", token, yytext);
                      if (open) fprintf(fptr, "<STRING-LITERAL, %d, %s>\n", token, yytext);
                      break;
      
      case ID:        printf("<IDENTIFIER, %d, %s>\n", token, yytext);
                      if (open) fprintf(fptr, "<IDENTIFIER, %d, %s>\n", token, yytext);
                      break;

      case I_CONST:   printf("<INTEGER-CONSTANT, %d, %s>\n", token, yytext);
                      if (open) fprintf(fptr, "<INTEGER-CONSTANT, %d, %s>\n", token, yytext);
                      break;

      case E_CONST:   printf("<ENUMERATION-CONSTANT, %d, %s>\n", token, yytext);
                      if (open) fprintf(fptr, "<ENUMERATION-CONSTANT, %d, %s>\n", token, yytext);
                      break;

      case F_CONST:   printf("<FLOATING-CONSTANT, %d, %s>\n", token, yytext);
                      if (open) fprintf(fptr, "<FLOATING-CONSTANT, %d, %s>\n", token, yytext);
                      break;

      case C_CONST:   printf("<CHARACTER-CONSTANT, %d, %s>\n", token, yytext);
                      if (open) fprintf(fptr, "<CHARACTER-CONSTANT, %d, %s>\n", token, yytext);
                      break;

      default :       printf("Default\n");
                      if (open) fprintf(fptr, "DEFAULT");
                      break;

    }
  }

  return 0;
}

