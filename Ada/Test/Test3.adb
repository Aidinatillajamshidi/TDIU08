with Ada.Text_IO;                           use Ada.Text_IO;
with Ada.Integer_Text_IO;                   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                     use Ada.Float_Text_IO;

procedure test3 is
   
   function Rakna(X, Y : in Float) return Float is
      
      Z : Float;
      
   begin
      
      Z := X + Y;
      
      return Z;
      
   end Rakna;
   
   
   
   X, Y : Float;
   
begin
   
   New_Line;
   Put("Test ");
   Get(X);
   Get(Y);
   Put(Rakna(X, Y));
   
   end test3;