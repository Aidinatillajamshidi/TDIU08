with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;

procedure Dugga is
   
-----------------------------------------------------------------------------   
   function Santfalskt(C : in Character) return Boolean is
      
      Bool : Boolean;
      
   begin
      
      if C = 'S' or C = 's' then
	 Bool := True;
      else
	 Bool := False;
      end if;
      
      return Bool;
      
   end Santfalskt;
-----------------------------------------------------------------------------   
   procedure Bokstaver(Str : in String; 
		       Bok1, Bok6 : out character) is
      
      Str2 : String(1..6);
      
   begin 
      
      Str2 := Str;
      Bok1 := Str2(1);
      Bok6 := Str2(6);
      
   end Bokstaver;
-----------------------------------------------------------------------------   
   function ">="(Left : in Integer;
		 Right : in Float) return Boolean is
      
   begin
      
      if Float(Left) >= Right then
	return true;
      else
	 return False;
      end if;
      
   end ">=";
-----------------------------------------------------------------------------   
   
   C : Character;
   Str : String(1..6);
   Bok1, Bok6 : character;
   Left : Integer;
   Right : Float;
   
begin
   
   Put("Mata in ett heltal och ett flyttal: ");
   Get(Left);
   Get(Right);
   if Left >= Right then
      Put("Heltalet var större eller lika med flyttalet.");
   else
      Put("Heltalet var inte större eller lika med flyttalet.");
   end if;
   New_Line(2);
   
   Put("Mata in en sträng på 6 tecken: ");
   Get(Str);
   Bokstaver(Str, Bok1, Bok6);
   Put("Första tecknet är: ");
   Put(Bok1);
   New_Line;
   Put("Sista tecknet är: ");
   Put(Bok6);
   New_Line(2);
   
   Put("Skriv S eller F (för Sant respektive Falskt): ");
   Get(C);
   Put("Du skrev in ");
   if Santfalskt(C) then
      Put("Sant");
   elsif not Santfalskt(C) then
      Put("Falskt");
   end if;
   
end Dugga;
