with interfaces;
use interfaces;
with Ada.Numerics.Generic_Elementary_Functions;


package body math is

   function Bitwise_OR (value1, value2 : Unsigned_16) return Unsigned_16 is
   begin
     return(value1 or value2 );
   end Bitwise_OR;
end math;
