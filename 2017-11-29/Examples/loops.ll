; ModuleID = 'loops.c'
source_filename = "loops.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define void @detect() #0 {
entry:
  %a = alloca [10 x i8], align 1
  %b = alloca [10 x i8], align 1
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %j, align 4
  br label %while.cond

while.cond:                                       ; preds = %for.end, %entry
  %0 = load i32, i32* %j, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.body
  %1 = load i32, i32* %i, align 4
  %cmp1 = icmp slt i32 %1, 10
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %j, align 4
  %add = add nsw i32 %2, %3
  %conv = trunc i32 %add to i8
  %4 = load i32, i32* %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds [10 x i8], [10 x i8]* %a, i64 0, i64 %idxprom
  store i8 %conv, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %j, align 4
  %inc2 = add nsw i32 %6, 1
  store i32 %inc2, i32* %j, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %k, align 4
  br label %loop_begin

loop_begin:                                       ; preds = %if.then, %while.end
  %7 = load i32, i32* %k, align 4
  %conv3 = trunc i32 %7 to i8
  %8 = load i32, i32* %k, align 4
  %idxprom4 = sext i32 %8 to i64
  %arrayidx5 = getelementptr inbounds [10 x i8], [10 x i8]* %b, i64 0, i64 %idxprom4
  store i8 %conv3, i8* %arrayidx5, align 1
  %9 = load i32, i32* %k, align 4
  %inc6 = add nsw i32 %9, 1
  store i32 %inc6, i32* %k, align 4
  %10 = load i32, i32* %k, align 4
  %cmp7 = icmp slt i32 %10, 10
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %loop_begin
  br label %loop_begin

if.end:                                           ; preds = %loop_begin
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 6.0.0 (http://llvm.org/git/clang.git abb16417bac8d1da0d6698741dd07dcc7912a320) (http://llvm.org/git/llvm.git db99a9980672167d24397afade6142fc4bd820fb)"}
