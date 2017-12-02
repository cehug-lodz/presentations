; ModuleID = '/home/dominik/Documents/LLVM_CEHUG/Examples/hello.ll'
source_filename = "hello.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind readnone uwtable
define i32 @hello(i32 %a) local_unnamed_addr #0 !dbg !7 {
entry:
  tail call void @llvm.dbg.value(metadata i32 %a, metadata !11, metadata !DIExpression()), !dbg !12
  tail call void @llvm.dbg.value(metadata float 2.000000e+00, metadata !13, metadata !DIExpression()), !dbg !15
  tail call void @llvm.dbg.value(metadata i8 3, metadata !16, metadata !DIExpression(DW_OP_LLVM_fragment, 0, 8)), !dbg !21
  %conv = sitofp i32 %a to float, !dbg !22
  %mul = fmul float %conv, 2.000000e+00, !dbg !23
  %mul4 = fmul float %mul, 3.000000e+00, !dbg !24
  %conv5 = fptosi float %mul4 to i32, !dbg !22
  ret i32 %conv5, !dbg !25
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0 (http://llvm.org/git/clang.git 30b847df63031714b459d3c5278f9fd915dfa738) (http://llvm.org/git/llvm.git b7c2a4a266a003932018045f16580bd58e2402b9)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "hello.c", directory: "/home/dominik/Documents/LLVM_CEHUG/Examples")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0 (http://llvm.org/git/clang.git 30b847df63031714b459d3c5278f9fd915dfa738) (http://llvm.org/git/llvm.git b7c2a4a266a003932018045f16580bd58e2402b9)"}
!7 = distinct !DISubprogram(name: "hello", scope: !1, file: !1, line: 1, type: !8, isLocal: false, isDefinition: true, scopeLine: 1, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 1, type: !10)
!12 = !DILocation(line: 1, column: 16, scope: !7)
!13 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 2, type: !14)
!14 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!15 = !DILocation(line: 2, column: 9, scope: !7)
!16 = !DILocalVariable(name: "c", scope: !7, file: !1, line: 3, type: !17)
!17 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 80, elements: !19)
!18 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!19 = !{!20}
!20 = !DISubrange(count: 10)
!21 = !DILocation(line: 3, column: 8, scope: !7)
!22 = !DILocation(line: 5, column: 10, scope: !7)
!23 = !DILocation(line: 5, column: 12, scope: !7)
!24 = !DILocation(line: 5, column: 16, scope: !7)
!25 = !DILocation(line: 5, column: 3, scope: !7)
