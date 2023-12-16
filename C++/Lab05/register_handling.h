#ifndef REGISTER_HANDLING_H
#define REGISTER_HANDLING_H

#include "hero_handling.h"

#include <vector>
#include <string>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <algorithm>
#include <sstream>

/////////////////////////////////////////////////////////////////////////////
//Funktioner för hantering av Register_Type

using Register_Type = std::vector<Hero_Type>;

bool add_hero(Register_Type        & Heroes,
	      std::string   const  & file_name);

Register_Type read_file(std::ifstream & hero_file);

Register_Type search_heroes(Register_Type const & heroes,
			    std::vector<int>   const & temp);

void print_heroes(std::ostream        & os,
		   Register_Type const & match_heroes);
/////////////////////////////////////////////////////////////////////////////
#endif
