
package math is

     type Unsigned_16 is mod 2**16;
     type Unsigned_32 is mod 2**32;
     
     function Bitwise_OR (value1, value2 : Unsigned_16) return Unsigned_16;

end math;
