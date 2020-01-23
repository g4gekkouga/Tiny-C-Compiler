/* 
Assignment No : 6
Assignment : Machine Independent Code Generator for tinyC 
Name : K Snehal Reddy (17CS30020)
       P Amshumaan Varma (17CS30020)
file: Test File 1 
*/

int main()
{
	int i;
	float f;
	char c;
	c = 'a';
//read and print string functions are not working as unable to pass strings as function parameters
	readInt(&i);
	printInt(i);
	readFlt(&f);
	printFlt(f);
}

