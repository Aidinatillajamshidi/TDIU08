with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;


procedure Undantag is
   
   subtype Year_Ty is Integer range 1532..9000;
   subtype Month_Ty is Integer range 1..12;
   subtype Day_ty is Integer range 1..31;
   
   Year_Exception : exception;
   Month_Exception : exception;
   Day_Exception : exception;
   Format_Exception : exception;
   
-----------------------------------------------------------------------------   
   procedure Get_Value_Safe(Min, Max : in Integer ;
			    Value : out integer) is 
      
   begin
	 
	 loop
	    begin
	       Put("Mata in värde (");
	       Put(Min, Width => 1);
	       Put(" - ");
	       Put(Max, Width => 1);
	       Put("): ");
	       Get(Value);
	       if Value < Min then
		  Put("För litet värde. ");
		  Skip_Line;
	       elsif Value > Max then
		  Put("För stort värde. ");
		  Skip_Line;
	       else
		  exit;	  
	       end if;
	       
	    exception 
	       when Data_Error =>
		  Put("Fel datatyp. ");
		  Skip_Line;
		  
	    end;
	 end loop;
	 
	 Put("Du matade in heltalet ");
	 Put(Value, Width => 1);
	 Put(".");
      
   end Get_Value_Safe;
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
   procedure Get_Date_Safe(Day, Month, Year : out Integer) is
      
      Datum : String (1..10);
      
   begin
      
      loop
	 begin
	    Get(Datum);
	    for I in 1..4 loop
	       if Datum(I) < '0' or Datum(I) > '9' then
		  raise Format_Exception;
	       end if;
	    end loop;
	    
	    loop
	       if Datum(5) /= '-' or Datum (8) /= '-' then
		  raise Format_Exception;
	       end if;
	       exit;
	    end loop;
	    
	    for I in 6..7 loop
	       if Datum(I) < '0' or Datum(I) > '9' then
		  raise Format_Exception;
	       end if;
	    end loop;
	    
	    for I in 9..10 loop
	       if Datum(I) < '0' or Datum(I) > '9' then
		  raise Format_Exception;
	       end if;
	    end loop;
	    
	    Year := Integer'Value(Datum(1..4));
	    Month := Integer'Value(Datum(6..7));
	    Day := Integer'Value(Datum(9..10));
	    
	    if Year < Year_Ty'First or Year > Year_Ty'last then
	       raise Year_Exception;
	    elsif Month < Month_Ty'First or Month > Month_Ty'Last then
	       raise Month_Exception;
	    elsif Day < Day_Ty'First or Day > Day_Ty'Last then
	       raise Day_Exception;
	    elsif Day = 31 and (Month = 4 or Month = 6 or 
				  Month = 9 or Month = 11) then
	       raise Day_Exception;
	    elsif Month = 2 and Day > 28 and not Leap_Year(Year) then
	      raise Day_Exception;
	    elsif Month = 2 and Day > 29 and Leap_Year(Year) then
	      raise Day_Exception;
	    end if;
	    exit;
	    
	 end;
      end loop;
      
   end Get_Date_Safe;
-----------------------------------------------------------------------------   
   
   Min, Max, Value : Integer;
   Day, Month, Year : Integer;
   
begin
   
   Put("Del 1:");
   New_Line;  
   Put("Mata in Min och Max: ");
   Get(Min);
   Get(Max);
   Get_Value_Safe(Min,Max, Value);
   New_Line(2);
   
   Put("Del 2:");
   New_Line;
   loop
      begin
	 Put("Mata in datum: ");
	 Get_Date_Safe(Day, Month, Year);
	 Put("År ");
	 Put(Year, Width => 1);
	 Put(", månad ");
	 if Month < 10 then
	    Put("0");
	    Put(Month, Width => 0);
	 else
	    Put(Month, Width => 1);
	 end if;
	 Put(", dag ");
	 if Day < 10 then
	    Put("0");
	    Put(Day, Width => 0);
	 else
	    Put(Day, Width => 1);
	 end if;
	 Put(".");
	 exit;
	 
      exception 
	 when Year_Exception =>
	    Put("Felaktigt år! ");
	    Skip_Line;
	 when Month_Exception =>
	    Put("Felaktig månad! ");
	    Skip_Line;
	 when Day_Exception =>
	    Put("Felaktig dag! ");
	    Skip_Line;
	 when Format_Exception =>
	    Put("Felaktigt format! ");
	    Skip_Line;
	 when others =>
	    Put("Felaktigt format! ");
	    Skip_Line;
      end;
   end loop;
   
end Undantag;
