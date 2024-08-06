package body thr2 is

procedure thr2proc is

   begin
	
	if (var12 + var12C /= 16#FFFF#) then
		ErrorFlag := 16#0002#;
	end if;

end thr2proc;

end thr2;
