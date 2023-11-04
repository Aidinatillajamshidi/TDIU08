//aidja644: Samarbetat med antfr919, Anton Fredriksson, samma program

#include "hero_handling.h"
#include "register_handling.h"
#include <iostream>
using namespace std;

/////////////////////////////////////////////////////////////////////////////
//Laddar in interests

vector<int> load_interests() 
{                                  
  vector<int> temp_vector{};
  int temp_int{};
  string temp_string{};
  stringstream ss;

  getline(cin,temp_string);
  ss.str(temp_string);
 
  while(ss >> temp_int)
  {
    if((temp_int < 16) and (temp_int > 0))
    {
      temp_vector.push_back(temp_int);
    }
  }
  return temp_vector;
}
/////////////////////////////////////////////////////////////////////////////
//Menu selection 3) - Quit program: Avslutar programmet

bool quit_program(bool & run)
{
  run = false;
  cout << "Terminating Hero Matchmaker 3000!" << endl;
  return run;
}
/////////////////////////////////////////////////////////////////////////////
//Menu selection 2) - Matchmake:ar heroes mot varandra

void hero_finder (Register_Type & heroes)
{
  Register_Type hero_mm{};
  vector<int> temp_vector{};
   
  cin.ignore(1000,'\n'); 
  cout << "Enter your interests (at least one between 1 and 15): ";
  
  while (true)
  {
    temp_vector = load_interests();
    
    if (temp_vector.size() > 0)
    {
      break;
    }
  }
  
  hero_mm = search_heroes(heroes, temp_vector);
  cout << "There are " << hero_mm.size() << " matching heroes." << endl;
  cout << "Hero name  Birth year  Weight  Hair color  Interests"<< endl;
  cout << "===================================================="<< endl;
  
  print_heroes(cout, hero_mm);
}
/////////////////////////////////////////////////////////////////////////////
//Menu selection 1) - Lägger till nya heroes till textfilen

void hero_register(Register_Type       & heroes,
		   string        const & file_name) 
{
  Hero_Type hero;
  
  while (true)
  {
    cout << "Enter hero information:" << endl;
    if (add_hero(heroes, file_name)) 
    {
      break;
    }
    else
    {
      cout << "Hero already in register. ";
      cin.ignore(1000,'\n');
    } 
  }
  cout << "The hero was added to the register on file " << file_name << endl;
}
/////////////////////////////////////////////////////////////////////////////
//Utskrift av text i terminal

void print_menu()
{
  cout << "1) Add new hero to register file" << endl
       << "2) Find matching heroes" << endl
       << "3) Quit program" << endl
       << "Select: ";
}
/////////////////////////////////////////////////////////////////////////////
//Menu Selection: Val mellan 1-3

void cases(Register_Type       & heroes,
	   string        const & file_name)
{
  int choice{};
  bool run;


  cout << "Welcome to Hero Matchmaker 3000!" << endl;
  while(run)
    {
      print_menu();
      cin >> choice;
      while (choice < 1 or choice > 3)
	{
	  cout << "Select: ";
	  cin >> choice;
	}
	  
      switch(choice)
	{
	case 1:
	  hero_register(heroes, file_name);
	  break;

	case 2:
	  hero_finder(heroes);
	  break;

	case 3:
	  quit_program(run);
	  break;
	}
      
    }

    
      
    
}
/////////////////////////////////////////////////////////////////////////////
//MAIN - Start av program

int main(int argc, char*argv[])
{
  ifstream hero_file{}; 
  Register_Type heroes{};
  string file_name{};
  
  if (argc < 2 or argc > 2)
  {
    cout << "Incorrect number of arguments!" << endl
	 << "Usage: " << argv[0] << " REGISTERFILE" << endl;
  }
  else
  {
    file_name = argv[1];
    hero_file.open(argv[1]);
    heroes = read_file(hero_file); 
    hero_file.close(); 
    
    cases(heroes, file_name); 
  }
  return 0;
}
