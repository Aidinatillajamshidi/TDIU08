#include <iostream>
#include <iomanip>
#include <string>


using namespace std;


int main()

{
  
  int heltal;
  double flyt;
  char kara;
  string str;
    
  cout << "Skriv in ett heltal: ";
  cin >> heltal;
  cout << "Du skrev in heltalet: ";
  cout << heltal << endl;
  cin.clear();
  cin.ignore(10000, '\n');
  
  cout << "\n" << "Skriv in fem heltal: ";
  cin >> heltal;
  cout << "Du skrev in heltalen: ";
  cout << heltal << " ";
  cin >> heltal;
  cout << heltal << " ";
  cin >> heltal;
  cout << heltal << " ";
  cin >> heltal;
  cout << heltal << " ";
  cin >> heltal;
  cout << heltal << endl;
  cin.clear();
  cin.ignore(10000, '\n');

  cout << "\n" << "Skriv in ett flyttal: ";
  cin >> flyt;
  cout << "Du skrev in flyttalet: ";
  cout << fixed << setprecision(3) << flyt << endl;
  cin.clear();
  cin.ignore(10000, '\n');

  cout << "\n" << "Skriv in ett heltal och ett flyttal: ";
  cin >> heltal;
  cin >> flyt;
  cout << "Du skrev in heltalet:";
  cout << right << setw(10) << heltal << "\n";
  cout << "Du skrev in flyttalet:";
  cout << right << setw(9) << fixed << setprecision(4) << flyt << endl;
  cin.clear();
  cin.ignore(10000, '\n');

  cout << "\n" << "Skriv in ett flyttal och ett heltal: ";
  cin >> flyt;
  cin >> heltal;
  cout << "Du skrev in heltalet:";
  cout << setfill('-') << setw(10) << heltal << "\n";
  cout << "Du skrev in flyttalet:";
  cout << setfill('-') << setw(9) << fixed << setprecision(4) << flyt << endl;
  cin.clear();
  cin.ignore(10000, '\n');

  cout << "\n" << "Skriv in ett tecken: ";
  cin >> kara;
  cout << "Du skrev in tecknet: ";
  cout << kara << endl;
  cin.clear();
  cin.ignore(10000, '\n');

  cout << "\n" << "Skriv in ett ord: ";
  cin >> str;
  cout << "Du skrev in ordet: ";
  cout << str << endl;
  cin.clear();
  cin.ignore(10000, '\n');

  cout << "\n" << "Skriv in ett heltal och ett ord: ";
  cin >> heltal >> str;
  cout << "Du skrev in heltalet |" << heltal << "| och ordet |" << str << "|." << endl;
  cin.clear();
  cin.ignore(10000, '\n');

  cout << "\n" << "Skriv in ett tecken och ett ord: ";
  cin >> kara >> str;
  cout << "Du skrev in " << "\"" << str << "\"" << " och " << "\"" << kara << "\"" << "." << endl;
  cin.clear();
  cin.ignore(10000, '\n');

  cout << "\n" << "Skriv in ett ord och ett tecken: ";
  cin >> str >> kara;
  cout << "Du skrev in " << "\"" << str << "\"" << " och " << "\"" << kara << "\"" << "." << endl;
  cin.clear();
  cin.ignore(10000, '\n');

  cout << "\n" << "Skriv in en textrad: ";
  getline(cin,str);
  cout << "Du skrev in " << "\"" << str << "\"" << ".";
  cin.clear();

  cout << "\n\n" << "Skriv in en till rad text: ";
  getline(cin,str);
  cout << "Du skrev in " << "\"" << str << "\"" << ".";
  cin.clear();

  cout << "\n\n" << "Skriv in en rad med tre ord: ";
  getline(cin,str);
  istringstream ss(str);
  ss >> str;
  cout << "Du skrev in: " << "\"" << str << "\", ";
  ss >> str;
  cout << "\"" << str << "\" och ";
  ss >> str;
  cout << "\"" << str << "\"." << endl;
  cin.clear();
  
  return 0;
  
}
