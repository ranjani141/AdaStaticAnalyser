with minor_cycle;
with major_cycle;

package body main is


procedure StageFlags is
      begin
      
         if (StageFlg + StageFlgC = 16#FFFF#) then
             Time := float32(CycleCount) * 0.02;
            
             case StageFlg is
             
             -- Set output flags based on events and time
             
               when 16#11# =>
                  if (OutFlag = 16#11#) then
                     Liftoff := Time;
                     OutFlag := 16#22#;
                  end if;
                  
               when 16#22# =>
                  if (OutFlag = 16#22#) then
                     Step2 := 1;
                     OutFlag := 16#33#;
                  end if;
                  
               when 16#33# =>
                  if (OutFlag = 16#33#) then
                     Stage2_Start := Time;
                     OutFlag := 16#44#;
                  end if;
                  
               when 16#44# =>
                 if (OutFlag = 16#44#) then
                  if (MinorInMajor = 1) then
                     Step4 := 1;
                     OutFlag := 16#55#;
                     end if;
                 end if;
                 
               when 16#55# =>
                 if (OutFlag = 16#55#) then
                  if (MinorInMajor = 1) then
                     Step5 := 1;
                     OutFlag := 16#66#;
                   end if;
                 end if;
                 
               when 16#66# =>
                 if (OutFlag = 16#66#) then
                  if (MinorInMajor = 1) then
                     Step6 := 1;
                     OutFlag := 16#77#;
                   end if;
                 end if;
                 
               when 16#77# =>
                if (OutFlag = 16#77#) then
                     Step7 := 1;
                     OutFlag     := 16#88#;
                end if;
                
               when 16#88# =>
                if (OutFlag = 16#88#) then
                     Step8 := 1;
                     OutFlag := 16#99#;
                 end if;
                 
               when 16#99# =>
                  if (OutFlag = 16#99#) then
                     Stage3_Start := Time;
                     OutFlag := 16#AA#;
                  end if;
                  
               when 16#AA# =>
                  if (OutFlag = 16#AA#) then
                     if (MinorInMajor = 1) then
                        Step10 := 1;
                        OutFlag := 16#BB#;
                    end if;
                  end if;
                  
               when 16#BB# =>
                  if (OutFlag = 16#BB#) then
                    if (MinorInMajor = 1) then
                      Step11 := 1;
                      OutFlag := 16#CC#;
                    end if;
                  end if;
                  
               when 16#CC# =>
                  if (OutFlag = 16#CC#) then
                     Step12 := 1;
                     OutFlag     := 16#DD#;
                  end if;

		                     
               when 16#DD# => 
                   if (OutFlag = 16#DD#) then
			if (MinorInMajor = 1)then
                          Step13 := 1;
                          Step14 := 0;
                        --Major_Cycle.Duration := 50.0;
                          OutFlag         := 16#EE#;
			end if;
                  end if;
                  
               when 16#EE# =>
                  if (OutFlag = 16#EE#) then                     
                       Step14 := 1;
                       Step13 := 0;
                       OutFlag := 16#FF#;
                  end if;
                    
               when others =>
                  null;
                  
            end case;
            
         else
            CombinedErrorFlag := 1;
         end if;
         
end StageFlags;

procedure OutputFlags_Minor is

    begin
    
         if (((OffStage2 = 1) and then (Step7 = 1)) and then (OutFlag2 = 0)) then
            GuidOutFlag  := 16#2222#;
            GuidOutFlagC := 16#DDDD#;
            OutFlag2 := 1;
         end if;

end OutputFlags_Minor;


procedure Guid_Minor is
      begin
      
         StageFlags;
         
         if (Step2 = 1) then
            null;
            
         
         elsif(Step4 = 1) then
            Minor_Cycle.Stage2_Minor;
            OutputFlags_Minor;
            
         else
            null;
            
         end if;
         
end Guid_Minor;


procedure Guid_Major is
      begin
         
         StageFlags;

         if (Step13 = 1) or (Step14 = 1) then
            Major_Cycle.Stage2_Major;
            
         else
            null;
            
         end if;
         
end Guid_Major;

end main;
