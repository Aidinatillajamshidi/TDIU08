with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;

package body Hantering is
   
   subtype Year_Ty is Integer range 1532..9000;
   subtype Month_Ty is Integer range 1..12;
   subtype Day_Ty is Integer range 1..31;
   
-----------------------------------------------------------------------------   
   function "="(Date_1, Date_2 : in Date_Type) return Boolean is
      
      Day, Month, Year : Integer;
      Day2, Month2, Year2 : Integer;
      
   begin
      
      Year := Date_1.Year_type;
      Month := Date_1.Month_type;
      Day := Date_1.Day_type;
      Year2 := Date_2.Year_type;
      Month2 := Date_2.Month_type;
      Day2 := Date_2.Day_type;
     
      return Day = Day2 and Month = Month2 and Year = Year2;
      
   end "=";
-----------------------------------------------------------------------------   
   function ">"(Date_1, Date_2 : in Date_Type) return Boolean is

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
	 return True;
      elsif Year = Year2 and Month > month2 then
	 return True;
      elsif Year = Year2 and Month = Month2 and Day > Day2 then
	 return True;
      end if;
      
      return false;
      
   end ">";
-----------------------------------------------------------------------------   
   function "<"(Date_1, Date_2 : in Date_Type) return Boolean is
      
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
	 return True;
      elsif Year = Year2 and Month < month2 then
	 return True;
      elsif Year = Year2 and Month = Month2 and Day < Day2 then
	    return True;
      end if;
      
      return false;
      
   end "<";
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
-----------------------------------------------------------------------------   
   function Previous_Date(Date : in out Date_Type) return Date_Type is
      
      Day, Month, Year : Integer;
      Date_temp : Date_Type := date;
      
   begin
      
      Day := Date.Day_Type;
      Month := Date.Month_Type;
      Year := Date.Year_Type;
      
      if Leap_Year(Year) and Month = 3 and Day = 1 then
	 Date_Temp.Day_type := Date.Day_Type + 28;
	 Date_Temp.Month_Type := Date.Month_Type - 1;
      elsif not Leap_Year(Year) and Month = 3 and Day = 1 then
	 Date_Temp.Day_Type := Date.Day_Type + 27;
	 Date_Temp.Month_Type := Date.Month_Type - 1;
      elsif Day = 1 and (Month = 5 or Month = 7 or
			   Month = 10 or Month = 12) then
	 Date_Temp.Day_Type := Date.Day_Type + 29;
	 Date_Temp.Month_Type := Date.Month_Type - 1;
      elsif Day = 1 and Month = 1 then
	 Date_Temp.Day_Type := Date.Day_Type + 30;
	 Date_Temp.Month_Type := Date.Month_Type + 11;
	 Date_Temp.Year_Type := Date.Year_Type - 1;
      elsif Day = 1 then 
	 Date_Temp.Day_Type := Date.Day_Type + 30;
	 Date_Temp.Month_Type := Date.Month_Type - 1;
      else
	 Date_Temp.Day_Type := Date.Day_Type - 1;
      end if; 
      
      return Date_Temp;
      
   end Previous_Date;
-----------------------------------------------------------------------------   
   function Next_Date(Date : in out Date_Type) return Date_type is
      
      Day, Month, Year : Integer;
      Date_Temp : Date_Type := Date;
      
   begin
      
      Day := Date.Day_Type;
      Month := Date.Month_Type;
      Year := Date.Year_Type;
      
      if Leap_Year(Year) and Day = 29 and Month = 2 then
	 Date_Temp.Day_Type := Date.Day_Type - 28;
	 Date_Temp.Month_Type := Date.Month_Type + 1;
      elsif not Leap_Year(Year) and Day = 28 and Month = 2 then
	 Date_Temp.Day_Type := Date.Day_Type - 27;
	 Date_Temp.Month_Type := Date.Month_Type + 1;
      elsif Day = 30 and (Month = 4 or Month = 6 or 
			    Month = 9 or Month = 11) then
	 Date_Temp.Day_Type := Date.Day_Type - 30;
	 Date_Temp.Month_Type := Date.Month_Type + 1;
      elsif Month = 12 and Day = 31 then
	 Date_Temp.Day_Type := Date.Day_Type - 30;
	 Date_Temp.Month_Type := Date.Month_Type - 11;
	 Date_Temp.Year_Type := Date.Year_Type + 1;
      elsif Day >= 31 then
	 Date_Temp.Day_Type := Date.Day_Type - 30;
	 Date_Temp.Month_Type := Date.Month_Type + 1;
      else
	 Date_Temp.Day_Type := Date.Day_Type + 1;
      end if; 
      
      return Date_temp;
      
   end Next_Date;
--------------------------------------------------------------------------------
   procedure Put(Date : in Date_Type) is
      
   begin
      
      Put(Date.Year_Type, Width => 1);
      Put("-");
      if Date.Month_Type < 10 then
	 Put("0");
	 Put(Date.Month_Type, Width => 0);
      else
	 Put(Date.Month_Type, Width => 1);
      end if;
      Put("-");
      if Date.Day_Type < 10 then
	 Put("0");
	 Put(Date.Day_Type, Width => 0);
      else
	 Put(Date.Day_Type, Width => 1);
      end if;
      
   end Put;
------------------------------------------------------------------------------- 
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
      elsif Day < Day_Ty'First or Day > Day_Ty'last then
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
------------------------------------------------------------------------
end Hantering;
