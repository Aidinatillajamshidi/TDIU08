#include <iostream>
#include <iomanip>
#include <string>


using namespace std;
//////////////////////////////////////////////////////////////////////////////
void factorialize(unsigned int &number)
{

  for(unsigned int i{1}; i <= number; i++)
    {
      if (number % i == 0)
      cout << i << " ";
   }
}
//////////////////////////////////////////////////////////////////////////////
int main()
{
  unsigned int number{};
  
  cout << "Mata in tal: ";

do
  {
    cin >> number;
  }
 while(number != 0);
 factorialize(number);
 number = 15 % 3;
 cout << number << endl;
  cout << "Tests" << endl;

  return 0;
}