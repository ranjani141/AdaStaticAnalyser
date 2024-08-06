with main;

package body Major_Cycle is

procedure Stage2_Major is

   begin		
			Position(1) := Main.PosX;
			Position(2) := Main.PosY;
			Position(3) := Main.PosZ;
			--Velocity(1) := Main.VelU;
			--Velocity(2) := Main.VelV;
			--Velocity(3) := Main.VelW;
				
                Math.GenRates(Position, BRate);					
        
        Main.BRate  := BRate;
			

end Stage2_Major;


end Major_Cycle;
