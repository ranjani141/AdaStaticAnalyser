; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"

@math_E = unnamed_addr global i16 0
@thr1_E = unnamed_addr global i16 0
@thr2__errorflag = unnamed_addr global i16 0
@thr2__var12c = global i16 0
@thr2__var12 = global i16 0
@thr2_E = unnamed_addr global i16 0

; Function Attrs: uwtable
define zeroext i16 @math__bitwise_or(i16 zeroext %value1, i16 zeroext %value2) unnamed_addr #0 align 2 {
entry:
  %0 = or i16 %value1, %value2
  ret i16 %0
}

; Function Attrs: uwtable
define void @thr1__thr1proc() unnamed_addr #0 align 2 {
entry:
  store i16 8738, i16* @thr2__var12, align 2
  store i16 -8739, i16* @thr2__var12c, align 2
  ret void
}

; Function Attrs: uwtable
define void @thr2__thr2proc() unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @thr2__var12, align 2
  %1 = load i16, i16* @thr2__var12c, align 2
  %2 = add i16 %0, %1
  %3 = icmp ne i16 %2, -1
  br i1 %3, label %"3", label %return

"3":                                              ; preds = %entry
  store i16 2, i16* @thr2__errorflag, align 2
  br label %return

return:                                           ; preds = %"3", %entry
  ret void
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
