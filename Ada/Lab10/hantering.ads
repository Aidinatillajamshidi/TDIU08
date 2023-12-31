

package Hantering is
   
   type Date_Type is private;
   
   Year_error : exception;
   Month_Error : exception;
   Day_Error : exception;
   Format_Error : exception;
   
   procedure Get(Date : out Date_Type);
   procedure Put(Date : in Date_Type);
   function Next_Date(Date : in out Date_Type) return Date_Type;
   function Previous_Date(Date : in out Date_Type) return Date_Type;
   function "<"(Date_1, Date_2 : in Date_Type) return Boolean;
   function ">"(Date_1, Date_2 : in Date_Type) return Boolean;
   function "="(Date_1, Date_2 : in Date_Type) return Boolean;
   
private 
   
   function Leap_Year(Year : in Integer) return Boolean;
   
   type Date_Type is
      record
	 Year_Type : Integer;
	 Month_Type : Integer;
	 Day_Type : Integer;
      end record;
   
   Date_1, Date_2: Date_Type;
   Day1, Month1, Year1 : Integer;
   
end Hantering;
