with math;
use math;

package body nav is
  
   Count1, Count2, Num : Short_Integer := 0; 

----------------------------------------------------------------------------------------------------

   procedure proc1 is

   begin

       Link1_NOK := Bitwise_AND(Link1_Cond, 16#FF00#);
       Link2_NOK := Bitwise_AND(Link2_Cond, 16#FF00#);

	       if ((Link1_NOK=16#5500#) and then (Link2_NOK=16#5500#)) then

			 if (Link1_Cond=16#55AA#) then
				Count1 := Count1 + 1;
			 end if;

			 if (Link2_Cond=16#55AA#) then
				Count2 := Count2 + 1;
			 end if;

			 if ((Link1_Cond=16#55AA#) and then (Link2_Cond = 16#5555#)) then
				St_Flg :=Bitwise_OR(St_Flg,16#0004#);

			   Data11 := Data21;
                           Data12 := Data22;
                           Data13 := Data23;

			 end if;

			 if ((Link2_Cond=16#55AA#) and then (Link1_Cond = 16#5555#)) then
                         	St_Flg :=Bitwise_OR(St_Flg,16#0004#);

				 Data21 := Data11;
        	                 Data22 := Data12;
        	                 Data23 := Data13;
        
                         end if;

	       elsif (Link1_NOK=16#5500#) then

		     Flag12 := 16#5555#;

	       elsif (Link2_NOK=16#5500#) then

		     Flag12 := 16#AAAA#;

	       else
	          FlagF := 16#AAAA#;

           end if;
	   
  end proc1;

  ------------------------------------------------------------------------------------------

procedure thr1  is

begin     
	     proc1;
	     if (Flag12 = 16#5555#) then

		V1 := Data11;
      		V2 := Data12;
      		V3 := Data13;
                 
	     else
                 St_Flg := Bitwise_OR(St_Flg,16#0001#);

	        V1 := Data21;
      		V2 := Data22;
      		V3 := Data23;
                
	     end if;

end thr1;

---------------------------------------------------------------- 
procedure proc2 is
   begin

      Num := Num + 1;

         if (StageFlag + StageFlagC = 16#FFFF#) then

                St_Flg2 := Bitwise_OR(St_Flg2,16#0020#);
         else
            
                St_Flg2 := Bitwise_OR(St_Flg2,16#0100#);

         end if;

end proc2;
 
 procedure thr2 is
   begin

     proc2;

   end thr2;
----------------------------------------------------------------   

end nav;
