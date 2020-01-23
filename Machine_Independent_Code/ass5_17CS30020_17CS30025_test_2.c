/* 
Assignment No : 5
Assignment : Machine Independent Code Generator for tinyC 
Name : K Snehal Reddy (17CS30020)
       P Amshumaan Varma (17CS30020)
file: Test File 2 
*/


int max(int a, int b);
int min(int a, int b);
int fact(int n);

int main() { // function declarations
	int a=10;
	int b=20;
	
	int c = max(a, b);
	int d = max(a, b);
	c = fact(5);
	return 0;
}

int max(int a, int b)
{
	if (a > b) return a;
	else return b;
}

int min(int a, int b)
{
	int temp;
	temp = max(a,b);
	if (max == a) return b;
	else return a;
}

int fact(int n)
{
	if (n == 0) 
     		 return 1; 
    	return n * fact(n - 1); 
}
