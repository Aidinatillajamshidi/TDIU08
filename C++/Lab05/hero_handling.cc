#include "hero_handling.h"
#include "register_handling.h"
#include <iostream>
#include <vector>
#include <iomanip>
#include <iterator>
#include <string>
#include <fstream>
#include <algorithm>
#include <sstream>

using namespace std;

////////////////////////////////////////////////////////////////////////////
bool read_hero(ifstream  & hero_file,
	       hero_type & hero)
{
  int intressen{};
  string s {};
  stringstream ss;
  
  if(not (hero_file >> hero.name))
  {
    return false;
  }
  else
  { 
    hero_file >> hero.age;
    hero_file >> hero.weight;
    hero_file >> hero.haircolor;

    getline(hero_file, s);
    ss.str(s);
    
    while (ss >> intressen)
    {
      hero.interests.push_back(intressen);
    }
    return true;
  }
}
////////////////////////////////////////////////////////////////////////////
