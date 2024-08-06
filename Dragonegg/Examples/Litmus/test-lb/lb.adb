
package body lb is
r, s : short_integer;

procedure thread_P0 is

      begin
  	r := x;    
        y := 1; 
         
end thread_P0;


procedure thread_P1 is

      begin
  	s := y;    
        x := 1; 
         
end thread_P1;

end lb;
