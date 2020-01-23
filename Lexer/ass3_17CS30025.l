/* 
Name : Pericherla Amshumaan Varma
Roll No : 17CS30025
Assignment No : 3
File : Flex code, .l file
*/

%{
	# define   M_COM 	1
	# define   S_COM 	2
	# define   E_SEQ	3
	# define   PUNC 	4
	# define   KEY 		5
	# define   S_LIT	6
	# define   ID 		7
	# define   I_CONST 	8
	# define   F_CONST 	9
	# define   E_CONST 	10
	# define   C_CONST 	11
%}

/************** Regular Expression Definitions *******************/


KEYWORD 					"auto"|"enum"|"restrict"|"unsigned"|"break"|"extern"|"return"|"void"|"case"|"float"|"short"|"volatile"|"char"|"for"|"signed"|"while"|"const"|"goto"|"sizeof"|"_Bool"|"continue"|"if"|"static"|"_Complex"|"default"|"inline"|"struct"|"_Imaginary"|"do"|"int"|"switch"|"double"|"long"|"typedef"|"else"|"register"|"union"
DIGIT 						[0-9]
IDENTIFIER-NONDIGIT 		[a-zA-Z]
IDENTIFIER 					{IDENTIFIER-NONDIGIT}({IDENTIFIER-NONDIGIT}|{DIGIT})*
NONZERO-DIGIT 				[1-9]
INTEGER-CONSTANT			{NONZERO-DIGIT}({DIGIT})*
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
MULTI-LINE					"/*"
SINGLE-LINE					"//"

%%

{MULTI-LINE}				{ return M_COM; }
{SINGLE-LINE}  	   			{ return S_COM;}
{ESCAPE-SEQUENCE} 			{ return E_SEQ;}
{PUNCTUATOR}				{ return PUNC;}
{KEYWORD}					{ return KEY;}
{STRING-LITERAL} 			{ return S_LIT; }
{IDENTIFIER}				{ return ID; }
{INTEGER-CONSTANT} 			{ return I_CONST; }
{FLOATING-CONSTANT} 		{ return F_CONST; }
{CHARACTER-CONSTANT} 		{ return C_CONST; }
{DEFAULT}					{ /* Token Seperation */ }

%%

/* 
Token cannot be generated for Enumeration Constant 
as it is same as identifier. Can be differentiated during parsing
*/
