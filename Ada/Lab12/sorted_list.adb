with Ada.Text_IO;               use Ada.Text_IO;
with Ada.Integer_Text_IO;       use Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation;


package body Sorted_List is
   
   procedure Free is
      new Ada.Unchecked_Deallocation(E_Type, List_Type);
-----------------------------------------------------------------------------   
   function Empty(List : in List_Type) return Boolean is
    
   begin
      
      return List = null;
      
   end Empty; 
-----------------------------------------------------------------------------
   procedure Put(List : in List_Type) is
      
   begin
      
      if Empty(List) then
	 New_Line;
      else
	 Put(" ");
	 Put(List.Data, Width => 0);
	 Put(List.Next);
      end if;
      
   end Put;   
-----------------------------------------------------------------------------   
   procedure Insert(List : in out List_Type;
		    Data : in Integer) is
      
      Temp : List_Type;
      
   begin
      
      if List = null or else Data < List.Data then
	 Temp := new E_Type;
	 Temp.Data := Data;
	 Temp.Next := List;
	 List := Temp;
      elsif Data > List.Data then
	 Insert(List.Next,Data);
      end if;
      
      end Insert;
      
-----------------------------------------------------------------------------   
   function Member(List : in List_type; 
		   SearchString : in Integer) return Boolean is
      
   begin
      
      if Empty(List) then
	 return False;
      elsif List.Data = SearchString then
	 return True;
      end if;
      return Member(List.Next, SearchString);
      
   end Member;
-----------------------------------------------------------------------------   
   procedure Remove(List : in out List_type; 
		    value : in Integer) is
      
      Temp : List_Type;
      
   begin
      
      if not Empty(List) then
	 if List.Data = value then
	    Temp := List.Next;
	    Free(List);
	    List := Temp;
	 else
	    Remove(List.Next, value);
	 end if;
      else
	 raise No_Such_Element_Error;
      end if;
      
   end Remove;
-----------------------------------------------------------------------------   
   procedure Delete(List : in out List_type) is
      
   begin
      
      if not Empty(List) then
	 Delete(List.Next);
	 Free(List);
      end if; 
      
   end Delete;
-----------------------------------------------------------------------------
   function Length(List : in List_Type) return Integer is
      
   begin
      
      if Empty(List) then
	 return 0;
      else
	 return 1 + Length(List.Next);
      end if;
      
   end Length;
-----------------------------------------------------------------------------   
end Sorted_List;
