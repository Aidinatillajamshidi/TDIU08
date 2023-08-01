#include <iostream>
#include <iomanip>
#include <string>
#include <sstream>


using namespace std;

string user_input(string & str)
{
  stringstream ss{};
  int n{};
  
  cout << "Enter text: ";
  cin >> str;
  
  
  return str;
  if(str.substr(n, 5))
  {
     ss << str;
   }
}

int main()
{
  string str{};
  
  user_input(str);
  cout << "Potential LiUid:s found: " << endl;
  return 0;
}
