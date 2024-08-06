
package body szymanski is

   flag0, flag1 : short_integer;
   var1, var2 : short_integer;

procedure thread0 is

  begin

  	flag0 := 1;

	while (flag1 >= 3) loop 
	  null;	
	end loop;

      	flag0 := 3;
	
	if (flag1 = 1) then

	   flag0 := 2;
	   while (flag1 /= 4) loop
		null;
	   end loop;
		
	end if;

	flag0 := 4;

	while (flag1 >= 2) loop 
	  null;	
	end loop;

	if var1 < 11 then
     	   var1 := var1 + 1;
        else
           var1 := 1;
           var2 := 1;
        end if;

	while ((flag1 /= 3)  and (flag1 /= 2)) loop 
	  null;	
	end loop;

	flag0 := 0; 
     
    
end thread0;


procedure thread1 is

  begin

  	flag1 := 1;

	while (flag0 >= 3) loop 
	  null;	
	end loop;

      	flag1 := 3;
	
	if (flag0 = 1) then

	   flag1 := 2;
	   while (flag0 /= 4) loop
		null;
	   end loop;
		
	end if;

	flag1 := 4;

	while (flag0 >= 2) loop 
	  null;	
	end loop;

	if var1 < 11 then
     	   var1 := var1 + 1;
           var2 := var2 + 1;
        end if;

	while ((flag0 /= 3)  and (flag0 /= 2)) loop 
	  null;	
	end loop;

	flag1 := 0; 
         
end thread1;

end szymanski;
