
package body corw is
r : short_integer;

procedure thread_P0 is

      begin
        r := x;
  	x := 1;     
         
end thread_P0;


procedure thread_P1 is

      begin
  	x := 2;     
         
end thread_P1;

end corw;
