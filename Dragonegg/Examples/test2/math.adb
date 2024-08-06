
package body Math is
   
   
procedure GenRates (AcclnVec : in F32Array1by3; 
                      CmdBRate : out F32Array1by3) is
     
     begin


       CmdBRate(1) := 2.0 * AcclnVec(1);
       CmdBRate(2) := 2.0 * AcclnVec(2);
       CmdBRate(3) := 0.0;

   end GenRates;  
   
end Math;    
