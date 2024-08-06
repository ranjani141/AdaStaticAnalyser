with main;

package body Minor_Cycle is


procedure Stage2_Minor is
begin

 if (FirstCycle_Stage2 = 1) then
      if (Main.CycleCount = 25) then
      	FirstCycle_Stage2 := 0;
      end if;
      
    else
		if (Main.Step8 = 0 and then OffStage2 = 0) then			
--			Post_Output;  -- Post commands for remaining cycles
			OffStage2 := 1;
			Main.OffStage2 := OffStage2;
		end if;
		
    end if;
    
end Stage2_Minor;


end Minor_Cycle;
