with math;
use math;

package nav is

Link1_Cond, Link2_Cond, Link1_NOK, Link2_NOK : Unsigned_16;
St_Flg, St_Flg2 : unsigned_16;
Flag12, FlagF :unsigned_16  := 16#5555#;
StageFlag : unsigned_16 := 16#0000#;
StageFlagC : unsigned_16 := 16#FFFF#;

Data11, Data12, Data13 : short_integer;
Data21, Data22, Data23 : short_integer;
V1, V2, V3 : short_integer;

   procedure thr1;
   procedure thr2;
   procedure proc1;
   procedure proc2;

end nav;
