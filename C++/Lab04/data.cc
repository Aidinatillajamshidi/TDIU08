// aidja644: Arbetat enskilt

#include <iostream>
#include <iomanip>
#include <string>
#include <cctype>
#include <ctype.h>
#include <random>
#include <iterator>
#include <algorithm>
#include <vector>

using namespace std;

struct Person_Type
{
  string namn{};
  string efternamn{};
  string klubb{};
  vector<double> tider;
};
//////////////////////////////////////////////////////////////////////////////
//Underprogram: Jämför tider och returerar bool
bool operator<(const Person_Type & other_1, const Person_Type & other_2)
  {
    return other_1.tider[0] < other_2.tider[0];
  }
//////////////////////////////////////////////////////////////////////////////
//Underprogram: Inmatning av person
void inmatning(vector<Person_Type> &v)
{
  Person_Type person{};
  cout << "Mata in deltagare:" << endl;

  while(true)
    {
      cin >> person.namn;
      if(person.namn == "KLAR")
      	{
	  cin.ignore();
	  break;
      	}
      cin >> person.efternamn;
      getline(cin, person.klubb);

      v.push_back(person);
    }
}
//////////////////////////////////////////////////////////////////////////////
//Underprogram: Inmatning av tider
void tiderinput(vector<Person_Type> &v)
{
  double temp{};

  for(unsigned int i{0}; i < v.size() ; i++)
    {
      	  cout << "Tider " << v[i].namn << ": ";
      while(true)
	{
	  cin >> temp;
	  if(temp == -1.00)
	    {
	      break;
	    }
	  v[i].tider.push_back(temp);
	  sort(v[i].tider.begin(),v[i].tider.end());
	}
    }
  sort(v.begin(),v.end());
}
//////////////////////////////////////////////////////////////////////////////
//Underprogram: Utskrift
void tabell(vector<Person_Type> &v)
{
  cout << "Efternamn " << "  " << "Förnamn ";
  cout << right << setw(17) << "Klubb: " << "Tider" << endl;
  cout << "==========================================" << endl;
  
  for(unsigned int i{0}; i < v.size(); i++)
    {
      cout << right << setw(9) << v[i].efternamn << setw(10) << v[i].namn;
      cout << setw(16) << v[i].klubb << ":";
      for(double i: v[i].tider)
	{
	  cout << fixed << setprecision(2) << " " << i;
	}
      cout << endl;
    }
}
//////////////////////////////////////////////////////////////////////////////
//Huvudprogram
int main()
{

  Person_Type person{};
  vector<Person_Type> v{};
  random_device r;

  inmatning(v);
  tiderinput(v);
  tabell(v);

  return 0;
}
