#include <iostream>
#include <iomanip>
#include <string>
#include <cctype>
#include <cmath>
#include <ctype.h>

using namespace std;

/*-------------------------------------------------------------------------*/
//Underprogram: Menu selection

int menu_selection()                    
{
  int choice{};
  cout << "1. Beräkna N-fakultet." << endl;
  cout << "2. Multiplicera en sträng." << endl;
  cout << "3. Byta värden på ett heltal och ett flyttal." << endl;
  cout << "4. Beräkna totala längden samt medellängden på två strängar." << endl;
  cout << "5. Avsluta programmet." << endl;
  cout << "Val: ";
  cin >> choice;

  if (choice < 1 || choice > 5)
    {
      cout << "Fel val!" << endl;
    }
  
  return choice;
}
/*-------------------------------------------------------------------------*/
//Underprogram: val 1
int nfak(int const n)                      
{
  if (n == 1)
    {
      return n;
    }
  if (n == 0)
    {
      return 1;
    }
  else
    {
      return (n * nfak(n - 1));
    }
}

void return_nfak()                
{
  int sum{}, heltal{};
  
  cout << "Mata in ett heltal: ";
  cin >> heltal;
  sum = nfak(heltal);
  cout << "Fakulteten av " << heltal << " är " << sum << endl;
}
/*-------------------------------------------------------------------------*/
//Underprogram: Val 2
string mult_text(string const &text,
		 int    const &multiplier)
{
  string temp{};
  
  for (int i{0}; i < multiplier; i++)
    {
      temp += text;
    }
  
  return temp;
}

void mult_textinput()
{
  string text{};
  int multiplier{};
  
  cout << "Mata in en text och ett heltal: ";
  cin >> text >> multiplier;
  cout << "Den multiplicerade texten är ";
  cout << mult_text(text, multiplier);
  cout << endl;
}
/*-------------------------------------------------------------------------*/
//Underprogram: Val 3            

void swap(double &dbl,
	 int     &heltal)
{
  double temp{};
  
  temp = ceil(dbl);
  dbl = static_cast<double>(heltal);
  heltal = static_cast<int>(temp);

}

void swap_var()
{

  double dbl{};
  int heltal{};
  
  cout << "Mata in ett heltal och ett flyttal: ";
  cin >> heltal >> dbl;
  swap(dbl,heltal);
  cout << "Heltalets värde är nu " << heltal << endl;
  cout << fixed << setprecision(1) << "Flyttalets värde är nu " << dbl << endl;
  swap(dbl, heltal);

}

/*-------------------------------------------------------------------------*/
//Underprogram: Val 4
void str_length(int         &total_length,
	       double       &mean_length,
	       string const &text_1,
	       string const &text_2)
{
  total_length = text_1.size() + text_2.size();
  mean_length = static_cast<double>((text_1.size() + text_2.size()))/2.0;
}

void str_lengthinput()
{
  int    total_length{};
  double mean_length{};
  string text_1{}, text_2{};
  
  cout << "Mata in två ord: ";
  cin >> text_1 >> text_2;
  str_length(total_length, mean_length, text_1, text_2);
  cout << "Totallängd: " << total_length << endl;
  cout << fixed << setprecision(1) << "Medellängd: " << mean_length << endl;
}
/*-------------------------------------------------------------------------*/
//Underprogram: Val 5
void exit_input(bool &run)
{
  run = false;
  cout << "Ha en bra dag!" << endl;

}
/*-------------------------------------------------------------------------*/
//Underprogram: Cases

void cases(bool &run)
{
    int choice{};
  
    choice = menu_selection();
      switch (choice)
	{
	case 1:
	  return_nfak();
	  break;

	case 2:
	  mult_textinput();
	  break;

	case 3:
	  swap_var();
	  break;

	case 4:
	  str_lengthinput();
	  break;

	case 5:
	  exit_input(run);
	  break;
	}
}
/*-------------------------------------------------------------------------*/
//Huvudprogram:
int main()
  
{
  bool run{true};

  cout << "Välkommen till huvudmenyn!" << endl;
  while (run)
    {
      cases(run);
    }
  return 0;
}
