; ModuleID = 'loops.ll'
source_filename = "loops.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [10 x i8] zeroinitializer, align 1
@b = common global [10 x i8] zeroinitializer, align 1

; Function Attrs: noinline nounwind uwtable
define void @detect() #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %for.end, %entry
  %j.0 = phi i32 [ 0, %entry ], [ %inc2, %for.end ]
  %cmp = icmp slt i32 %j.0, 10
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.body
  %i.0 = phi i32 [ 0, %while.body ], [ %inc, %for.inc ]
  %cmp1 = icmp slt i32 %i.0, 10
  br i1 %cmp1, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %add = add nsw i32 %i.0, %j.0
  %conv = trunc i32 %add to i8
  %idxprom = sext i32 %i.0 to i64
  %arrayidx = getelementptr inbounds [10 x i8], [10 x i8]* @a, i64 0, i64 %idxprom
  store i8 %conv, i8* %arrayidx, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %inc2 = add nsw i32 %j.0, 1
  br label %while.cond

while.end:                                        ; preds = %while.cond
  br label %loop_begin

loop_begin:                                       ; preds = %if.then, %while.end
  %k.0 = phi i32 [ 0, %while.end ], [ %inc6, %if.then ]
  %conv3 = trunc i32 %k.0 to i8
  %idxprom4 = sext i32 %k.0 to i64
  %arrayidx5 = getelementptr inbounds [10 x i8], [10 x i8]* @b, i64 0, i64 %idxprom4
  store i8 %conv3, i8* %arrayidx5, align 1
  %inc6 = add nsw i32 %k.0, 1
  %cmp7 = icmp slt i32 %inc6, 10
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
!1 = !{!"clang version 6.0.0 (http://llvm.org/git/clang.git 30b847df63031714b459d3c5278f9fd915dfa738) (http://llvm.org/git/llvm.git b7c2a4a266a003932018045f16580bd58e2402b9)"}
