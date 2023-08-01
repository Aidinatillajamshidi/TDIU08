#ifndef HERO_HANDLING_H
#define HERO_HANDLING_H

#include <string>
#include <vector>
#include <fstream>
#include <sstream>
#include <iostream>
#include <unistd.h>

using namespace std;

//STORA BOKSTÄVER PÅ STRUCT

////////////////////////////////////////////////////////////////////////////
struct hero_type
{
  std::string name{};
  int age{};
  double weight{};
  std::string haircolor{};
  std::vector<int> interests{};
};
////////////////////////////////////////////////////////////////////////////
bool read_hero(ifstream  & hero_file,
	       hero_type & hero);


#endif
