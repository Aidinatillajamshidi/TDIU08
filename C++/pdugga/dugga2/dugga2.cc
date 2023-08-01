#include <iostream>
#include <iomanip>
#include <string>


using namespace std;
///////////////////////////////////////////////////////////////////////////
//MÅSTE ÄNDRA FRÅN VOID TILL INT
void print_triangles(int &size,
		     int const &shrink_factor)
{
  char base{'-'};
  while(size > 0)
    {
      cout << string(size, base);
  size = size - shrink_factor;
    }
}
///////////////////////////////////////////////////////////////////////////
int main()
{
  int size{};
  int shrink_factor{};

  cout << "Enter numbers: ";
  cin >> size >> shrink_factor;
  print_triangles(size, shrink_factor);
  cout << "Number of triangles: " << size << endl;
  return 0;
}
