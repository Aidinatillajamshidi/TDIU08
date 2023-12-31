#include "hero_handling.h"
#include "register_handling.h"

using namespace std;

/////////////////////////////////////////////////////////////////////////////
//Läser in hjälten och kollar så att den inte existerar och sedan lägger till

bool read_hero(ifstream  & hero_file,
	       Hero_Type & hero)
{
  int intressen{};
  string temp_string{};
  stringstream ss;
  
  if(hero_file >> hero.name)
  {
    hero_file >> hero.birthdate;
    hero_file >> hero.weight;
    hero_file >> hero.hair;

    getline(hero_file, temp_string);
    ss.str(temp_string);
    
    while (ss >> intressen)
    {
      hero.interests.push_back(intressen);
    }
    return true;
  }
  else
  { 
 
    return false;
  }
}
/////////////////////////////////////////////////////////////////////////////
