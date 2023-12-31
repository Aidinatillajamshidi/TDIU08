with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Command_Line;                  use Ada.Command_Line;

procedure Commando is
   
   I : Natural;
   
begin
   
   I := Argument_Count; 
   
   if I = 0 then
      Put("Inga argument angivna.");
   elsif I = 2 then
      Put("Meddelande: ");
      for K in 1..Integer'Value(Argument(1)) loop
	 Put(Argument(2));
      end loop;
      New_Line;
      Put("Programmet " & """");
      Put(Command_Name & """ avslutas.");     
   else
      Put("Fel antal argument angivna.");
   end if;
   
end Commando;
