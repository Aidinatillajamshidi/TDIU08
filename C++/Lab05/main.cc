#include "hero_handling.h"
#include "register_handling.h"
#include <string>
#include <vector>
#include <fstream>
#include <sstream>
#include <stdlib.h>
#include <stdio.h>
#include <iomanip>
#include <iostream>
#include <unistd.h>

using namespace std;
///////////////////////////////////////////////////////////////////////////
void find_heroes(int &input)
{
   ifstream file;
   string str;

   file.open("REGISTER_1.TXT",ios::in);
    cout << "Enter your interests (at least one between 1 and 15): ";
    // file >> str;
    //cout << str;
    do
      {
	cin >> input;
      }
    while(input < 1 || input > 15);
}
///////////////////////////////////////////////////////////////////////////
//UP: Menu selection print
int print_mm(int &choice)
{
  cout << "Welcome to Hero Matchmaker 3000!" << endl;
  cout << "1. Add new hero to register file" << endl;
  cout << "2. Find matching heroes" << endl;
  cout << "3. Quit program" << endl;
  do
    {
      cout << "Select: ";
      cin >> choice;
    }
  while(choice < 1 && choice > 3);
  
  return choice;
}
////////////////////////////////////////////////////////////////////////////
//UP: Menu selection choice 3
void quit_program(bool &run)
{
  run = false;
  cout << "Terminating Hero Matchmaker 3000!" << endl;
}
////////////////////////////////////////////////////////////////////////////
void cases(bool &run,
	   string &argv_string)
{
  int choice{};
  int input{};
  hero_type hero{};
  vector<hero_type> hero_vector{};
  Register_Type heroes;

  choice = print_mm(choice);
  switch(choice)
    {
    case 1:
      //create_hero(hero_type &hero,
      //  vector<hero_type> &hero_vector);
      create_hero(hero, hero_vector, argv_string);
      break;

    case 2:
      find_heroes(input);
      print_heroes();
      break;

    case 3:
      quit_program(run);
      break;
    }
}
////////////////////////////////////////////////////////////////////////////
//HP: Main-program
int main(int argc,
	 char* argv[])
  {
    bool run{true};
    string argv_string{argv[1]};     //Används för att ge namnet på textfilen

    if(argc > 2 || argc == 1)
      {
	cout << "Incorrect number of arguments!" << endl;
	cout << "Usage: " << argv[0] << " REGISTERFILE" << endl;
	return 0;
      }

    cout << argv_string << endl;
    
    while(run)
      {
    	cases(run, argv_string);
      }
    
   return 0;
  }
