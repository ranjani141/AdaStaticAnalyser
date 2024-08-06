
package body peterson is

   flag0, flag1 : short_integer;
   turn : short_integer;
   var1, var2 : short_integer;

procedure thread0 is

  begin

  	flag0 := 1;
	turn := 1;

	while (flag1 /= 0) and (turn = 1) loop	
      	  null;
       end loop;

   if var1 < 11 then
     var1 := var1 + 1;
   else
     var1 := 1;
     var2 := 1;
   end if;

   flag0 := 0; 
         
end thread0;


procedure thread1 is

begin

  	flag1 := 1;
	turn := 0;

	while (flag0 /= 0) and (turn = 0) loop	
         	null;
        end loop;
    
   if var1 < 11 then
     var1 := var1 + 1;
     var2 := var2 + 1;
   end if;

   flag1 := 0;
         
end thread1;

end peterson;
