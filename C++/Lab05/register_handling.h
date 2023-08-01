#ifndef REGISTER_HANDLING_H
#define REGISTER_HANDLING_H

#include "hero_handling.h"
#include <vector>
#include <string>
////////////////////////////////////////////////////////////////////////////
using Register_Type = vector<hero_type>;

void create_hero(hero_type &hero,
		 std::vector<hero_type> &hero_vector,
		 std::string &argv_string);

void print_heroes();

//Register_Type read_file
////////////////////////////////////////////////////////////////////////////

#endif
