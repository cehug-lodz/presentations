; ModuleID = 'alias.c'
source_filename = "alias.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@glob = common global [40 x i8] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define i32 @analysis(i8** %ptr) #0 {
entry:
  %ptr.addr = alloca i8**, align 8
  %local = alloca [40 x i8], align 16
  %res = alloca i32, align 4
  store i8** %ptr, i8*** %ptr.addr, align 8
  %arrayidx = getelementptr inbounds [40 x i8], [40 x i8]* %local, i64 0, i64 1
  store i8 97, i8* %arrayidx, align 1
  %0 = load i8**, i8*** %ptr.addr, align 8
  %1 = load i8*, i8** %0, align 8
  %2 = load i8, i8* %1, align 1
  %conv = sext i8 %2 to i32
  %add = add nsw i32 %conv, 2
  %arrayidx1 = getelementptr inbounds [40 x i8], [40 x i8]* %local, i64 0, i64 1
  %3 = load i8, i8* %arrayidx1, align 1
  %conv2 = sext i8 %3 to i32
  %add3 = add nsw i32 %add, %conv2
  store i32 %add3, i32* %res, align 4
  %4 = load i32, i32* %res, align 4
  ret i32 %4
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0 (http://llvm.org/git/clang.git 30b847df63031714b459d3c5278f9fd915dfa738) (http://llvm.org/git/llvm.git b7c2a4a266a003932018045f16580bd58e2402b9)"}
