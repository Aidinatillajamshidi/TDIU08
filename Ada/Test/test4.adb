with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;


procedure Test4 is 
   
   
   function "-" (Left : Integer ; Right : Float) return Float is Left;
   
   X : Integer;
   Y : Float;
   
begin
   
   Put("skriv in två siffror");
   Get(X);
   Get(Y);
   Put("Summa: ");
   
end Test4;

