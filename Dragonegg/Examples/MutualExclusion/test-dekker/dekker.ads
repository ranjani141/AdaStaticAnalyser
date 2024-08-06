package dekker is

   --type s16Array1by5 is array(short_integer range 1..5) of short_integer;
   
   --wants_to_enter : s16Array1by5 := (0, 0, 0, 0, 0);

   procedure thread0;
   procedure thread1;

end dekker;
