/* 
Assignment No : 6
Assignment : Machine Independent Code Generator for tinyC 
Name : K Snehal Reddy (17CS30020)
       P Amshumaan Varma (17CS30020)
file: Test File 3 
*/


int main()
{
	//to test the if else conditions
	int number1=1;
	int number2=2;
    if (number1 > number2)
    {
      if (number1 == number2) 
      {
        number2 = number2+1;
      }
      else 
      {
        number1 = number1+1;
      }
    }
    else
    {
        number2 = number2+2;
    }
    return 0;
}
