with Ada.Text_IO; use Ada.Text_IO;
with Hantering; use Hantering;

procedure Test_Date is
   
   Date_1, Date_2: Date_Type;
   
begin
   
   Put("Mata in datum 1: ");
   Get(Date_1);
   
   Put("Datumet var: ");
   Put(Date_1);
   New_Line;
   
   Put("Nästa dag: ");
   Put(Next_Date(Date_1));
   New_Line;
   
   Put("Föregående dag: ");
   Put(Previous_Date(Date_1));
   New_Line;
   
   Put("Mata in Datum 2: ");
   Get(Date_2);
   
   Put("Datum 1 > Datum 2? ");
   if Date_1 > Date_2 then
      Put_Line("Ja.");
   else
      Put_Line("Nej.");
   end if;
   
   Put("Datum 1 < Datum 2? ");
   if Date_1 < Date_2 then
      Put_Line("Ja.");
   else
      Put_Line("Nej.");
   end if;
   
   Put("Datum 1 = Datum 2? ");
   if Date_1 = Date_2 then
      Put_Line("Ja.");
   else
      Put_Line("Nej.");
   end if;
   
exception 
   when Year_error =>
      Put("Felaktigt år.");
      Skip_Line;
   when Month_error =>
      Put("Felaktig månad.");
      Skip_Line;
   when Day_error =>
      Put("Felaktig dag.");
      Skip_Line;
   when Format_error =>
      Put("Felaktigt format.");
      Skip_Line;
   
end Test_Date;
