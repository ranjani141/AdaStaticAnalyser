package math is
     type Unsigned_16 is mod 2**16;
     type Unsigned_32 is mod 2**32;
     type float32 is digits 6;
     type float64 is digits 15;
     
     function Bitwise_AND (value1, value2 : Unsigned_16) return Unsigned_16;
     function Bitwise_OR (value1, value2 : Unsigned_16) return Unsigned_16;

end math;
