
package body corr1 is
r, s : short_integer;

procedure thread_P0 is

      begin   
        x := 2; 
         
end thread_P0;


procedure thread_P1 is

      begin
  	r := x;    
        s := x; 
         
end thread_P1;

end corr1;
