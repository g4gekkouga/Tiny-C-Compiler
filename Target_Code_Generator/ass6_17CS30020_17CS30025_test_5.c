/* 
Assignment No : 6
Assignment : Machine Independent Code Generator for tinyC 
Name : K Snehal Reddy (17CS30020)
       P Amshumaan Varma (17CS30020)
file: Test File 5
*/


int main()
{
	//to check for all the loops
	int i,j=0,k=0;
	int i=0; 
      
    for (i = 1; i <= 10; i++) 
    { 
        j = j+1; 
	printInt(j);    
    } 
    while (j!=0)
	{
		j = j -1;
		printInt(j);
	}
	i = 10;
	do
    { 
        i--; 
  
    }  while (i > 1);
  
    return 0; 
}
