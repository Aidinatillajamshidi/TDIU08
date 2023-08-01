with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;


procedure Dugga1 is
-----------------------------------------------------------------------------   
   function "-"(Heltal : in Integer ; Flyttal : in Float) return Float is
      
      Sum : Float;
      
   begin
      
      Sum := Float(Heltal)-(Flyttal);
      
      return Sum;
      
   end "-";
-----------------------------------------------------------------------------   
   function Tre(S : in out String) return Integer is
      
   begin
      
      return S'length;
      
   end Tre;
-----------------------------------------------------------------------------   
   procedure Bokstaver(Ord : in out String) is
      
      Sum : Integer;
      
   begin
      
      Sum := Ord'Length;
      
      
   end Bokstaver;
-----------------------------------------------------------------------------   
   Heltal : Integer;
   Flyttal : Float;
   S : String(1..3);
   Ord : String(1..7);
   
begin
   
   Put("======================================================================");
   New_Line;
   Put("Körexempel 1:");
   New_Line;
   Put("======================================================================");
   New_Line;
   Put("Skriv in en sträng på 3 tecken: ");
   Get(S);
   Put("Strängen var: ");
   if Tre(S) > 0 then
      Put(S);
   elsif Tre(S) > 3 then
     Put(S);
   end if;
   
   New_Line(2);
   Put("Mata in en sträng med maximalt 7 tecken: ");
   Get(Ord);
   Put("Andra halvan av strängen är: ");
   Bokstaver(Ord);
   
   New_Line(2);
   Put("Mata in ett heltal och ett flyttal: ");
   Get(Heltal);
   Get(Flyttal);
   Put("Differensen mellan dem är ");
   Put((Heltal)-(Flyttal), Fore => 1, Aft => 2, Exp => 0);
   
   New_Line;
   Put("=======================================================================");
   
end Dugga1;
