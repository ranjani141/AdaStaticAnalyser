with interfaces;
use interfaces;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;
with Ada.Numerics.Generic_Elementary_Functions;

package body math is

   function Bitwise_AND (value1, value2 : Unsigned_16) return Unsigned_16 is
  begin
   return(value1 and value2 );
  end Bitwise_AND;

   function Bitwise_OR (value1, value2 : Unsigned_16) return Unsigned_16 is
   begin
     return(value1 or value2 );
   end Bitwise_OR;

end math;
