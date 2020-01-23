/* 
Assignment No : 6
Assignment : Machine Independent Code Generator for tinyC 
Name : K Snehal Reddy (17CS30020)
       P Amshumaan Varma (17CS30020)
file: Test File 4
*/


int factorial(int n);
 
int main() 
{ 
    int num;
    int out;    
    readInt(&num);
    out = factorial(num);
    printInt(out);
    return 0; 
} 

int factorial(int n) 
{ 
    if (n == 0) 
    	return 1; 
    return n * factorial(n - 1); 
} 
