; RUN: %llc_dwarf -filetype=obj < %s | llvm-dwarfdump -debug-info - | FileCheck %s
; REQUIRES: object-emission

; Generated by clang -c -g -std=c11 -S -emit-llvm from the following C11 source
;
; _Atomic const int i;
;

; CHECK: DW_TAG_variable
; CHECK: DW_TAG_const_type
; CHECK: DW_TAG_atomic_type
; CHECK-NOT: NULL
; CHECK: DW_TAG_base_type

; ModuleID = 'atomic.c'
source_filename = "atomic.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = common global i32 0, align 4, !dbg !0

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!9, !10}
!llvm.ident = !{!11}

!0 = distinct !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = !DIGlobalVariable(name: "i", scope: !2, file: !3, line: 1, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 4.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5)
!3 = !DIFile(filename: "atomic.c", directory: "/tmp")
!4 = !{}
!5 = !{!0}
!6 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !7)
!7 = !DIDerivedType(tag: DW_TAG_atomic_type, baseType: !8)
!8 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!9 = !{i32 2, !"Dwarf Version", i32 5}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{!"clang version 4.0.0"}
