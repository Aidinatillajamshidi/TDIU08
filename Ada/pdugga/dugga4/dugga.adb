with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;



procedure Dugga is
   
--------------------------------------------------------------------   
   function Letterswap(Fourletters : in String;
		       C : in Character) return String is
      
      Swap : String(1..4);
      
   begin
      
      Swap := Fourletters;
      Swap(1) := C;
      
      return Swap;
      
   end Letterswap;
--------------------------------------------------------------------   
   function "-"(Heltal : in Integer;
		Flyttal1 : in Float) return Float is
      
      Sum : Float;
      
   begin
      
      Sum := Float(Heltal) - (Flyttal1);
      
      return Sum;
      
   end "-";
--------------------------------------------------------------------    
   procedure Treflyttal(Flyttal1, Flyttal2, Flyttal3 : out Float) is
      
   begin
      
      Get(Flyttal1);
      Get(Flyttal2);
      Get(Flyttal3);
      
   end Treflyttal;
--------------------------------------------------------------------   
   
   Flyttal1, Flyttal2, Flyttal3 : Float;
   Heltal : Integer;
   Fourletters : String(1..4);
   C : Character;
   
begin
   
   Put("Mata in tre flyttal: ");
   New_Line;
   Treflyttal(Flyttal1, Flyttal2, Flyttal3);
   New_Line;
   Put("Dina tal var:");
   Put(Flyttal1, Fore => 4, Aft => 2, Exp => 0);
   Put(Flyttal2, Fore => 4, Aft => 2, Exp => 0);
   Put(Flyttal3, Fore => 4, Aft => 2, Exp => 0);
   New_Line(2);
   
   Put("Mata in ett heltal och ett flyttal: ");
   Get(Heltal);
   Get(flyttal1);
   Put("Differensen mellan dem är ");
   Put((Heltal)-(Flyttal1), Fore => 1, Aft => 2, Exp => 0);
   New_Line(2);
   
   Put("Mata in en sträng på 4 tecken: ");
   Get(Fourletters);
   Put("Mata in ett tecken: ");
   Get(C);
   Put("Den nya strängen blev: ");
   Put(Letterswap(Fourletters, C));
   
   
end Dugga;
