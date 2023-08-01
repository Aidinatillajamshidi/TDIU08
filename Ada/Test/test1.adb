with Ada.Text_IO;                             use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;



procedure Test1 is 
   subtype Dice is Character range 'A'..'Z';
   package Min_Dice is new Ada.Numerics.Discrete_Random(Dice);
   use Min_Dice;
   
   G : Generator;
   D : Dice;
   
begin
   Reset(G);
   D := Random(G);
   Put_Line(Dice'Image(D));
   
end Test1;
