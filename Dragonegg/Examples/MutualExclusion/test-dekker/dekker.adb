
package body dekker is

   wants_to_enter0, wants_to_enter1 : short_integer := 0;
   turn : short_integer := 0;
   var1, var2 : short_integer := 0;

procedure thread0 is

  begin

  	wants_to_enter0 := 1;

	while (wants_to_enter1 /= 0) loop	
      	  if (turn /= 0) then
	    wants_to_enter0 := 0;
	    while (turn /= 0) loop 
        	null;
	    end loop;
            wants_to_enter0 := 1;
         end if;
       end loop;

   if var1 < 11 then
     var1 := var1 + 1;
   else
     var1 := 1;
     var2 := 1;
   end if;

   turn := 1;
   wants_to_enter0 := 0; 
         
end thread0;


procedure thread1 is

begin

  	wants_to_enter1 := 1;

	while (wants_to_enter0 /= 0) loop	
      	  if (turn /= 1) then
	    wants_to_enter1 := 0;
	    while (turn /= 1) loop 
        	null;
	    end loop;
            wants_to_enter1 := 1;
         end if;
       end loop;

   if var1 < 11 then
     var1 := var1 + 1;
     var2 := var2 + 1;
   end if;

   turn := 0;
   wants_to_enter1 := 0; 
         
end thread1;

end dekker;
