/* 
Assignment No : 6
Assignment : Machine Independent Code Generator for tinyC 
Name : K Snehal Reddy (17CS30020)
       P Amshumaan Varma (17CS30020)
file: .l flex file
*/

%{
	#include "ass6_17CS30020_17CS30025_translator.h"
	#include "y.tab.h"
	extern void yyerror(const char *);
	static void comment(void);
%}

%option noyywrap

DIGIT [0-9]
NONZERODIG [1-9]
IDENT_ND [A-Za-z_]
IDENT ({IDENT_ND}({IDENT_ND}|{DIGIT})*)
WHITESPACE [ \n\t]
SIGN [+-]
DIGIT_SEQ {DIGIT}+
EXPONENT_PART ([eE]{SIGN}?{DIGIT_SEQ})
ZERO "0"
INT_CONST (({NONZERODIG}({DIGIT}*))|{ZERO}+)
DOT "."
FRACT_CONST (({DIGIT_SEQ}?{DOT}{DIGIT_SEQ})|({DIGIT_SEQ}{DOT}))
FLOAT_CONST (({FRACT_CONST}{EXPONENT_PART}?)|({DIGIT_SEQ}{EXPONENT_PART}))
ENUM_CONST {IDENT}
ESC_SEQ ([\\][\'\"\?\\abfnrtv])
C_CHAR [^\'\\\n]|{ESC_SEQ}
C_CHAR_SEQ {C_CHAR}+
C_CHAR_CONST (\'{C_CHAR_SEQ}\')
CONST ({INT_CONST}|{FLOAT_CONST}|{ENUM_CONST}|{C_CHAR_CONST})
S_CHAR [^\"\\\n]|{ESC_SEQ}
S_CHAR_SEQ {S_CHAR}+
STRING_LITERAL (\"{S_CHAR_SEQ}*\")
SINGLE_COMMENT [/][/].*
MULTI_END [\*]+[/]
MULTI_START [/][\*]+
NON_STAR (([^\*]).*)
NON_FS ([^/].*)
AVOID_MULTI_END (NON_STAR|([\*]{NON_FS}))
MULTI_COMMENT ({MULTI_START}(([^\*])|((\*)+[^/\*]))*{MULTI_END})
COMMENT {SINGLE_COMMENT}|{MULTI_COMMENT}

%%
"Matrix"					{return MATRIX;}

"unsigned"          {return UNSIGNED;}
"break"             {return BREAK;}
"return"            {return RETURN;}
"void"              {return VOID;}
"char"              {return CHAR;}
"for"              	{return FOR;}
"signed"            {return SIGNED;}
"while"             {return WHILE;}
"goto"              {return GOTO;}
"sizeof"            {return SIZEOF;}
"case"              {return CASE;}
"float"             {return FLOAT;}
"short"             {return SHORT;}
"_Bool"             {return BOOL;}
"continue"          {return CONTINUE;}
"if"                {return IF;}
"default"           {return DEFAULT;}
"do"                {return DO;}
"int"               {return INT;}
"switch"            {return SWITCH;}
"double"            {return DOUBLE;}
"long"              {return LONG;}
"else"              {return ELSE;}


".'"				{return TRANSPOSE;}
"["                 {return '[';  }
"]"                 { return ']'; }
"("                 { return '('; }
")"                 { return ')'; }
"{"                 { return '{'; }
"}"                 { return '}'; }
"."                 { return '.'; }
"->"                { return (POINTER); }
"++"                { return (INCREMENT); }
"--"                { return (DECREMENT); }
"&"                 { return '&'; }
"*"                 { return '*'; }
"+"                 { return '+'; }
"-"                 { return '-'; }
"~"                 { return '~'; }
"!"                 { return '!'; }
"/"                 { return '/'; }
"%"                 { return '%'; }
"<<"                { return (LEFT_SHIFT); }
">>"                { return (RIGHT_SHIFT); }
"<"                 { return '<'; }
">"                 { return '>'; }
"<="                { return (LESS_EQUALS); }
">="                { return (GREATER_EQUALS); }
"=="                { return (EQUALS); }
"!="                { return (NOT_EQUALS); }
"^"                 { return '^'; }
"|"                 { return '|'; }
"&&"                { return (AND); }
"||"                { return (OR); }
"?"                 { return '?'; }
":"                 { return ':'; }
";"                 { return ';'; }
"..."               { return (ELLIPSIS); }
"="                 { return '='; }
"*="                { return MULTIPLY_ASSIGN; }
"/="                { return DIVIDE_ASSIGN; }
"%="                { return MODULO_ASSIGN; }
"+="                { return ADD_ASSIGN; }
"-="                { return SUBTRACT_ASSIGN; }
"<<="               { return LEFT_SHIFT_ASSIGN; }
">>="               { return RIGHT_SHIFT_ASSIGN; }
"&="                { return AND_ASSIGN; }
"^="                { return XOR_ASSIGN; }
"|="                { return OR_ASSIGN; }
","                 { return ','; }
"#"                 { return '#'; }

{COMMENT}           {;}

{IDENT}             { yylval.idl.name=new string(yytext);return IDENTIFIER;}
{INT_CONST}         { yylval.intval=atoi(yytext); return INTEGER_CONSTANT;}
{FLOAT_CONST}		{ yylval.floatval=atof(yytext); return FLOATING_CONSTANT;}
{C_CHAR_CONST}		{ yylval.charval=yytext[1]; return CHAR_CONST;}
{STRING_LITERAL}    { yylval.strval = new string(yytext);return STRING_LITERAL;}


{WHITESPACE}        {;}

%%