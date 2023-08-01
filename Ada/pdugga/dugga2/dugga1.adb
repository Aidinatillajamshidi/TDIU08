with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;


procedure Dugga1 is
-----------------------------------------------------------------------------   
   procedure Uppgift1(N2 : in Integer; S : in string) is
      
   begin
      
      Put("På platsen ");
      Put(N2, Width => 1);
      Put(" i Strängen finns karaktären ");
      Put(S(N2));
      Put(".");
      
   end Uppgift1;
-----------------------------------------------------------------------------   
   function "="(Heltal : in Integer; Flyttal : in Float) return Boolean is
      
      Bool : Boolean;
      
   begin
      
      if Float(Heltal) < Flyttal then
	 Bool := False;
      elsif Float(Heltal) >= Flyttal then
	 Bool := True;
      end if;
      
      return Bool;
   
   end "=";
-----------------------------------------------------------------------------   
   function Uppgift3(N : in Integer) return Integer is
      
   begin
      
      return N + 5;
      
   end Uppgift3;
-----------------------------------------------------------------------------   
   
   N, N2, Heltal : Integer;
   Flyttal : Float;
   S : String(1..5);
		       
begin   
   
   Put("Mata in en 5 tecken lång sträng: ");
   Get(S);
   Put("Mata in en siffra mellan 1 och 5: ");
   Get(N2);
   Uppgift1(N2, S);
   New_Line(2);
   
   Put("Mata in ett heltal och ett flyttal: ");
   Get(Heltal);
   Get(Flyttal);
   if "="(Heltal, Flyttal) = false then
      Put("Heltalet var inte större eller lika med flyttalet.");
   elsif "="(Heltal, Flyttal) = True then
      Put("Heltalet var större eller lika med flyttalet.");
   end if;
   New_Line(2);
   
   
   Put("Mata in ett heltal: ");
   Get(N);
   Put("Heltalet + 5 = ");
   Put(Uppgift3(N), Width => 1);
   
end Dugga1;