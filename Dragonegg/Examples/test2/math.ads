package Math is

type Unsigned_16 is mod 2**16;
type Unsigned_32 is mod 2**32;
type float32 is digits 6;

Type F32Array1by3 is array (short_integer range 1..5) of float32;
                     
procedure GenRates (AcclnVec : in F32Array1by3;
                      CmdBRate : out F32Array1by3);
                      
end Math;
