
package Sorted_List is
   
   type List_type is private;
   
   procedure Insert(List : in out List_Type;
		    Data : in Integer);
   procedure Put(List : in List_Type);
   procedure Remove(List : in out List_type; 
		    value : in Integer);
   procedure Delete(List : in out List_type);
      
   function Length(List : in List_Type) return Integer;
   function Empty(List : in List_Type) return Boolean;
   function Member(List : in List_type; 
		   SearchString : in Integer) return Boolean;

   
   No_Such_Element_Error : exception;
   
----------------------------------------------------------------------   
private
   
   
   type E_type;
   type List_type is access E_type;
   type E_type is 
      record
	 Data : Integer;
	 Next : List_type;
      end record;
   
   List : List_Type;
   
end Sorted_List;
