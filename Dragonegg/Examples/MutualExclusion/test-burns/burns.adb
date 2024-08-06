
package body burns is

   flag0, flag1 : short_integer := 0;
   var1, var2 : short_integer := 0;

procedure thread0 is

  begin

  	flag0 := 1;

	while (flag1 = 0) loop	
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

<<label1>>
	while (true) loop	
		flag1 := 0;

		if flag0 = 1 then
			goto label1;
		end if;
	
		flag1 := 1;

		if flag0 = 1 then
			goto label1;
		else
			goto endloop;
		end if;
	end loop;

   <<endloop>>

	if var1 < 11 then
     	   var1 := var1 + 1;
           var2 := var2 + 1;
	 end if;
   	flag1 := 0;

         
end thread1;

end burns;
