with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;

procedure Hant is
   
   subtype Year_Ty is Integer range 1532..9000;
   subtype Month_Ty is Integer range 1..12;
   subtype Day_Ty is Integer range 1..31;
   
   type Date_Type is
      record
	 Year_Type : Integer;
	 Month_Type : Integer;
	 Day_Type : Integer;
      end record;
   
   Year_error : exception;
   Month_Error : exception;
   Day_Error : exception;
   Format_Error : exception;
   
-----------------------------------------------------------------------------   
   function Compare_equal(Date_1, Date_2 : in Date_Type) return Boolean is
      
      Bool : Boolean;
      Day, Month, Year : Integer;
      Day2, Month2, Year2 : Integer;
      
   begin
      
      Year := Date_1.Year_type;
      Month := Date_1.Month_type;
      Day := Date_1.Day_type;
      Year2 := Date_2.Year_type;
      Month2 := Date_2.Month_type;
      Day2 := Date_2.Day_type;
      
      if Day = Day2 and Month = Month2 and Year = Year2 then
	 Bool := True;
      else
	 Bool := false;
      end if;
      
      return Bool;
      
   end Compare_equal;
-----------------------------------------------------------------------------   
   function Compare_Date2(Date_1, Date_2 : in Date_Type) return Boolean is
      
      Bool : Boolean;
      Day, Month, Year : Integer;
      Day2, Month2, Year2 : Integer;
      
   begin
      
      Year := Date_1.Year_type;
      Month := Date_1.Month_type;
      Day := Date_1.Day_type;
      Year2 := Date_2.Year_type;
      Month2 := Date_2.Month_type;
      Day2 := Date_2.Day_type;
      
      if Year < Year2 then
	 Bool := True;
	 if Month < Month2 then
	    Bool := True;
	    if Day < Day2 then
	       Bool := True;
	    end if;
	 end if;
      else
	 Bool := False;
      end if;
      
      return Bool;
      
   end Compare_date2;
-----------------------------------------------------------------------------   
   function Compare_Date1(Date_1, Date_2 : in Date_Type) return Boolean is
      
      Bool : Boolean;
      Day, Month, Year : Integer;
      Day2, Month2, Year2 : Integer;
      
   begin
      
      Year := Date_1.Year_type;
      Month := Date_1.Month_type;
      Day := Date_1.Day_type;
      Year2 := Date_2.Year_type;
      Month2 := Date_2.Month_type;
      Day2 := Date_2.Day_type;
      
      if Year > Year2 then
	 Bool := True;
	 if Month > Month2 then
	    Bool := True;
	    if Day > Day2 then
	       Bool := True;
	    end if;
	 end if;
      else
	 Bool := False;
      end if;
      
      return Bool;
      
   end Compare_date1;
-----------------------------------------------------------------------------   
   function Leap_Year(Year : in Integer) return Boolean is
      
      Bool : Boolean;
      
   begin
      
      if Year rem 400 = 0 then
	 Bool := true;
      elsif Year rem 100 = 0 then
	 Bool := False;
      elsif Year rem 4 = 0 then
	 Bool := True;
      else
	 Bool := False;
      end if;
      
      return Bool;
      
   end Leap_Year;
-------------------------------------------------------------------------------
   procedure Save_Values(Date_1 : in Date_Type;
			 Day1, Month1, Year1 : out Integer) is
      
   begin
      
      Day1 := Date_1.Day_Type;
      Month1 := Date_1.Month_Type;
      Year1 := Date_1.Year_Type;
      
   end Save_Values;
   
   procedure Return_Values(Date_1 : in out Date_Type;
			  Day1, Month1, Year1 : in out integer) is
      
   begin
      
      Date_1.Day_Type := Day1;
      Date_1.Month_Type := Month1;
      Date_1.Year_Type := Year1;
      
   end Return_Values;
-----------------------------------------------------------------------------   
   function Previous_Date(Date_1 : in out Date_Type) return Date_Type is
      
      Day, Month, Year : Integer;
      
   begin
      
      Day := Date_1.Day_Type;
      Month := Date_1.Month_Type;
      Year := Date_1.Year_Type;
      
      if Leap_Year(Year) and Month = 3 and Day = 1 then
	 Date_1.Day_Type := Date_1.Day_Type + 28;
	 Date_1.Month_Type := Date_1.Month_Type - 1;
      elsif not Leap_Year(Year) and Month = 3 and Day = 1 then
	 Date_1.Day_Type := Date_1.Day_Type + 27;
	 Date_1.Month_Type := Date_1.Month_Type - 1;
      elsif Day = 1 and (Month = 5 or Month = 7 or
			   Month = 10 or Month = 12) then
	 Date_1.Day_Type := Date_1.Day_Type + 29;
	 Date_1.Month_Type := Date_1.Month_Type - 1;
      elsif Day = 1 and Month = 1 then
	 Date_1.Day_Type := Date_1.Day_Type + 30;
	 Date_1.Month_Type := Date_1.Month_Type + 11;
	 Date_1.Year_Type := Date_1.Year_Type - 1;
      elsif Day = 1 then 
	 Date_1.Day_Type := Date_1.Day_Type + 30;
	 Date_1.Month_Type := Date_1.Month_Type - 1;
      else
	 Date_1.Day_Type := Date_1.Day_Type - 1;
      end if; 
      
      return Date_1;
      
   end Previous_Date;
-----------------------------------------------------------------------------   
   function Next_Date(Date_1 : in out Date_Type) return Date_type is
      
      Day, Month, Year : Integer;
      
   begin
      
      Day := Date_1.Day_Type;
      Month := Date_1.Month_Type;
      Year := Date_1.Year_Type;
  
      if Leap_Year(Year) and Day = 29 and Month = 2 then
	 Date_1.Day_Type := Date_1.Day_Type - 28;
	 Date_1.Month_Type := Date_1.Month_Type + 1;
      elsif not Leap_Year(Year) and Day = 28 and Month = 2 then
	 Date_1.Day_Type := Date_1.Day_Type - 27;
	 Date_1.Month_Type := Date_1.Month_Type + 1;
      elsif Day = 30 and (Month = 4 or Month = 6 or 
			    Month = 9 or Month = 11) then
	 Date_1.Day_Type := Date_1.Day_Type - 30;
	 Date_1.Month_Type := Date_1.Month_Type + 1;
      elsif Month = 12 and Day = 31 then
	 Date_1.Day_Type := Date_1.Day_Type - 30;
	 Date_1.Month_Type := Date_1.Month_Type - 11;
	 Date_1.Year_Type := Date_1.Year_Type + 1;
      elsif Day >= 31 then
	 Date_1.Day_Type := Date_1.Day_Type - 30;
	 Date_1.Month_Type := Date_1.Month_Type + 1;
      else
	 Date_1.Day_Type := Date_1.Day_Type + 1;
      end if; 
      
      return Date_1;
      
   end Next_Date;
   
-----------------------------------------------------------------------------   
   procedure Put(Date_1 : in Date_Type) is
      
   begin
      
      Put(Date_1.Year_Type, Width => 1);
      Put("-");
      if Date_1.Month_Type < 10 then
	 Put("0");
	 Put(Date_1.Month_Type, Width => 0);
      else
	 Put(Date_1.Month_Type, Width => 1);
      end if;
      Put("-");
      if Date_1.Day_Type < 10 then
	 Put("0");
	 Put(Date_1.Day_Type, Width => 0);
      else
	 Put(Date_1.Day_Type, Width => 1);
      end if;
      
   end Put;
-----------------------------------------------------------------------------   
   procedure Get(Date : out Date_Type) is
      
      Day, Month, Year : Integer;
      Datum : String(1..10);
      
   begin
      
      Get(Datum);
      
      for I in 1..4 loop
	 if Datum(I) < '0' or Datum(I) > '9' then
	    raise Format_Error;
	 end if;
      end loop;
      
      if Datum(5) /= '-' or Datum (8) /= '-' then
	 raise Format_Error;
      end if;
      
      for I in 6..7 loop
	 if Datum(I) < '0' or Datum(I) > '9' then
	    raise Format_error;
	 end if;
      end loop;
      
      for I in 9..10 loop
	 if Datum(I) < '0' or Datum(I) > '9' then
	    raise Format_error;
	 end if;
      end loop;
      
      Year := Integer'Value(Datum(1..4));
      Month := Integer'Value(Datum(6..7));
      Day := Integer'Value(Datum(9..10));
      
      Date.Year_type := Year;
      Date.Month_type := Month;
      Date.Day_type := Day;
      
      if Year < Year_Ty'First or Year > Year_Ty'last then
	 raise Year_error;
      elsif Month < Month_Ty'First or Month > Month_Ty'Last then
	 raise Month_Error;
      elsif Day < Day_Ty'First or Day > Day_Ty'Last then
	 raise Day_error;
      elsif Day = 31 and (Month = 4 or Month = 6 or 
			    Month = 9 or Month = 11) then
	 raise Day_Error;
      elsif Month = 2 and Day > 28 and not Leap_Year(Year) then
	 raise Day_Error;
      elsif Month = 2 and Day > 29 and Leap_Year(Year) then
	 raise Day_Error;
      end if;

  
   end Get;
-----------------------------------------------------------------------------   
   
   Date_1, Date_2: Date_Type;
   Day1, Month1, Year1 : Integer;
   
begin
   
   Put("Mata in datum 1: ");
   Get(Date_1);
   Save_Values(Date_1, Day1, Month1, Year1);
   
   Put("Datumet var: ");
   Put(Date_1);
   New_Line;
   
   Put("Nästa dag: ");
   Put(Next_Date(Date_1));
   New_Line;
   
   Put("Föregående dag: ");
   Return_Values(Date_1, Day1, Month1, Year1);
   Put(Previous_date(Date_1));
   New_Line;
   
   Put("Mata in Datum 2: ");
   Get(Date_2);
   
   Put("Datum 1 > Datum 2? ");
   if Compare_Date1(Date_1, Date_2) then
      Put_Line("Ja.");
   else
      Put_Line("Nej.");
   end if;
   
   Return_Values(Date_1, Day1, Month1, Year1);
     
   Put("Datum 1 < Datum 2? ");
   if Compare_Date2(Date_1, Date_2) then
      Put_Line("Ja.");
   else
      Put_Line("Nej.");
   end if;
   
   Put("Datum 1 = Datum 2? ");
   if Compare_equal(Date_1, Date_2) then
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
   
end Hant;
