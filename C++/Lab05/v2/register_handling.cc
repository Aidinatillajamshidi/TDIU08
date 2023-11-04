// aidja644: Samarbetat med antfr919, Anton Fredriksson, samma program

#include "register_handling.h"
#include "hero_handling.h"

using namespace std;

/////////////////////////////////////////////////////////////////////////////
bool operator<(Hero_Type const & lhs,
	       Hero_Type const & rhs)
{
  if (lhs.name < rhs.name)
  {
    return true;
  }
  else
  {
    return false;
  }
}

void sorting(Register_Type & heroes)
{
  for (Hero_Type & hero : heroes)
  {
    sort(begin(hero.interests), end(hero.interests));
  }
  sort(begin(heroes), end(heroes));

}
/////////////////////////////////////////////////////////////////////////////
void print_heroes (ostream             & os,
		   Register_Type const & heroes) 
{
   os << fixed << setprecision(2);

  for(int i{}; i <  static_cast<int>(heroes.size()); i++)
  {
    os << setw(11) << left << heroes.at(i).name;
    os << setw(12) << heroes.at(i).birthdate;
    os << setw(8) << heroes.at(i).weight;
    os << setw (12) << heroes.at(i).hair;

    for(int k{}; k < static_cast<int>(heroes.at(i).interests.size()); k++)
    {
    os << setw(3) << right << heroes.at(i).interests.at(k);
    }    

    os << endl;

  }
}

void write_hero(Register_Type       & heroes,
		string        const & file_name)
{
  ofstream hero_file(file_name, ios::out);
 
  print_heroes(hero_file, heroes); 
  hero_file.close(); 
}

/////////////////////////////////////////////////////////////////////////////
bool add_hero(Register_Type  & Heroes,
	      string   const & file_name)
{
  Hero_Type tmp;
  stringstream ss;
  string s{};
  int intressen {};

  cin >> tmp.name;
  for(int i{}; i < static_cast<int>(Heroes.size()); i++)
  {
    if (Heroes.at(i).name == tmp.name)
    {
      return false;
    }
  }
  cin >> tmp.birthdate;
  cin >> tmp.weight;
  cin >> tmp.hair;

  getline(cin, s);
  ss.str(s);
   
  while (ss >> intressen)
  {
    tmp.interests.push_back(intressen);
  }

  Heroes.push_back(tmp); 
  sorting(Heroes); 
  write_hero(Heroes, file_name);

  return true;
}

/////////////////////////////////////////////////////////////////////////////

Register_Type read_file(ifstream & hero_file)
{
  Hero_Type hero{};
  Register_Type heroes;

  while (read_hero(hero_file, hero)) 
  {
    heroes.push_back(hero);
    hero.interests.clear();
  }
  
  return heroes;
}

/////////////////////////////////////////////////////////////////////////////
bool hero_duplicate(Register_Type const & match_heroes,
			      Hero_Type     const & hero)
{
  for(int i{}; i < static_cast<int>(match_heroes.size()); i++)
  {
    if (match_heroes.at(i).name == hero.name)
    {
      return true;
    }
  }
  
  return false;
}

/////////////////////////////////////////////////////////////////////////////
Register_Type search_heroes(Register_Type   const & heroes,
				vector<int> const & temp)
{
  Register_Type match_heroes{};
  Hero_Type hero{};

  for (int i{}; i <static_cast<int>(temp.size()); i++)
  {
    for (int j{}; j < static_cast<int>(heroes.size()); j++)
    {
      for (int k{}; k < static_cast<int>(heroes.at(j).interests.size()); k++)
      {
	if (temp.at(i) == heroes.at(j).interests.at(k))
	{
	  if (not hero_duplicate(match_heroes, heroes.at(j)))
	  {
      	    hero = heroes.at(j);
	    match_heroes.push_back(hero);	   
	  }
	}
      }
    }
  }
  sorting(match_heroes); 
  return match_heroes;
}
/////////////////////////////////////////////////////////////////////////////
