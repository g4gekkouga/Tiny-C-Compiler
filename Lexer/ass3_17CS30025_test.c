/* 
Name : Pericherla Amshumaan Varma
Roll No : 17CS30025
Assignment No : 3
File : tiny c code to test the lexer, .c file
*/

#define MACRO 1000

// Sample code of fibonacci
#include<stdio.h>    
int main()    
{    
 int n1=0,n2=1,n3,i,number;    
 printf("Enter the number of elements:");    
 scanf("%d",&number);    
 printf("\n%d %d",n1,n2);//printing 0 and 1    
 for(i=2;i<number;++i)//loop starts from 2 because 0 and 1 are already printed    
 {    
  n3=n1+n2;    
  printf(" %d",n3);    
  n1=n2;    
  n2=n3;    
 }  
  return 0;  
 }


// keywords
auto enum restrict unsigned
break extern return void
default inline struct _Imaginary
do int switch
double long typedef
else register union

_int

\a \b \f \n \r \t \v

// single-line comment

/* Multi line comment */

//////////
/**/

// All non-digit identifiers
a b c d e f g h i j k l m
n o p q r s t u v w x y z
A B C D E F G H I J K L M
N O P Q R S T U V W X Y Z

// All Punctuators
[ ] ( ) { } . ->
++ -- & * + - ~ !
/ % << >> < > <= >= == != ^ | && ||
? : ; ...
= *= /= %= += -= <<= >>= &= ^= |=

'a'
66
66.676
.6666
main int
6266757;
\n
"asc"
'abc'
case float short volatile
char for signed while
const goto sizeof Bool
continue if static Complex
/int n;
cin>>n;
/int t;cin>>t;


///*////*//////

// other keywords
volatile   signed while const goto sizeof  Complex default inline  Imaginary do  switch  register union

extern int var;
static float qw12_;

typedef struct student
{ 
	unsigned int a;	
	float b;
	short c;
	char d[20];
	double e;
	long long int f;
	bool g;
} status;

double testing
{
	auto a = 2.34;
	float e = e+123;
	enum week{Mon, Tue, Wed};
	while (a--) a++;
	return;
}

\' \'' \? \\
