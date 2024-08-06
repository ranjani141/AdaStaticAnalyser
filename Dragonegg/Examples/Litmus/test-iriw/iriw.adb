
package body iriw is
r,s,t,u : short_integer;

procedure thread_P0 is

      begin
  	x := 1;     
         
end thread_P0;


procedure thread_P1 is

      begin
	r := x;     
        s := y;    
         
end thread_P1;

procedure thread_P2 is

      begin
  	y := 1; 
         
end thread_P2;

procedure thread_P3 is

      begin
  	t := y;     
        u := x;
         
end thread_P3;

end iriw;
