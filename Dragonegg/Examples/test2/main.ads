with math;
use math;

package Main is
   
   StageFlg, StageFlgC : Unsigned_16;
   GuidOutFlag : Unsigned_16 := 16#0000#;
   GuidOutFlagC : Unsigned_16 := 16#FFFF#; 
   OutFlag2 : Unsigned_16 := 0;
   
   CombinedErrorFlag   : Unsigned_16 := 0;
   
   Time, Major_Time, Liftoff : float32;
   
   Stage2_Start, Stage3_Start  : float32;

   Step2, Step4, Step5, Step6, Step7, Step8, Step10, Step11, Step12      : Unsigned_16 := 0;

   Step13, Step14      : Unsigned_16 := 1;

   PosX, PosY, PosZ         : float32;
   VelU, VelV, VelW         : float32;
   RadialDist, Apogee       : float32;

   OffStage2   : Unsigned_16 := 0;

   MinorInMajor      : Unsigned_16 := 1;
   OutFlag           : Unsigned_16 := 16#11#;
   CycleCount        : Unsigned_32;

   BRate : Math.F32Array1by3 := (0.0, 0.0, 0.0, 0.0, 0.0);

   procedure StageFlags;
   procedure OutputFlags_Minor;
   procedure Guid_Minor;
   procedure Guid_Major;

end Main;
