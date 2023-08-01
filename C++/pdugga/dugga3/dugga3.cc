#include <iostream>
#include <iomanip>
#include <string>
#include <cmath>

using namespace std;
//////////////////////////////////////////////////////////////////////////
void star_dot(int const &rows,
	      int const &columns,
	      int const &stars_to_convert)
{
  int sum{0};
  char star{'*'};
  char dot{'.'};

  sum = (rows * columns) - stars_to_convert;

  for(int i{0}; i < rows; i++)
    {
      for(int j{0}; j < columns; j++) 
        {                            
	  star_dot(rows, columns, stars_to_convert);
        }
      cout << endl;
    }
}

void print_figure(int const &rows,
		  int const &columns,
		  int const &stars_to_convert)
{
  char star{'*'};
  
  for(int i{0}; i < rows; i++)
    {
      for(int j{0}; j < columns; j++) 
        {                            
	  if(stars_to_convert > 0)
	    {
	      star_dot(rows, columns, stars_to_convert);
	    }
	  else
	    {
	       cout << star;
	    }
        }
      cout << endl;
    }
}

//////////////////////////////////////////////////////////////////////////
int main()
{
  int rows, columns;
  int stars_to_convert;

  cout << "Enter dimensions: ";
  cin >> rows >> columns;

  print_figure(rows, columns, 0);

  cout << "Enter number of stars to convert: ";
  cin >> stars_to_convert;

  print_figure(rows, columns, stars_to_convert);

  cout << "End of program.";
  return 0;
}
