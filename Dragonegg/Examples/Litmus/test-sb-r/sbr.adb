
package body sbr is
r, s : short_integer;

procedure thread_P0 is

      begin
  	x := 1;    
        y := 1; 
         
end thread_P0;


procedure thread_P1 is

      begin
  	y := 2;    
        r := x; 
         
end thread_P1;

end sbr;
