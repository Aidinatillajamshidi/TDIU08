
with Ada.Text_IO;                           use Ada.Text_IO;
with Ada.Integer_Text_IO;                   use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;                     use Ada.Float_Text_IO;
with Ada.Numerics.Discrete_Random;        
with Ada.Numerics.Float_Random;             use Ada.Numerics.Float_Random;


Procedure Random is
   
   subtype Dice is Integer range 1..6;
   package Min_Dice is new Ada.Numerics.Discrete_Random(Dice);
   use Min_Dice;
   
   subtype Az is Character range 'a'..'z';
   package Aoz is new Ada.Numerics.Discrete_Random(Az);
   use Aoz;
   
-----------------------------------------------------------------------------   
   function Calculate_Dice(tarning : in out Integer) return Integer is
      
      T : Integer;
      N : Integer;
      Sum : Integer;
      G_Dice: Min_Dice.Generator;
      
   begin
      
      N := 0;
      T := 0;
      Sum := 0;
      
      --      Reset(G_Dice);
      
      for I in 1..tarning loop	 
	 T := Random(G_Dice);
	 Sum := Sum + T;	 
      end loop;
      
      return Sum;
      
   end Calculate_Dice;
   
   
   procedure Tarning is
      
      tarning : Integer;
      
   begin
      
      New_Line;
      Put("Mata in antal 6-sidiga tärningar: ");
      Get(tarning);
      Put("Summa: ");
      Put(Calculate_Dice(Tarning), Width => 1);
      
   end Tarning;
-----------------------------------------------------------------------------   
   procedure Ett_Hundra(G_Flyttal : in Ada.Numerics.Float_Random.Generator) is
      
      A : Float;

   begin
      
      New_Line;
      Put("Nu slumpas ett tal mellan 0.0 och 100.0.");
      New_Line;
      Put("Slumpat flyttal: ");
      A := Random(G_flyttal) * 100.0;
      Put(A, Fore => 1, Aft => 2, Exp => 0);
      
   end Ett_Hundra;      
-------------------------------------------------------------------------------
   procedure Swap(A, Z : in out Character) is
      
      Temp : Character;
      
   begin
      
      if A > Z then
	 Temp := A;
	 A := Z;
	 Z := Temp;
      elsif A < Z then
	 A := A;
	 Z := Z;
      end if;
      
   end Swap;
   
   procedure Bokstaver is
      
      A : Character;
      Z : Character;
      G_Az : Aoz.Generator;
      
   begin
      
--      Reset(G_Az);
      A := Random(G_Az);
      Z := Random(G_Az);
      Swap(A,Z);
      
      New_Line;
      Put("Nu slumpas två tecken mellan a och z.");
      New_Line;
      Put("Slumpade tecken: ");    
      Put(A);  
      Put(" ");
      Put(Z);
      New_Line;
      Put("Alla tecken mellan ");
      Put(A);
      Put(" och ");
      Put(Z);
      Put(":");
      for C in A..Z loop
	 Put(" ");
	 Put(C);
      end loop;
      
   end Bokstaver;
-----------------------------------------------------------------------------   
   function Tarnings_Sort(Ts, Tn : in out Integer) return Integer is
      
      subtype Positive is Integer range 1..Ts;
      package Posi_Tive is new Ada.Numerics.Discrete_Random(Positive);
      use Posi_Tive;
      
      G_Positive : Posi_Tive.Generator;
      N : Integer;
      Sum : Integer;
      
   begin
      
--      Reset(G_Positive);
      N := 0;
      Sum := 0;
      
      for I in 1..Tn loop
	 Sum := Random(G_Positive) + Sum;
      end loop;
          
      return Sum;
      
   end Tarnings_Sort;
   
   
   procedure Tarningssort is
      
      Ts, Tn : Integer; --Ts = tärningssort, Tn = antal tärningar
      
   begin
      
      New_Line;
      Put("Mata in tärningssort: ");
      Get(Ts);
      Put("Mata in antal tärningar: ");
      Get(Tn);
      Put("Summa: ");
      Put(Tarnings_Sort(Ts, Tn), Width => 1);
      
   end Tarningssort; 
-----------------------------------------------------------------------------   
   procedure Rakna_Flyttal(G_flyttal: in Ada.Numerics.Float_Random.Generator) is
      
      X, Y : Float;
      Xoy : Float;
      
   begin
      
      Xoy := Random(G_flyttal);
      
      New_Line;
      Put("Mata in x: ");
      Get(X);
      Put("Mata in y: ");
      Get(Y);
      Put("Slumpat flyttal: ");
      Xoy := Xoy * (Y-X) + X;
      Put(Xoy, Fore => 0, Aft => 2, Exp => 0);
      
   end Rakna_Flyttal;   
-----------------------------------------------------------------------------   
   
   G_flyttal : Ada.Numerics.Float_Random.generator;
   G_dice : Min_Dice.Generator;
   G_Az : Aoz.Generator;
   
begin
   
--   Reset(G_flyttal);
   
   Put("DEL 1:");
   Tarning;
   Ett_Hundra(G_flyttal);
   New_Line(2);
   
   Put("DEL 2:");
   Bokstaver;
   New_Line(2);
   
   Put("DEL 3:");
   Tarningssort;
   Rakna_Flyttal(G_flyttal);
   
   
end Random;
