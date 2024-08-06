
package body dijkstra is

   flag0, flag1 : short_integer := 0;
   turn : short_integer := 0;
   var1, var2 : short_integer := 0;

procedure thread0 is

  begin

   <<start>>
  	flag0 := 1;

	if (turn = 0) then
	   goto endloop;
	end if;
	
      	 while (flag1 /= 0) loop
		null;
	 end loop;

	 turn := 0;

   <<endloop>>

         flag0 := 2;
	
	 if (flag1 = 2) then
	    goto start;
	 end if;    
	
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

  	<<start>>
  	flag1 := 1;

	if (turn /= 0) then
	   goto endloop;
	end if;
	
      	 while (flag0 /= 0) loop
		null;
	 end loop;

	 turn := 1;

   <<endloop>>

         flag1 := 2;
	
	 if (flag0 = 2) then
	    goto start;
	 end if;    
	
	 if var1 < 11 then
     	   var1 := var1 + 1;
           var2 := var2 + 1;
	 end if;

   	 flag1 := 0;  
         
end thread1;

end dijkstra;
