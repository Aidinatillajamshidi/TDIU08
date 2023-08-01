with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Command_Line;                  use Ada.Command_Line;

procedure Commando is
   
   I, J : natural;
   
begin
   
   I := Argument_Count; 
   J := Integer'Value(Argument(1));
   
   if I = 0 then
      Put("Inga argument angivna.");
   elsif I = 1 or I > 2 then
      Put("Fel antal argument angivna.");
   else
      Put("Meddelande: ");
      for K in 1..J loop
	 Put(Argument(2));
      end loop;
      New_Line;
      Put("Programmet " & """");
      Put(Command_Name & """ avslutas.");     
   end if;
   
end Commando;
