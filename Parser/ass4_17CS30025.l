/* 
Name : Pericherla Amshumaan Varma
Roll No : 17CS30025
Assignment No : 4
File : Flex code, .l file
*/

%{
	#define YYPRINT
	#include "ass4_17CS30025.tab.h"
	#include "ass4_17CS30025.tab.c"
	#define ERROR -1;
	#include <string.h>
	int tokenCode(char*);
%}

/************** Regular Expression Definitions *******************/


KEYWORD 					"auto"|"enum"|"restrict"|"unsigned"|"break"|"extern"|"return"|"void"|"case"|"float"|"short"|"volatile"|"char"|"for"|"signed"|"while"|"const"|"goto"|"sizeof"|"_Bool"|"continue"|"if"|"static"|"_Complex"|"default"|"inline"|"struct"|"_Imaginary"|"do"|"int"|"switch"|"double"|"long"|"typedef"|"else"|"register"|"union"
DIGIT 						[0-9]
IDENTIFIER-NONDIGIT 		[a-zA-Z]
IDENTIFIER 					{IDENTIFIER-NONDIGIT}({IDENTIFIER-NONDIGIT}|{DIGIT})*
NONZERO-DIGIT 				[1-9]
INTEGER-CONSTANT			({DIGIT})+
FRACTIONAL-PART 			(({DIGIT}+)?\.{DIGIT}+)|(({DIGIT}+)\.)
SIGN 						[+-]
EXPONENT-PART				([Ee]{SIGN}?{DIGIT}+)
FLOATING-CONSTANT 			({FRACTIONAL-PART}{EXPONENT-PART}?)|({DIGIT}+{EXPONENT-PART})
ENUMERATION-CONSTANT 		{IDENTIFIER} 
ESCAPE-SEQUENCE				\\['"?\\abfnrtv]
C-CHAR						[^'\\\n]|{ESCAPE-SEQUENCE}
CHARACTER-CONSTANT 			'({C-CHAR})+'
S-CHAR						[^"\\\n]|{ESCAPE-SEQUENCE}
STRING-LITERAL 				\"({S-CHAR}+)\"
DEFAULT  					[ \t\v\n\f]
PUNCTUATOR					"["|"]"|"("|")"|"{"|"}"|"."|"->"|"++"|"--"|"&"|"*"|"+"|"-"|"~"|"!"|"/"|"%"|"<<"|">>"|"<"|">"|"<="|">="|"=="|"!="|"^"|"|"|"&&"|"||"|"?"|":"|";"|"..."|"="|"*="|"/="|"%="|"+="|"-="|"<<="|">>="|"&="|"^="|"|="|","|"#"
SINGLE-LINE		            "//".*
MULTI-LINE 					"/*"([^*]|(\*+[^*/]))*\*+\/ 

%%


{MULTI-LINE}				{}
{SINGLE-LINE}  	   			{}

{PUNCTUATOR}				{ return tokenCode(yytext);}
{KEYWORD}					{ return tokenCode(yytext);}
{STRING-LITERAL} 			{ return STRING_LITERAL; }
{IDENTIFIER}				{ return IDENTIFIER; }
{INTEGER-CONSTANT} 			{ return CONSTANT; }
{FLOATING-CONSTANT} 		{ return CONSTANT; }
{CHARACTER-CONSTANT} 		{ return CONSTANT; }
{DEFAULT}					{ /* Token Seperation */ }

%%

// To get the token for all types of keywords and punctuators

int tokenCode(char* a){
	int i;
	if(strlen(a) == 1) return a[0];
	for(i = 0; i < YYNTOKENS; i++){
		if (yytname[i] != 0
        && yytname[i][0] == '"'
        && ! strncmp (yytname[i] + 1, a,strlen(a))
        && yytname[i][strlen (a) + 1] == '"'
        && yytname[i][strlen (a) + 2] == 0)
     		break;
	}
	return yytoknum[i];
}


/* 
Token cannot be generated for Enumeration Constant 
as it is same as identifier. Can be differentiated during parsing
*/
