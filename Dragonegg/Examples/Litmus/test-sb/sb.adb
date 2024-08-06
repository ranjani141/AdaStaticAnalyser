
package body sb is
r, s : short_integer;

procedure thread_P0 is

      begin
  	x := 1;    
        s := y; 
         
end thread_P0;


procedure thread_P1 is

      begin
  	y := 1;    
        r := x; 
         
end thread_P1;

end sb;
