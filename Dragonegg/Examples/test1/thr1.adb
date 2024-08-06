with thr2;

package body thr1 is

procedure thr1proc is
  begin
        
	thr2.var12 := 16#2222#;
	thr2.var12C := 16#DDDD#;
    
end thr1proc;
      
end thr1;
