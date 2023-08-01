#include <iostream>
#include <iomanip>
#include <cctype>

using namespace std;

int main()
{
  int alpha{};
  int numbers{};
  int whitespaces{};
  int total_amount_of_characters{};

  char character{};
  while(cin.get(character))
  {
    if(isalpha(character))
    {
      alpha++;
    }
    else if(isblank(character))
    {
      whitespaces++;
    }
    else if(isdigit(character))
    {
      numbers++;
    }

    total_amount_of_characters++;
  }

  cout << "Indata innehöll:" << endl <<
          "Alfabetiska tecken: " << alpha << endl <<
          "Siffertecken......: " << numbers << endl <<
          "Vita tecken.......: " << whitespaces << endl <<
          "Tecken totalt.....: " << total_amount_of_characters << endl;

  return 0;
}
