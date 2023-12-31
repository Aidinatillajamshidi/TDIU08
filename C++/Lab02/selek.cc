#include <iostream>
#include <iomanip>
#include <string>
#include <cctype>
#include <cmath>
#include <ctype.h>

using namespace std;


int main()

{
  
  int startv{}, slutv{}; //Del A
  double kelvin{273.15}; //Del A
  
  int alfa{}, numr{}, whitespace{}; //Del B
  char kara{}; //Del B

  string buffer{}, text{}, min{}, max{}; //Del C
  int words{}, chars{}; //Del C
  double average_char{}; //Del C
  
  cout << "Del 1: Temperaturtabell" << endl;

  do
    {
      cout << "Ange startvärde: ";
      cin >> startv;
      if (static_cast<double>(startv) <= -273.15)
	{
	  cout << "Felaktigt startvärde!" << endl;
	}
    } while (static_cast<double>(startv) <= -273.15);
  do
    {
      cout << "Ange slutvärde: ";
      cin >> slutv;
      if (startv > slutv)
	{
	  cout << "Felaktigt slutvärde!" << endl;
	}
    } while (startv > slutv);

  cout << "Celsius" << "   " << "Kelvin" << "   " << "Fahrenheit" << "  " << " Reaumur" << endl;
  cout << "---------------------------------------" << endl;
  
  for (int i = startv; (i <= slutv); i++)
    { 
    cout << setw(7) << i << "   ";
    cout << setw(6) << fixed << setprecision(2) << i + kelvin << "   ";
    cout << setw(10) << i * 1.8 + 32 << "   ";
    cout << setw(7) << i * 0.8 << endl;   
  }
  cin.ignore(10000, '\n');
  cout << "---------------------------------------";
  
/*--------------------------------------------------------------------------*/
  
  cout << "\n\n"  << "Del 2: Teckenhantering" << "\n";

  for (int i = 0; i < 10; i++)
    
    {
      cin.get(kara);
      if (isspace(kara))
  	{
  	  whitespace++;
  	}
      else if (isalpha(kara))
  	{
  	  alfa++;
  	}
      else if (isdigit(kara))
  	{
  	  numr++;
  	}
    }
  cin.ignore(10000, '\n');
   
  cout << "Texten innehöll:" << endl;
  cout << "Alfabetiska tecken:" << alfa << endl;
  cout << "Siffertecken......:" << numr << endl;
  cout << "Vita tecken.......:" << whitespace << endl;

/*--------------------------------------------------------------------------*/
  
  cout << "\n" << "Del 3: Ordhantering" << endl;
  cout << "Mata in en text:" << endl;

  while(cin >> buffer)
  {
    chars += buffer.size();
    if(min.empty())
    {
      min = buffer;
    }
    else if(buffer.size() < min.size())
    {
      min = buffer;
      }
    if(buffer.size() > max.size())
    {
      max = buffer;
    }
    words++;
  }

  if (buffer.size() == 0)
    {
      cout << "\n" << "Inga ord matades in." << endl;
    }
  else{
  
  average_char = static_cast<double>(chars) / static_cast<double>(words);
  cout << "\n" << "Texten innehöll " << words << " ord." << endl;
  cout << "Det kortaste ordet var " << '"' << min << '"' << " med " << min.size() << " tecken." << endl;
  cout << "Det längsta ordet var " << '"' << max << '"' << " med " << max.size() << " tecken." << endl;
  cout << "Medelordlängden var " << fixed << setprecision(1) << average_char << " tecken." << endl;
  }
  
  return 0;
  
}
