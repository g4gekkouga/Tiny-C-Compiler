/* 
Assignment No : 5
Assignment : Machine Independent Code Generator for tinyC 
Name : K Snehal Reddy (17CS30020)
       P Amshumaan Varma (17CS30020)
file: lexer code in flex, .l file 
*/


%{
	#include "ass5_17CS30020_17CS30025_translator.h"
	#include <math.h>
	#include <stdio.h>
	#include "y.tab.h"
	extern void yyerror(const char *);
	static void comment(void);
%}

%option noyywrap

DIGIT [0-9]
Non_Zero_Digit [1-9]
IDENT_ND [A-Za-z_]
IDENTIFIER ({IDENT_ND}({IDENT_ND}|{DIGIT})*)
sign [+-]
Digit_Sequence {DIGIT}+
E ([eE]{sign}?{Digit_Sequence})
ZERO "0"
INTEGER_CONSTANT (({Non_Zero_Digit}({DIGIT}*))|{ZERO}+)
DOT "."
Fraction (({Digit_Sequence}?{DOT}{Digit_Sequence})|({Digit_Sequence}{DOT}))
FLOAT_CONSTANT (({Fraction}{E}?)|({Digit_Sequence}{E}))
ENUM_CONSTANT {IDENTIFIER}
ESC_SEQ \\[\'\"\?\\abfnrtv]
cchar [^\'\\\n]|{ESC_SEQ}
C_CHAR_SEQ {cchar}+
CHARACTER_CONSTANT (\'{C_CHAR_SEQ}\')
CONSTANTS ({INTEGER_CONSTANT}|{FLOAT_CONSTANT}|{ENUM_CONSTANT}|{CHARACTER_CONSTANT})
schar [^\"\\\n]|{ESC_SEQ}
S_CHAR_SEQ {schar}+
STRING_CONSTANT \"{S_CHAR_SEQ}*\"
WS [ \n\t]
SingleLineComment [/][/].*
MULTI_END [\*]+[/]
MULTI_START [/][\*]+
NON_STAR (([^\*]).*)
NON_FS ([^/].*)
AVOID_MULTI_END (NON_STAR|([\*]{NON_FS}))
MultiLineComment ({MULTI_START}(([^\*])|((\*)+[^/\*]))*{MULTI_END})
COMMENT {SingleLineComment}|{MultiLineComment}


%%

"Matrix"	    {return MATRIX;}
"auto" { return AUTO; } 
"break" { return BREAK; } 
"case" { return CASE; } 
"char" { return CHAR; } 
"const" { return CONST; } 
"continue" { return CONTINUE; } 
"default" { return DEFAULT; } 
"do" { return DO; } 
"double" { return DOUBLE; } 
"else" { return ELSE; } 
"enum" { return ENUM; } 
"extern" { return EXTERN; } 
"float" { return FLOAT; } 
"for" { return FOR; } 
"goto" { return GOTO; } 
"if" { return IF; } 
"inline" { return INLINE; } 
"int" { return INT; } 
"long" { return LONG; } 
"register" { return REGISTER; } 
"restrict" { return RESTRICT; } 
"return" { return RETURN; } 
"short" { return SHORT; } 
"signed" { return SIGNED; } 
"sizeof" { return SIZEOF; } 
"static" { return STATIC; } 
"struct" { return STRUCT; } 
"switch" { return SWITCH; } 
"typedef" { return TYPEDEF; } 
"union" { return UNION_; } 
"unsigned" { return UNSIGNED; } 
"void" { return VOID; } 
"volatile" { return VOLATILE; }
"while" { return WHILE; } 
"_Bool" { return _BOOL; } 
"_Complex" { return _COMPLEX; } 
"_Imaginary" { return _IMAGINARY; } 




".'"				{return TRANSPOSE;}
"["                 {return '[';  }
"]"                 { return ']'; }
"("                 { return '('; }
")"                 { return ')'; }
"{"                 { return '{'; }
"}"                 { return '}'; }
"."                 { return '.'; }
"->"                { return PTR_OP; }
"++"                { return INCREMENT; }
"--"                { return DECREMENT; }
"&"                 { return '&'; }
"*"                 { return '*'; }
"+"                 { return '+'; }
"-"                 { return '-'; }
"~"                 { return '~'; }
"!"                 { return '!'; }
"/"                 { return '/'; }
"%"                 { return '%'; }
"<<"                { return LEFT_OP; }
">>"                { return RIGHT_OP; }
"<"                 { return '<'; }
">"                 { return '>'; }
"<="                { return LE_OP; }
">="                { return GE_OP; }
"=="                { return EQ_OP; }
"!="                { return NE_OP; }
"^"                 { return '^'; }
"|"                 { return '|'; }
"&&"                { return AND_OP; }
"||"                { return OR_OP; }
"?"                 { return '?'; }
":"                 { return ':'; }
";"                 { return ';'; }
"..."               { return ELLIPSIS; }
"="                 { return '='; }
"*="                { return MUL_ASSIGN; }
"/="                { return DIV_ASSIGN; }
"%="                { return MOD_ASSIGN; }
"+="                { return ADD_ASSIGN; }
"-="                { return SUB_ASSIGN; }
"<<="               { return LEFT_ASSIGN; }
">>="               { return RIGHT_ASSIGN; }
"&="                { return AND_ASSIGN; }
"^="                { return XOR_ASSIGN; }
"|="                { return OR_ASSIGN; }
","                 { return ','; }
"#"                 { return '#'; }


{WS} { /* whitespace */ }
{COMMENT} {/*comment*/}

{IDENTIFIER}             { yylval.idl.name=new string(yytext);return IDENTIFIER;}
{INTEGER_CONSTANT}         { yylval.intval=atoi(yytext); return INTEGER_CONSTANT;}
{FLOAT_CONSTANT}		{ yylval.floatval=atof(yytext); return FLOATING_CONSTANT;}
{CHARACTER_CONSTANT}		{ yylval.charval=yytext[1]; return CHAR_CONST;}
{STRING_CONSTANT}    { ;return STRING_CONSTANT;}


%%
