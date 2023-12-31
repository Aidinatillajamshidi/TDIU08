with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;       use Ada.Float_Text_IO;


procedure poster is
-----------------------------------------------------------------------------   
   type Ds1_type is 
      record
	 W : Character;
	 P : String(1..4);
      end record; 
----------------------------------------   
   type S_Z is
      record
	 S : Float;
	 Z : String(1..4);
      end record;
   
   type Ds2_type is
      record
	 D : S_Z;
	 U : S_Z;
      end record;
----------------------------------------   
   type B_J is
      record
	 Y : Character;
	 Q : Character;
      end record;
   
   type O_type is
      record
	 T : boolean;
	 L : Character;
      end record;
   
   type DS3_type is
      record
	 J : B_J;
	 B : B_J;
	 O : O_type;
      end record;
-----------------------------------------------------------------------------   
   procedure Put(Ds3 : in out Ds3_type) is 
      
   begin
      
      Put(Ds3.J.Y);
      Put(" ");
      Put(Ds3.J.Q);
      Put(" ");
      Put(Ds3.B.Y);
      Put(" ");
      Put(Ds3.B.Q);
      Put(" ");
      if DS3.O.T then
	 Put("True");
      else
	 Put("False");
      end if;    
      Put(" ");
      Put(Ds3.O.L);
      
   end Put;
   
   procedure Get(Ds3 : out Ds3_type) is
      
      C, C2 : Character;
      
   begin
      
      Get(Ds3.J.Y);
      Get(C);
      Get(Ds3.J.Q);
      Get(C);
      Get(Ds3.B.Y);
      Get(C);
      Get(Ds3.B.Q);
      Get(C);
      Get(C2);
      Get(C);
      Get(Ds3.O.L);
      
      if C2 = 'T' then 
	 Ds3.O.T := True;
      else 
	 Ds3.O.T := False;
      end if;
      
   end Get;
-----------------------------------------------------------------------------   
   procedure Put(Ds2 : in out Ds2_Type) is
      
   begin
      
      Put(Ds2.D.S, Fore => 1, Aft => 3, Exp => 0);
      Put(" ");
      Put(Ds2.D.Z);
      Put(" ");
      Put(Ds2.U.S, Fore => 1, Aft => 3, Exp => 0);
      Put(" ");
      Put(Ds2.U.Z);
      
   end Put;
   
   procedure Get(Ds2 : out Ds2_type) is
      
      C : Character;
      
   begin
      
      Get(Ds2.D.S);
      Get(C);
      Get(Ds2.D.Z);
      Get(Ds2.U.S);
      Get(C);
      Get(Ds2.U.Z);
      
   end Get;
-----------------------------------------------------------------------------   
   procedure Put(Ds1 : in out Ds1_type) is
      
   begin
      
      Put(Ds1.W);
      Put(" ");
      Put(Ds1.P);
      
   end Put;
   
   procedure Get(Ds1 : out Ds1_type) is
      
      C : Character;
      
   begin
      
      Get(Ds1.W);
      Get(C);
      Get(Ds1.P);
      
   end Get;  
-----------------------------------------------------------------------------
   Ds1 : Ds1_type;
   Ds2 : Ds2_type;
   Ds3 : Ds3_type;
   
begin
   
   Put("För DS1:");
   New_Line;
   Put("Mata in datamängd: ");
   Get(Ds1);
   Put("Inmatad datamängd: ");
   Put(Ds1);
   New_Line(2);
   
   Put("För DS2:");
   New_Line;
   Put("Mata in datamängd: ");
   Get(Ds2);
   Put("Inmatad datamängd: ");
   Put(Ds2);
   New_Line(2);
   
   Put("För DS3:");
   New_Line;
   Put("Mata in datamängd: ");
   Get(Ds3);
   Put("Inmatad datamängd: ");
   Put(Ds3);
   
end poster;
