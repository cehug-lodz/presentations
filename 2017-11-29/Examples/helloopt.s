	.text
	.file	"hello.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2               # -- Begin function hello
.LCPI0_0:
	.long	1077936128              # float 3
	.text
	.globl	hello
	.p2align	4, 0x90
	.type	hello,@function
hello:                                  # @hello
.Lfunc_begin0:
	.file	1 "hello.c"
	.loc	1 1 0                   # hello.c:1:0
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	#DEBUG_VALUE: hello:a <- %EDI
	#DEBUG_VALUE: hello:a <- %EDI
.Ltmp0:
	#DEBUG_VALUE: hello:b <- 2.000000e+00
	#DEBUG_VALUE: hello:c <- [DW_OP_LLVM_fragment 0 8] 3
	.loc	1 5 10 prologue_end     # hello.c:5:10
	cvtsi2ssl	%edi, %xmm0
	.loc	1 5 12 is_stmt 0        # hello.c:5:12
	addss	%xmm0, %xmm0
	.loc	1 5 16                  # hello.c:5:16
	mulss	.LCPI0_0(%rip), %xmm0
	.loc	1 5 10                  # hello.c:5:10
	cvttss2si	%xmm0, %eax
	.loc	1 5 3                   # hello.c:5:3
	popq	%rbp
	retq
.Ltmp1:
.Lfunc_end0:
	.size	hello, .Lfunc_end0-hello
	.cfi_endproc
                                        # -- End function
	.section	.debug_str,"MS",@progbits,1
.Linfo_string0:
	.asciz	"clang version 6.0.0 (http://llvm.org/git/clang.git 30b847df63031714b459d3c5278f9fd915dfa738) (http://llvm.org/git/llvm.git b7c2a4a266a003932018045f16580bd58e2402b9)" # string offset=0
.Linfo_string1:
	.asciz	"hello.c"               # string offset=165
.Linfo_string2:
	.asciz	"/home/dominik/Documents/LLVM_CEHUG/Examples" # string offset=173
.Linfo_string3:
	.asciz	"hello"                 # string offset=217
.Linfo_string4:
	.asciz	"int"                   # string offset=223
.Linfo_string5:
	.asciz	"a"                     # string offset=227
.Linfo_string6:
	.asciz	"b"                     # string offset=229
.Linfo_string7:
	.asciz	"float"                 # string offset=231
.Linfo_string8:
	.asciz	"c"                     # string offset=237
.Linfo_string9:
	.asciz	"char"                  # string offset=239
.Linfo_string10:
	.asciz	"sizetype"              # string offset=244
	.section	.debug_abbrev,"",@progbits
	.byte	1                       # Abbreviation Code
	.byte	17                      # DW_TAG_compile_unit
	.byte	1                       # DW_CHILDREN_yes
	.byte	37                      # DW_AT_producer
	.byte	14                      # DW_FORM_strp
	.byte	19                      # DW_AT_language
	.byte	5                       # DW_FORM_data2
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	16                      # DW_AT_stmt_list
	.byte	23                      # DW_FORM_sec_offset
	.byte	27                      # DW_AT_comp_dir
	.byte	14                      # DW_FORM_strp
	.ascii	"\264B"                 # DW_AT_GNU_pubnames
	.byte	25                      # DW_FORM_flag_present
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	2                       # Abbreviation Code
	.byte	46                      # DW_TAG_subprogram
	.byte	1                       # DW_CHILDREN_yes
	.byte	17                      # DW_AT_low_pc
	.byte	1                       # DW_FORM_addr
	.byte	18                      # DW_AT_high_pc
	.byte	6                       # DW_FORM_data4
	.byte	64                      # DW_AT_frame_base
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	39                      # DW_AT_prototyped
	.byte	25                      # DW_FORM_flag_present
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	63                      # DW_AT_external
	.byte	25                      # DW_FORM_flag_present
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	3                       # Abbreviation Code
	.byte	5                       # DW_TAG_formal_parameter
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	4                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	28                      # DW_AT_const_value
	.byte	10                      # DW_FORM_block1
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	5                       # Abbreviation Code
	.byte	52                      # DW_TAG_variable
	.byte	0                       # DW_CHILDREN_no
	.byte	2                       # DW_AT_location
	.byte	24                      # DW_FORM_exprloc
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	58                      # DW_AT_decl_file
	.byte	11                      # DW_FORM_data1
	.byte	59                      # DW_AT_decl_line
	.byte	11                      # DW_FORM_data1
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	6                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	7                       # Abbreviation Code
	.byte	1                       # DW_TAG_array_type
	.byte	1                       # DW_CHILDREN_yes
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	8                       # Abbreviation Code
	.byte	33                      # DW_TAG_subrange_type
	.byte	0                       # DW_CHILDREN_no
	.byte	73                      # DW_AT_type
	.byte	19                      # DW_FORM_ref4
	.byte	55                      # DW_AT_count
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	9                       # Abbreviation Code
	.byte	36                      # DW_TAG_base_type
	.byte	0                       # DW_CHILDREN_no
	.byte	3                       # DW_AT_name
	.byte	14                      # DW_FORM_strp
	.byte	11                      # DW_AT_byte_size
	.byte	11                      # DW_FORM_data1
	.byte	62                      # DW_AT_encoding
	.byte	11                      # DW_FORM_data1
	.byte	0                       # EOM(1)
	.byte	0                       # EOM(2)
	.byte	0                       # EOM(3)
	.section	.debug_info,"",@progbits
.Lcu_begin0:
	.long	151                     # Length of Unit
	.short	4                       # DWARF version number
	.long	.debug_abbrev           # Offset Into Abbrev. Section
	.byte	8                       # Address Size (in bytes)
	.byte	1                       # Abbrev [1] 0xb:0x90 DW_TAG_compile_unit
	.long	.Linfo_string0          # DW_AT_producer
	.short	12                      # DW_AT_language
	.long	.Linfo_string1          # DW_AT_name
	.long	.Lline_table_start0     # DW_AT_stmt_list
	.long	.Linfo_string2          # DW_AT_comp_dir
                                        # DW_AT_GNU_pubnames
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	2                       # Abbrev [2] 0x2a:0x48 DW_TAG_subprogram
	.quad	.Lfunc_begin0           # DW_AT_low_pc
	.long	.Lfunc_end0-.Lfunc_begin0 # DW_AT_high_pc
	.byte	1                       # DW_AT_frame_base
	.byte	86
	.long	.Linfo_string3          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	1                       # DW_AT_decl_line
                                        # DW_AT_prototyped
	.long	114                     # DW_AT_type
                                        # DW_AT_external
	.byte	3                       # Abbrev [3] 0x43:0xd DW_TAG_formal_parameter
	.byte	1                       # DW_AT_location
	.byte	85
	.long	.Linfo_string5          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	1                       # DW_AT_decl_line
	.long	114                     # DW_AT_type
	.byte	4                       # Abbrev [4] 0x50:0x10 DW_TAG_variable
	.byte	4                       # DW_AT_const_value
	.byte	0
	.byte	0
	.byte	0
	.byte	64
	.long	.Linfo_string6          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	2                       # DW_AT_decl_line
	.long	121                     # DW_AT_type
	.byte	5                       # Abbrev [5] 0x60:0x11 DW_TAG_variable
	.byte	5                       # DW_AT_location
	.byte	16
	.byte	3
	.byte	159
	.byte	147
	.byte	1
	.long	.Linfo_string8          # DW_AT_name
	.byte	1                       # DW_AT_decl_file
	.byte	3                       # DW_AT_decl_line
	.long	128                     # DW_AT_type
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x72:0x7 DW_TAG_base_type
	.long	.Linfo_string4          # DW_AT_name
	.byte	5                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	6                       # Abbrev [6] 0x79:0x7 DW_TAG_base_type
	.long	.Linfo_string7          # DW_AT_name
	.byte	4                       # DW_AT_encoding
	.byte	4                       # DW_AT_byte_size
	.byte	7                       # Abbrev [7] 0x80:0xc DW_TAG_array_type
	.long	140                     # DW_AT_type
	.byte	8                       # Abbrev [8] 0x85:0x6 DW_TAG_subrange_type
	.long	147                     # DW_AT_type
	.byte	10                      # DW_AT_count
	.byte	0                       # End Of Children Mark
	.byte	6                       # Abbrev [6] 0x8c:0x7 DW_TAG_base_type
	.long	.Linfo_string9          # DW_AT_name
	.byte	6                       # DW_AT_encoding
	.byte	1                       # DW_AT_byte_size
	.byte	9                       # Abbrev [9] 0x93:0x7 DW_TAG_base_type
	.long	.Linfo_string10         # DW_AT_name
	.byte	8                       # DW_AT_byte_size
	.byte	7                       # DW_AT_encoding
	.byte	0                       # End Of Children Mark
	.section	.debug_ranges,"",@progbits
	.section	.debug_macinfo,"",@progbits
.Lcu_macro_begin0:
	.byte	0                       # End Of Macro List Mark
	.section	.debug_pubnames,"",@progbits
	.long	.LpubNames_end0-.LpubNames_begin0 # Length of Public Names Info
.LpubNames_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	155                     # Compilation Unit Length
	.long	42                      # DIE offset
	.asciz	"hello"                 # External Name
	.long	0                       # End Mark
.LpubNames_end0:
	.section	.debug_pubtypes,"",@progbits
	.long	.LpubTypes_end0-.LpubTypes_begin0 # Length of Public Types Info
.LpubTypes_begin0:
	.short	2                       # DWARF Version
	.long	.Lcu_begin0             # Offset of Compilation Unit Info
	.long	155                     # Compilation Unit Length
	.long	121                     # DIE offset
	.asciz	"float"                 # External Name
	.long	114                     # DIE offset
	.asciz	"int"                   # External Name
	.long	140                     # DIE offset
	.asciz	"char"                  # External Name
	.long	0                       # End Mark
.LpubTypes_end0:

	.ident	"clang version 6.0.0 (http://llvm.org/git/clang.git 30b847df63031714b459d3c5278f9fd915dfa738) (http://llvm.org/git/llvm.git b7c2a4a266a003932018045f16580bd58e2402b9)"
	.section	".note.GNU-stack","",@progbits
	.section	.debug_line,"",@progbits
.Lline_table_start0:
