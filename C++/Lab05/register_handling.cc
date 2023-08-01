#include "register_handling.h"
#include "hero_handling.h"
#include <vector>
#include <fstream>
#include <iostream>
#include <iomanip>
#include <string>
#include <algorithm>
#include <sstream>

using namespace std;

////////////////////////////////////////////////////////////////////////////
void create_hero(hero_type &hero,
		 vector<hero_type> &hero_vector,
		 string &argv_string)
{
  string buffer{};
  int all_interests{};
  stringstream ss{};
  fstream file{};

  file.open(argv_string, fstream::app);
  
  cout << "Enter hero information:" << endl;
  cin >> hero.name >> hero.age >> hero.weight >> hero.haircolor;
  while(getline(cin, buffer))
    {
      ss << buffer;
      while(ss >> all_interests)
  	{
  	  hero.interests.push_back(all_interests);
  	}
      sort(hero.interests.begin(),hero.interests.end());
      break;
    }
  file << left << setw(11) << hero.name << setw(12) << hero.age;
  file << setw(8) << hero.weight << setw(12) << hero.haircolor;
  for(int i: hero.interests)
    {
      file << right << setw(3) << i;
    }
  file << "\n";

  hero_vector.push_back(hero);
  //sort(hero.begin(),hero.end());
  file.close();
}
////////////////////////////////////////////////////////////////////////////
void print_heroes()
{
  cout << "There are " << "VARIABEL" << " matching heroes." << endl;
  cout << "Hero name " << right << setw(12) << "Birth year " << setw(8) << "Weight ";
  cout << setw(12) << "Hair color " << setw(10) << "Interests" << endl;
  cout << "====================================================" << endl;
}
