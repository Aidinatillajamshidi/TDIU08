with ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure factorial is
   num, fact : integer;

begin
   put_line("n! ? ");
   get(num);

   fact := 1;
   for i in 2..num loop
      
      fact := fact * i;
      
   end loop;
   Put(Fact);
end factorial;
