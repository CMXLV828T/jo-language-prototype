	.text
	.file	"multi_worker.ll"
	.globl	jo_worker_ComputeRisk           # -- Begin function jo_worker_ComputeRisk
	.p2align	4, 0x90
	.type	jo_worker_ComputeRisk,@function
jo_worker_ComputeRisk:                  # @jo_worker_ComputeRisk
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movq	16(%rdi), %rdx
	movq	%rcx, %rsi
	shlq	$4, %rsi
	addq	%rcx, %rsi
	imulq	%rdx, %rcx
	addq	%rcx, %rsi
	leaq	(%rsi,%rsi,2), %rcx
	leaq	(,%rdx,8), %rsi
	subq	%rdx, %rsi
	movq	24(%rdi), %rdx
	leaq	(%rdx,%rdx,2), %rdi
	leaq	(%rdx,%rdi,4), %rdx
	addq	%rsi, %rdx
	addq	%rcx, %rdx
	retq
.Lfunc_end0:
	.size	jo_worker_ComputeRisk, .Lfunc_end0-jo_worker_ComputeRisk
	.cfi_endproc
                                        # -- End function
	.globl	jo_worker_wrapper_ComputeRisk   # -- Begin function jo_worker_wrapper_ComputeRisk
	.p2align	4, 0x90
	.type	jo_worker_wrapper_ComputeRisk,@function
jo_worker_wrapper_ComputeRisk:          # @jo_worker_wrapper_ComputeRisk
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	jo_chan_ComputeRisk_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rbx
	movq	jo_chan_ComputeRisk_ret_hdr_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	movq	jo_chan_ComputeRisk_ret_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r15
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	movq	jo_chan_ComputeRisk_write@GOTPCREL(%rip), %rax
	movl	$2560543970, %r13d              # imm = 0x989ECCE2
	.p2align	4, 0x90
.LBB1_1:                                # %poll
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	movq	(%rax), %rbp
	movq	16(%rsp), %r12
	cmpq	%r12, %rbp
	je	.LBB1_1
	.p2align	4, 0x90
.LBB1_2:                                # %process
                                        #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%r12d, %edi
	andl	$1023, %edi                     # imm = 0x3FF
	shll	$7, %edi
	addq	%rbx, %rdi
	callq	jo_worker_ComputeRisk@PLT
	movq	8(%rsp), %rcx
	movq	%r13, (%r14,%rcx,8)
	movq	%rcx, %rsi
	shlq	$4, %rsi
	movq	%rdx, 8(%r15,%rsi)
	movq	%rax, (%r15,%rsi)
	incl	%ecx
	andl	$1023, %ecx                     # imm = 0x3FF
	movq	%rcx, 8(%rsp)
	incq	%r12
	movl	%r12d, %eax
	andl	$1023, %eax                     # imm = 0x3FF
	movq	%rax, 16(%rsp)
	cmpq	%rbp, %rax
	jne	.LBB1_2
# %bb.3:                                # %batch_done
                                        #   in Loop: Header=BB1_1 Depth=1
	movq	8(%rsp), %rax
	movq	jo_chan_ComputeRisk_ret_write@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	jo_chan_ComputeRisk_write@GOTPCREL(%rip), %rax
	jmp	.LBB1_1
.Lfunc_end1:
	.size	jo_worker_wrapper_ComputeRisk, .Lfunc_end1-jo_worker_wrapper_ComputeRisk
	.cfi_endproc
                                        # -- End function
	.globl	jo_worker_ComputeGreeks         # -- Begin function jo_worker_ComputeGreeks
	.p2align	4, 0x90
	.type	jo_worker_ComputeGreeks,@function
jo_worker_ComputeGreeks:                # @jo_worker_ComputeGreeks
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rdi), %rcx
	movq	8(%rdi), %rax
	leaq	(%rax,%rax,4), %rdx
	leaq	(%rax,%rdx,8), %r8
	imulq	%rax, %rax
	movabsq	$2361183241434822607, %rdx      # imm = 0x20C49BA5E353F7CF
	mulq	%rdx
	movq	%rdx, %rsi
	shrq	$7, %rsi
	movq	16(%rdi), %rax
	imulq	%rax, %rax
	movabsq	$-6640827866535438581, %rdx     # imm = 0xA3D70A3D70A3D70B
	mulq	%rdx
	shrq	$6, %rdx
	addq	%rsi, %rdx
	movq	24(%rdi), %rax
	movq	%rax, %rsi
	shlq	$5, %rsi
	subq	%rax, %rsi
	addq	%rsi, %r8
	addq	%r8, %rdx
	movq	%rcx, %rax
	retq
.Lfunc_end2:
	.size	jo_worker_ComputeGreeks, .Lfunc_end2-jo_worker_ComputeGreeks
	.cfi_endproc
                                        # -- End function
	.globl	jo_worker_wrapper_ComputeGreeks # -- Begin function jo_worker_wrapper_ComputeGreeks
	.p2align	4, 0x90
	.type	jo_worker_wrapper_ComputeGreeks,@function
jo_worker_wrapper_ComputeGreeks:        # @jo_worker_wrapper_ComputeGreeks
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	jo_chan_ComputeGreeks_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rbx
	movq	jo_chan_ComputeGreeks_ret_hdr_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	movq	jo_chan_ComputeGreeks_ret_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r15
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	movq	jo_chan_ComputeGreeks_write@GOTPCREL(%rip), %rax
	movl	$2560543970, %r13d              # imm = 0x989ECCE2
	.p2align	4, 0x90
.LBB3_1:                                # %poll
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB3_2 Depth 2
	movq	(%rax), %rbp
	movq	16(%rsp), %r12
	cmpq	%r12, %rbp
	je	.LBB3_1
	.p2align	4, 0x90
.LBB3_2:                                # %process
                                        #   Parent Loop BB3_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%r12d, %edi
	andl	$1023, %edi                     # imm = 0x3FF
	shll	$7, %edi
	addq	%rbx, %rdi
	callq	jo_worker_ComputeGreeks@PLT
	movq	8(%rsp), %rcx
	movq	%r13, (%r14,%rcx,8)
	movq	%rcx, %rsi
	shlq	$4, %rsi
	movq	%rdx, 8(%r15,%rsi)
	movq	%rax, (%r15,%rsi)
	incl	%ecx
	andl	$1023, %ecx                     # imm = 0x3FF
	movq	%rcx, 8(%rsp)
	incq	%r12
	movl	%r12d, %eax
	andl	$1023, %eax                     # imm = 0x3FF
	movq	%rax, 16(%rsp)
	cmpq	%rbp, %rax
	jne	.LBB3_2
# %bb.3:                                # %batch_done
                                        #   in Loop: Header=BB3_1 Depth=1
	movq	8(%rsp), %rax
	movq	jo_chan_ComputeGreeks_ret_write@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	jo_chan_ComputeGreeks_write@GOTPCREL(%rip), %rax
	jmp	.LBB3_1
.Lfunc_end3:
	.size	jo_worker_wrapper_ComputeGreeks, .Lfunc_end3-jo_worker_wrapper_ComputeGreeks
	.cfi_endproc
                                        # -- End function
	.globl	jo_worker_ComputeMargin         # -- Begin function jo_worker_ComputeMargin
	.p2align	4, 0x90
	.type	jo_worker_ComputeMargin,@function
jo_worker_ComputeMargin:                # @jo_worker_ComputeMargin
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movq	16(%rdi), %rdx
	leaq	(%rcx,%rdx), %rsi
	imulq	$53, %rcx, %r8
	subq	%rdx, %rcx
	imulq	%rsi, %rcx
	imulq	$97, 24(%rdi), %rdx
	addq	%r8, %rdx
	addq	%rcx, %rdx
	retq
.Lfunc_end4:
	.size	jo_worker_ComputeMargin, .Lfunc_end4-jo_worker_ComputeMargin
	.cfi_endproc
                                        # -- End function
	.globl	jo_worker_wrapper_ComputeMargin # -- Begin function jo_worker_wrapper_ComputeMargin
	.p2align	4, 0x90
	.type	jo_worker_wrapper_ComputeMargin,@function
jo_worker_wrapper_ComputeMargin:        # @jo_worker_wrapper_ComputeMargin
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	jo_chan_ComputeMargin_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rbx
	movq	jo_chan_ComputeMargin_ret_hdr_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	movq	jo_chan_ComputeMargin_ret_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r15
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	movq	jo_chan_ComputeMargin_write@GOTPCREL(%rip), %rax
	movl	$2560543970, %r13d              # imm = 0x989ECCE2
	.p2align	4, 0x90
.LBB5_1:                                # %poll
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB5_2 Depth 2
	movq	(%rax), %rbp
	movq	16(%rsp), %r12
	cmpq	%r12, %rbp
	je	.LBB5_1
	.p2align	4, 0x90
.LBB5_2:                                # %process
                                        #   Parent Loop BB5_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%r12d, %edi
	andl	$1023, %edi                     # imm = 0x3FF
	shll	$7, %edi
	addq	%rbx, %rdi
	callq	jo_worker_ComputeMargin@PLT
	movq	8(%rsp), %rcx
	movq	%r13, (%r14,%rcx,8)
	movq	%rcx, %rsi
	shlq	$4, %rsi
	movq	%rdx, 8(%r15,%rsi)
	movq	%rax, (%r15,%rsi)
	incl	%ecx
	andl	$1023, %ecx                     # imm = 0x3FF
	movq	%rcx, 8(%rsp)
	incq	%r12
	movl	%r12d, %eax
	andl	$1023, %eax                     # imm = 0x3FF
	movq	%rax, 16(%rsp)
	cmpq	%rbp, %rax
	jne	.LBB5_2
# %bb.3:                                # %batch_done
                                        #   in Loop: Header=BB5_1 Depth=1
	movq	8(%rsp), %rax
	movq	jo_chan_ComputeMargin_ret_write@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	jo_chan_ComputeMargin_write@GOTPCREL(%rip), %rax
	jmp	.LBB5_1
.Lfunc_end5:
	.size	jo_worker_wrapper_ComputeMargin, .Lfunc_end5-jo_worker_wrapper_ComputeMargin
	.cfi_endproc
                                        # -- End function
	.globl	jo_worker_ComputeVol            # -- Begin function jo_worker_ComputeVol
	.p2align	4, 0x90
	.type	jo_worker_ComputeVol,@function
jo_worker_ComputeVol:                   # @jo_worker_ComputeVol
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rdi), %rcx
	movq	8(%rdi), %rax
	movq	%rax, %rdx
	shlq	$7, %rdx
	subq	%rax, %rdx
	movq	16(%rdi), %rsi
	imulq	$131, %rsi, %r8
	imulq	$137, 24(%rdi), %rdi
	addq	%r8, %rdi
	addq	%rdx, %rdi
	imulq	%rsi, %rax
	movabsq	$-3689348814741910323, %rdx     # imm = 0xCCCCCCCCCCCCCCCD
	mulq	%rdx
	shrq	$3, %rdx
	addq	%rdi, %rdx
	movq	%rcx, %rax
	retq
.Lfunc_end6:
	.size	jo_worker_ComputeVol, .Lfunc_end6-jo_worker_ComputeVol
	.cfi_endproc
                                        # -- End function
	.globl	jo_worker_wrapper_ComputeVol    # -- Begin function jo_worker_wrapper_ComputeVol
	.p2align	4, 0x90
	.type	jo_worker_wrapper_ComputeVol,@function
jo_worker_wrapper_ComputeVol:           # @jo_worker_wrapper_ComputeVol
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	jo_chan_ComputeVol_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rbx
	movq	jo_chan_ComputeVol_ret_hdr_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	movq	jo_chan_ComputeVol_ret_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r15
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	movq	jo_chan_ComputeVol_write@GOTPCREL(%rip), %rax
	movl	$2560543970, %r13d              # imm = 0x989ECCE2
	.p2align	4, 0x90
.LBB7_1:                                # %poll
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_2 Depth 2
	movq	(%rax), %rbp
	movq	16(%rsp), %r12
	cmpq	%r12, %rbp
	je	.LBB7_1
	.p2align	4, 0x90
.LBB7_2:                                # %process
                                        #   Parent Loop BB7_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%r12d, %edi
	andl	$1023, %edi                     # imm = 0x3FF
	shll	$7, %edi
	addq	%rbx, %rdi
	callq	jo_worker_ComputeVol@PLT
	movq	8(%rsp), %rcx
	movq	%r13, (%r14,%rcx,8)
	movq	%rcx, %rsi
	shlq	$4, %rsi
	movq	%rdx, 8(%r15,%rsi)
	movq	%rax, (%r15,%rsi)
	incl	%ecx
	andl	$1023, %ecx                     # imm = 0x3FF
	movq	%rcx, 8(%rsp)
	incq	%r12
	movl	%r12d, %eax
	andl	$1023, %eax                     # imm = 0x3FF
	movq	%rax, 16(%rsp)
	cmpq	%rbp, %rax
	jne	.LBB7_2
# %bb.3:                                # %batch_done
                                        #   in Loop: Header=BB7_1 Depth=1
	movq	8(%rsp), %rax
	movq	jo_chan_ComputeVol_ret_write@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	jo_chan_ComputeVol_write@GOTPCREL(%rip), %rax
	jmp	.LBB7_1
.Lfunc_end7:
	.size	jo_worker_wrapper_ComputeVol, .Lfunc_end7-jo_worker_wrapper_ComputeVol
	.cfi_endproc
                                        # -- End function
	.globl	jo_worker_ComputeExposure       # -- Begin function jo_worker_ComputeExposure
	.p2align	4, 0x90
	.type	jo_worker_ComputeExposure,@function
jo_worker_ComputeExposure:              # @jo_worker_ComputeExposure
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	leaq	(%rcx,%rcx,2), %rdx
	movq	16(%rdi), %rsi
	leaq	(%rsi,%rsi,4), %rsi
	addq	%rdx, %rsi
	movq	24(%rdi), %rdi
	addq	$7, %rdi
	imulq	%rsi, %rdi
	imulq	$67, %rcx, %rdx
	addq	%rdi, %rdx
	retq
.Lfunc_end8:
	.size	jo_worker_ComputeExposure, .Lfunc_end8-jo_worker_ComputeExposure
	.cfi_endproc
                                        # -- End function
	.globl	jo_worker_wrapper_ComputeExposure # -- Begin function jo_worker_wrapper_ComputeExposure
	.p2align	4, 0x90
	.type	jo_worker_wrapper_ComputeExposure,@function
jo_worker_wrapper_ComputeExposure:      # @jo_worker_wrapper_ComputeExposure
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	jo_chan_ComputeExposure_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rbx
	movq	jo_chan_ComputeExposure_ret_hdr_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	movq	jo_chan_ComputeExposure_ret_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r15
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	movq	jo_chan_ComputeExposure_write@GOTPCREL(%rip), %rax
	movl	$2560543970, %r13d              # imm = 0x989ECCE2
	.p2align	4, 0x90
.LBB9_1:                                # %poll
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB9_2 Depth 2
	movq	(%rax), %rbp
	movq	16(%rsp), %r12
	cmpq	%r12, %rbp
	je	.LBB9_1
	.p2align	4, 0x90
.LBB9_2:                                # %process
                                        #   Parent Loop BB9_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%r12d, %edi
	andl	$1023, %edi                     # imm = 0x3FF
	shll	$7, %edi
	addq	%rbx, %rdi
	callq	jo_worker_ComputeExposure@PLT
	movq	8(%rsp), %rcx
	movq	%r13, (%r14,%rcx,8)
	movq	%rcx, %rsi
	shlq	$4, %rsi
	movq	%rdx, 8(%r15,%rsi)
	movq	%rax, (%r15,%rsi)
	incl	%ecx
	andl	$1023, %ecx                     # imm = 0x3FF
	movq	%rcx, 8(%rsp)
	incq	%r12
	movl	%r12d, %eax
	andl	$1023, %eax                     # imm = 0x3FF
	movq	%rax, 16(%rsp)
	cmpq	%rbp, %rax
	jne	.LBB9_2
# %bb.3:                                # %batch_done
                                        #   in Loop: Header=BB9_1 Depth=1
	movq	8(%rsp), %rax
	movq	jo_chan_ComputeExposure_ret_write@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	jo_chan_ComputeExposure_write@GOTPCREL(%rip), %rax
	jmp	.LBB9_1
.Lfunc_end9:
	.size	jo_worker_wrapper_ComputeExposure, .Lfunc_end9-jo_worker_wrapper_ComputeExposure
	.cfi_endproc
                                        # -- End function
	.globl	jo_worker_ComputePnL            # -- Begin function jo_worker_ComputePnL
	.p2align	4, 0x90
	.type	jo_worker_ComputePnL,@function
jo_worker_ComputePnL:                   # @jo_worker_ComputePnL
	.cfi_startproc
# %bb.0:                                # %entry
	movq	(%rdi), %rax
	movq	8(%rdi), %rcx
	movq	16(%rdi), %rdx
	imulq	$71, %rcx, %rsi
	imulq	%rdx, %rcx
	leaq	(%rdx,%rdx,8), %r8
	leaq	(%rdx,%r8,8), %r8
	imulq	$79, 24(%rdi), %rdi
	leaq	(%rsi,%rcx,2), %rdx
	addq	%r8, %rdx
	addq	%rdi, %rdx
	retq
.Lfunc_end10:
	.size	jo_worker_ComputePnL, .Lfunc_end10-jo_worker_ComputePnL
	.cfi_endproc
                                        # -- End function
	.globl	jo_worker_wrapper_ComputePnL    # -- Begin function jo_worker_wrapper_ComputePnL
	.p2align	4, 0x90
	.type	jo_worker_wrapper_ComputePnL,@function
jo_worker_wrapper_ComputePnL:           # @jo_worker_wrapper_ComputePnL
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	jo_chan_ComputePnL_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rbx
	movq	jo_chan_ComputePnL_ret_hdr_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	movq	jo_chan_ComputePnL_ret_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r15
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	movq	jo_chan_ComputePnL_write@GOTPCREL(%rip), %rax
	movl	$2560543970, %r13d              # imm = 0x989ECCE2
	.p2align	4, 0x90
.LBB11_1:                               # %poll
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_2 Depth 2
	movq	(%rax), %rbp
	movq	16(%rsp), %r12
	cmpq	%r12, %rbp
	je	.LBB11_1
	.p2align	4, 0x90
.LBB11_2:                               # %process
                                        #   Parent Loop BB11_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	%r12d, %edi
	andl	$1023, %edi                     # imm = 0x3FF
	shll	$7, %edi
	addq	%rbx, %rdi
	callq	jo_worker_ComputePnL@PLT
	movq	8(%rsp), %rcx
	movq	%r13, (%r14,%rcx,8)
	movq	%rcx, %rsi
	shlq	$4, %rsi
	movq	%rdx, 8(%r15,%rsi)
	movq	%rax, (%r15,%rsi)
	incl	%ecx
	andl	$1023, %ecx                     # imm = 0x3FF
	movq	%rcx, 8(%rsp)
	incq	%r12
	movl	%r12d, %eax
	andl	$1023, %eax                     # imm = 0x3FF
	movq	%rax, 16(%rsp)
	cmpq	%rbp, %rax
	jne	.LBB11_2
# %bb.3:                                # %batch_done
                                        #   in Loop: Header=BB11_1 Depth=1
	movq	8(%rsp), %rax
	movq	jo_chan_ComputePnL_ret_write@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	jo_chan_ComputePnL_write@GOTPCREL(%rip), %rax
	jmp	.LBB11_1
.Lfunc_end11:
	.size	jo_worker_wrapper_ComputePnL, .Lfunc_end11-jo_worker_wrapper_ComputePnL
	.cfi_endproc
                                        # -- End function
	.globl	jo_dispatch_ComputeRisk         # -- Begin function jo_dispatch_ComputeRisk
	.p2align	4, 0x90
	.type	jo_dispatch_ComputeRisk,@function
jo_dispatch_ComputeRisk:                # @jo_dispatch_ComputeRisk
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$2560543970, %eax               # imm = 0x989ECCE2
	movq	%rax, (%rdi,%rdx,8)
	shlq	$7, %rdx
	movq	24(%rcx), %rax
	movq	%rax, 24(%rsi,%rdx)
	movq	(%rcx), %rax
	movq	%rax, (%rsi,%rdx)
	movq	8(%rcx), %rax
	movq	%rax, 8(%rsi,%rdx)
	movq	16(%rcx), %rax
	movq	%rax, 16(%rsi,%rdx)
	retq
.Lfunc_end12:
	.size	jo_dispatch_ComputeRisk, .Lfunc_end12-jo_dispatch_ComputeRisk
	.cfi_endproc
                                        # -- End function
	.globl	jo_dispatch_ComputeGreeks       # -- Begin function jo_dispatch_ComputeGreeks
	.p2align	4, 0x90
	.type	jo_dispatch_ComputeGreeks,@function
jo_dispatch_ComputeGreeks:              # @jo_dispatch_ComputeGreeks
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$2560543970, %eax               # imm = 0x989ECCE2
	movq	%rax, (%rdi,%rdx,8)
	shlq	$7, %rdx
	movq	24(%rcx), %rax
	movq	%rax, 24(%rsi,%rdx)
	movq	(%rcx), %rax
	movq	%rax, (%rsi,%rdx)
	movq	8(%rcx), %rax
	movq	%rax, 8(%rsi,%rdx)
	movq	16(%rcx), %rax
	movq	%rax, 16(%rsi,%rdx)
	retq
.Lfunc_end13:
	.size	jo_dispatch_ComputeGreeks, .Lfunc_end13-jo_dispatch_ComputeGreeks
	.cfi_endproc
                                        # -- End function
	.globl	jo_dispatch_ComputeMargin       # -- Begin function jo_dispatch_ComputeMargin
	.p2align	4, 0x90
	.type	jo_dispatch_ComputeMargin,@function
jo_dispatch_ComputeMargin:              # @jo_dispatch_ComputeMargin
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$2560543970, %eax               # imm = 0x989ECCE2
	movq	%rax, (%rdi,%rdx,8)
	shlq	$7, %rdx
	movq	24(%rcx), %rax
	movq	%rax, 24(%rsi,%rdx)
	movq	(%rcx), %rax
	movq	%rax, (%rsi,%rdx)
	movq	8(%rcx), %rax
	movq	%rax, 8(%rsi,%rdx)
	movq	16(%rcx), %rax
	movq	%rax, 16(%rsi,%rdx)
	retq
.Lfunc_end14:
	.size	jo_dispatch_ComputeMargin, .Lfunc_end14-jo_dispatch_ComputeMargin
	.cfi_endproc
                                        # -- End function
	.globl	jo_dispatch_ComputeVol          # -- Begin function jo_dispatch_ComputeVol
	.p2align	4, 0x90
	.type	jo_dispatch_ComputeVol,@function
jo_dispatch_ComputeVol:                 # @jo_dispatch_ComputeVol
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$2560543970, %eax               # imm = 0x989ECCE2
	movq	%rax, (%rdi,%rdx,8)
	shlq	$7, %rdx
	movq	24(%rcx), %rax
	movq	%rax, 24(%rsi,%rdx)
	movq	(%rcx), %rax
	movq	%rax, (%rsi,%rdx)
	movq	8(%rcx), %rax
	movq	%rax, 8(%rsi,%rdx)
	movq	16(%rcx), %rax
	movq	%rax, 16(%rsi,%rdx)
	retq
.Lfunc_end15:
	.size	jo_dispatch_ComputeVol, .Lfunc_end15-jo_dispatch_ComputeVol
	.cfi_endproc
                                        # -- End function
	.globl	jo_dispatch_ComputeExposure     # -- Begin function jo_dispatch_ComputeExposure
	.p2align	4, 0x90
	.type	jo_dispatch_ComputeExposure,@function
jo_dispatch_ComputeExposure:            # @jo_dispatch_ComputeExposure
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$2560543970, %eax               # imm = 0x989ECCE2
	movq	%rax, (%rdi,%rdx,8)
	shlq	$7, %rdx
	movq	24(%rcx), %rax
	movq	%rax, 24(%rsi,%rdx)
	movq	(%rcx), %rax
	movq	%rax, (%rsi,%rdx)
	movq	8(%rcx), %rax
	movq	%rax, 8(%rsi,%rdx)
	movq	16(%rcx), %rax
	movq	%rax, 16(%rsi,%rdx)
	retq
.Lfunc_end16:
	.size	jo_dispatch_ComputeExposure, .Lfunc_end16-jo_dispatch_ComputeExposure
	.cfi_endproc
                                        # -- End function
	.globl	jo_dispatch_ComputePnL          # -- Begin function jo_dispatch_ComputePnL
	.p2align	4, 0x90
	.type	jo_dispatch_ComputePnL,@function
jo_dispatch_ComputePnL:                 # @jo_dispatch_ComputePnL
	.cfi_startproc
# %bb.0:                                # %entry
	movl	$2560543970, %eax               # imm = 0x989ECCE2
	movq	%rax, (%rdi,%rdx,8)
	shlq	$7, %rdx
	movq	24(%rcx), %rax
	movq	%rax, 24(%rsi,%rdx)
	movq	(%rcx), %rax
	movq	%rax, (%rsi,%rdx)
	movq	8(%rcx), %rax
	movq	%rax, 8(%rsi,%rdx)
	movq	16(%rcx), %rax
	movq	%rax, 16(%rsi,%rdx)
	retq
.Lfunc_end17:
	.size	jo_dispatch_ComputePnL, .Lfunc_end17-jo_dispatch_ComputePnL
	.cfi_endproc
                                        # -- End function
	.globl	jo_main                         # -- Begin function jo_main
	.p2align	4, 0x90
	.type	jo_main,@function
jo_main:                                # @jo_main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$312, %rsp                      # imm = 0x138
	.cfi_def_cfa_offset 368
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, 80(%rsp)                  # 8-byte Spill
	movq	%rdi, 72(%rsp)                  # 8-byte Spill
	movq	jo_ring_orders@GOTPCREL(%rip), %rax
	movq	(%rax), %r13
	movq	jo_chan_ComputeRisk_hdr_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 192(%rsp)                 # 8-byte Spill
	movq	jo_chan_ComputeRisk_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 184(%rsp)                 # 8-byte Spill
	movq	jo_chan_ComputeGreeks_hdr_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 176(%rsp)                 # 8-byte Spill
	movq	jo_chan_ComputeGreeks_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 168(%rsp)                 # 8-byte Spill
	movq	jo_chan_ComputeMargin_hdr_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 160(%rsp)                 # 8-byte Spill
	movq	jo_chan_ComputeMargin_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 152(%rsp)                 # 8-byte Spill
	movq	jo_chan_ComputeVol_hdr_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 144(%rsp)                 # 8-byte Spill
	movq	jo_chan_ComputeVol_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 136(%rsp)                 # 8-byte Spill
	movq	jo_chan_ComputeExposure_hdr_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 128(%rsp)                 # 8-byte Spill
	movq	jo_chan_ComputeExposure_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 120(%rsp)                 # 8-byte Spill
	movq	jo_chan_ComputePnL_hdr_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 112(%rsp)                 # 8-byte Spill
	movq	jo_chan_ComputePnL_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 104(%rsp)                 # 8-byte Spill
	movq	jo_chan_ComputeRisk_ret_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rcx
	movq	jo_chan_ComputeGreeks_ret_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	movq	jo_chan_ComputeMargin_ret_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r15
	movq	jo_chan_ComputeVol_ret_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %r12
	movq	jo_chan_ComputeExposure_ret_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rbp
	movq	jo_chan_ComputePnL_ret_data_ring@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, 24(%rsp)                  # 8-byte Spill
	movq	$0, 16(%rsp)
	movq	$0, 8(%rsp)
	movq	$0, 304(%rsp)
	movq	$0, 232(%rsp)
	movq	$0, 296(%rsp)
	movq	$0, 224(%rsp)
	movq	$0, 288(%rsp)
	movq	$0, 216(%rsp)
	movq	$0, 280(%rsp)
	movq	$0, 208(%rsp)
	movq	$0, 272(%rsp)
	movq	$0, 200(%rsp)
	xorl	%ebx, %ebx
	movq	%rcx, 64(%rsp)                  # 8-byte Spill
	movq	%r14, 56(%rsp)                  # 8-byte Spill
	movq	%r15, 48(%rsp)                  # 8-byte Spill
	movq	%r12, 40(%rsp)                  # 8-byte Spill
	movq	%rbp, 32(%rsp)                  # 8-byte Spill
	jmp	.LBB18_1
	.p2align	4, 0x90
.LBB18_45:                              # %bp_drop_done_518
                                        #   in Loop: Header=BB18_1 Depth=1
	movq	jo_chan_ComputeRisk_write@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rax, (%rcx)
	movq	jo_chan_ComputeGreeks_write@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rax, (%rcx)
	movq	jo_chan_ComputeMargin_write@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rax, (%rcx)
	movq	jo_chan_ComputeVol_write@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rax, (%rcx)
	movq	jo_chan_ComputeExposure_write@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rax, (%rcx)
	movq	jo_chan_ComputePnL_write@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rax
	movq	%rax, (%rcx)
	movl	$1, %edi
	leaq	240(%rsp), %rsi
	callq	clock_gettime@PLT
	imulq	$1000000000, 240(%rsp), %rax    # imm = 0x3B9ACA00
	addq	248(%rsp), %rax
	subq	88(%rsp), %rax                  # 8-byte Folded Reload
	movq	72(%rsp), %rcx                  # 8-byte Reload
	movq	%rax, (%rcx,%rbx,8)
	incq	%rbx
	cmpq	80(%rsp), %rbx                  # 8-byte Folded Reload
	movq	56(%rsp), %r14                  # 8-byte Reload
	movq	48(%rsp), %r15                  # 8-byte Reload
	movq	40(%rsp), %r12                  # 8-byte Reload
	movq	32(%rsp), %rbp                  # 8-byte Reload
	jae	.LBB18_46
.LBB18_1:                               # %cycle
                                        # =>This Loop Header: Depth=1
                                        #     Child Loop BB18_2 Depth 2
                                        #     Child Loop BB18_5 Depth 2
                                        #     Child Loop BB18_8 Depth 2
                                        #     Child Loop BB18_11 Depth 2
                                        #     Child Loop BB18_14 Depth 2
                                        #     Child Loop BB18_17 Depth 2
                                        #     Child Loop BB18_20 Depth 2
                                        #     Child Loop BB18_42 Depth 2
	movq	%rbx, 96(%rsp)                  # 8-byte Spill
	movl	$1, %edi
	leaq	256(%rsp), %rsi
	callq	clock_gettime@PLT
	movq	64(%rsp), %rdi                  # 8-byte Reload
	imulq	$1000000000, 256(%rsp), %rax    # imm = 0x3B9ACA00
	addq	264(%rsp), %rax
	movq	%rax, 88(%rsp)                  # 8-byte Spill
	movq	jo_chan_ComputeRisk_ret_write@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	jo_chan_ComputeRisk_ret_read@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	%rcx, %rax
	movabsq	$-3689348814741910323, %rbx     # imm = 0xCCCCCCCCCCCCCCCD
	movl	$1023, %r8d                     # imm = 0x3FF
	jne	.LBB18_2
.LBB18_4:                               # %scan_done_208
                                        #   in Loop: Header=BB18_1 Depth=1
	movq	jo_chan_ComputeRisk_ret_read@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	jo_chan_ComputeGreeks_ret_write@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	jo_chan_ComputeGreeks_ret_read@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	%rcx, %rax
	movq	24(%rsp), %rdi                  # 8-byte Reload
	movabsq	$2361183241434822607, %r10      # imm = 0x20C49BA5E353F7CF
	movabsq	$-6640827866535438581, %r11     # imm = 0xA3D70A3D70A3D70B
	jne	.LBB18_5
.LBB18_7:                               # %scan_done_225
                                        #   in Loop: Header=BB18_1 Depth=1
	movq	jo_chan_ComputeGreeks_ret_read@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	jo_chan_ComputeMargin_ret_write@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	jo_chan_ComputeMargin_ret_read@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	%rcx, %rax
	jne	.LBB18_8
.LBB18_10:                              # %scan_done_242
                                        #   in Loop: Header=BB18_1 Depth=1
	movq	jo_chan_ComputeMargin_ret_read@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	jo_chan_ComputeVol_ret_write@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	jo_chan_ComputeVol_ret_read@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	%rcx, %rax
	jne	.LBB18_11
.LBB18_13:                              # %scan_done_259
                                        #   in Loop: Header=BB18_1 Depth=1
	movq	jo_chan_ComputeVol_ret_read@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	jo_chan_ComputeExposure_ret_write@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	jo_chan_ComputeExposure_ret_read@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	%rcx, %rax
	jne	.LBB18_14
.LBB18_16:                              # %scan_done_276
                                        #   in Loop: Header=BB18_1 Depth=1
	movq	jo_chan_ComputeExposure_ret_read@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	jo_chan_ComputePnL_ret_write@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	jo_chan_ComputePnL_ret_read@GOTPCREL(%rip), %rcx
	movq	(%rcx), %rcx
	cmpq	%rcx, %rax
	jne	.LBB18_17
.LBB18_19:                              # %scan_done_293
                                        #   in Loop: Header=BB18_1 Depth=1
	movq	jo_chan_ComputePnL_ret_read@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	%r13, %rdi
	xorl	%r8d, %r8d
	jmp	.LBB18_20
	.p2align	4, 0x90
.LBB18_39:                              # %merge_448
                                        #   in Loop: Header=BB18_20 Depth=2
	incq	8(%rdi)
	incq	%r8
	subq	$-128, %rdi
.LBB18_20:                              # %loop_307
                                        #   Parent Loop BB18_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	$99, %r8
	ja	.LBB18_40
# %bb.21:                               # %body_307
                                        #   in Loop: Header=BB18_20 Depth=2
	cmpq	$0, 32(%rdi)
	je	.LBB18_24
# %bb.22:                               # %then_312
                                        #   in Loop: Header=BB18_20 Depth=2
	movq	8(%rdi), %rax
	movq	16(%rdi), %rcx
	movq	%rax, %rdx
	shlq	$4, %rdx
	addq	%rax, %rdx
	imulq	%rcx, %rax
	addq	%rax, %rdx
	leaq	(%rdx,%rdx,2), %rax
	leaq	(,%rcx,8), %rdx
	subq	%rcx, %rdx
	movq	24(%rdi), %rcx
	leaq	(%rcx,%rcx,2), %rsi
	leaq	(%rcx,%rsi,4), %rcx
	addq	%rdx, %rcx
	addq	%rax, %rcx
	cmpq	%rcx, 32(%rdi)
	je	.LBB18_24
# %bb.23:                               # %then_334
                                        #   in Loop: Header=BB18_20 Depth=2
	movq	$57005, (%rdi)                  # imm = 0xDEAD
.LBB18_24:                              # %merge_312
                                        #   in Loop: Header=BB18_20 Depth=2
	cmpq	$0, 40(%rdi)
	je	.LBB18_27
# %bb.25:                               # %then_339
                                        #   in Loop: Header=BB18_20 Depth=2
	movq	8(%rdi), %rax
	movq	16(%rdi), %rcx
	leaq	(%rax,%rax,4), %rdx
	leaq	(%rax,%rdx,8), %r9
	imulq	%rax, %rax
	mulq	%r10
	movq	%rdx, %rsi
	shrq	$7, %rsi
	imulq	%rcx, %rcx
	movq	%rcx, %rax
	mulq	%r11
	shrq	$6, %rdx
	addq	%rsi, %rdx
	movq	24(%rdi), %rax
	movq	%rax, %rcx
	shlq	$5, %rcx
	subq	%rax, %rcx
	addq	%rcx, %r9
	addq	%rdx, %r9
	cmpq	%r9, 40(%rdi)
	je	.LBB18_27
# %bb.26:                               # %then_364
                                        #   in Loop: Header=BB18_20 Depth=2
	movq	$57006, (%rdi)                  # imm = 0xDEAE
.LBB18_27:                              # %merge_339
                                        #   in Loop: Header=BB18_20 Depth=2
	cmpq	$0, 48(%rdi)
	je	.LBB18_30
# %bb.28:                               # %then_369
                                        #   in Loop: Header=BB18_20 Depth=2
	movq	8(%rdi), %rax
	movq	16(%rdi), %rcx
	leaq	(%rax,%rcx), %rdx
	imulq	$53, %rax, %rsi
	subq	%rcx, %rax
	imulq	%rdx, %rax
	imulq	$97, 24(%rdi), %rcx
	addq	%rsi, %rcx
	addq	%rax, %rcx
	cmpq	%rcx, 48(%rdi)
	je	.LBB18_30
# %bb.29:                               # %then_392
                                        #   in Loop: Header=BB18_20 Depth=2
	movq	$57007, (%rdi)                  # imm = 0xDEAF
.LBB18_30:                              # %merge_369
                                        #   in Loop: Header=BB18_20 Depth=2
	cmpq	$0, 56(%rdi)
	je	.LBB18_33
# %bb.31:                               # %then_397
                                        #   in Loop: Header=BB18_20 Depth=2
	movq	8(%rdi), %rax
	movq	16(%rdi), %rcx
	movq	%rax, %rdx
	shlq	$7, %rdx
	subq	%rax, %rdx
	imulq	$131, %rcx, %rsi
	imulq	$137, 24(%rdi), %r9
	addq	%rsi, %r9
	addq	%rdx, %r9
	imulq	%rcx, %rax
	mulq	%rbx
	shrq	$3, %rdx
	addq	%r9, %rdx
	cmpq	%rdx, 56(%rdi)
	je	.LBB18_33
# %bb.32:                               # %then_419
                                        #   in Loop: Header=BB18_20 Depth=2
	movq	$57008, (%rdi)                  # imm = 0xDEB0
.LBB18_33:                              # %merge_397
                                        #   in Loop: Header=BB18_20 Depth=2
	cmpq	$0, 64(%rdi)
	je	.LBB18_36
# %bb.34:                               # %then_424
                                        #   in Loop: Header=BB18_20 Depth=2
	movq	8(%rdi), %rax
	movq	16(%rdi), %rcx
	leaq	(%rax,%rax,2), %rdx
	leaq	(%rcx,%rcx,4), %rcx
	addq	%rdx, %rcx
	movq	24(%rdi), %rdx
	addq	$7, %rdx
	imulq	%rcx, %rdx
	imulq	$67, %rax, %rax
	addq	%rdx, %rax
	cmpq	%rax, 64(%rdi)
	je	.LBB18_36
# %bb.35:                               # %then_443
                                        #   in Loop: Header=BB18_20 Depth=2
	movq	$57009, (%rdi)                  # imm = 0xDEB1
.LBB18_36:                              # %merge_424
                                        #   in Loop: Header=BB18_20 Depth=2
	cmpq	$0, 72(%rdi)
	je	.LBB18_39
# %bb.37:                               # %then_448
                                        #   in Loop: Header=BB18_20 Depth=2
	movq	8(%rdi), %rax
	movq	16(%rdi), %rcx
	imulq	$71, %rax, %rdx
	imulq	%rcx, %rax
	leaq	(%rdx,%rax,2), %rax
	leaq	(%rcx,%rcx,8), %rdx
	leaq	(%rcx,%rdx,8), %rcx
	addq	%rax, %rcx
	imulq	$79, 24(%rdi), %rax
	addq	%rcx, %rax
	cmpq	%rax, 72(%rdi)
	je	.LBB18_39
# %bb.38:                               # %then_470
                                        #   in Loop: Header=BB18_20 Depth=2
	movq	$57010, (%rdi)                  # imm = 0xDEB2
	jmp	.LBB18_39
	.p2align	4, 0x90
.LBB18_2:                               # %scan_208
                                        #   Parent Loop BB18_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	%rax, %rcx
	jae	.LBB18_4
# %bb.3:                                # %scan_body_208
                                        #   in Loop: Header=BB18_2 Depth=2
	movl	%ecx, %edx
	andl	$1023, %edx                     # imm = 0x3FF
	shll	$4, %edx
	movl	(%rdi,%rdx), %esi
	andl	%r8d, %esi
	shll	$7, %esi
	movq	8(%rdi,%rdx), %rdx
	movq	%rdx, 32(%r13,%rsi)
	incq	8(%rsp)
	incq	%rcx
	jmp	.LBB18_2
	.p2align	4, 0x90
.LBB18_5:                               # %scan_225
                                        #   Parent Loop BB18_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	%rax, %rcx
	jae	.LBB18_7
# %bb.6:                                # %scan_body_225
                                        #   in Loop: Header=BB18_5 Depth=2
	movl	%ecx, %edx
	andl	$1023, %edx                     # imm = 0x3FF
	shll	$4, %edx
	movl	(%r14,%rdx), %esi
	andl	%r8d, %esi
	shll	$7, %esi
	movq	8(%r14,%rdx), %rdx
	movq	%rdx, 40(%r13,%rsi)
	incq	232(%rsp)
	incq	%rcx
	jmp	.LBB18_5
	.p2align	4, 0x90
.LBB18_8:                               # %scan_242
                                        #   Parent Loop BB18_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	%rax, %rcx
	jae	.LBB18_10
# %bb.9:                                # %scan_body_242
                                        #   in Loop: Header=BB18_8 Depth=2
	movl	%ecx, %edx
	andl	$1023, %edx                     # imm = 0x3FF
	shll	$4, %edx
	movl	(%r15,%rdx), %esi
	andl	%r8d, %esi
	shll	$7, %esi
	movq	8(%r15,%rdx), %rdx
	movq	%rdx, 48(%r13,%rsi)
	incq	224(%rsp)
	incq	%rcx
	jmp	.LBB18_8
	.p2align	4, 0x90
.LBB18_11:                              # %scan_259
                                        #   Parent Loop BB18_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	%rax, %rcx
	jae	.LBB18_13
# %bb.12:                               # %scan_body_259
                                        #   in Loop: Header=BB18_11 Depth=2
	movl	%ecx, %edx
	andl	$1023, %edx                     # imm = 0x3FF
	shll	$4, %edx
	movl	(%r12,%rdx), %esi
	andl	%r8d, %esi
	shll	$7, %esi
	movq	8(%r12,%rdx), %rdx
	movq	%rdx, 56(%r13,%rsi)
	incq	216(%rsp)
	incq	%rcx
	jmp	.LBB18_11
	.p2align	4, 0x90
.LBB18_14:                              # %scan_276
                                        #   Parent Loop BB18_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	%rax, %rcx
	jae	.LBB18_16
# %bb.15:                               # %scan_body_276
                                        #   in Loop: Header=BB18_14 Depth=2
	movl	%ecx, %edx
	andl	$1023, %edx                     # imm = 0x3FF
	shll	$4, %edx
	movl	(%rbp,%rdx), %esi
	andl	%r8d, %esi
	shll	$7, %esi
	movq	8(%rbp,%rdx), %rdx
	movq	%rdx, 64(%r13,%rsi)
	incq	208(%rsp)
	incq	%rcx
	jmp	.LBB18_14
	.p2align	4, 0x90
.LBB18_17:                              # %scan_293
                                        #   Parent Loop BB18_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	cmpq	%rax, %rcx
	jae	.LBB18_19
# %bb.18:                               # %scan_body_293
                                        #   in Loop: Header=BB18_17 Depth=2
	movl	%ecx, %edx
	andl	$1023, %edx                     # imm = 0x3FF
	shll	$4, %edx
	movl	(%rdi,%rdx), %esi
	andl	%r8d, %esi
	shll	$7, %esi
	movq	8(%rdi,%rdx), %rdx
	movq	%rdx, 72(%r13,%rsi)
	incq	200(%rsp)
	incq	%rcx
	jmp	.LBB18_17
	.p2align	4, 0x90
.LBB18_40:                              # %exit_307
                                        #   in Loop: Header=BB18_1 Depth=1
	movq	8(%rsp), %rbp
	subq	16(%rsp), %rbp
	addq	$1023, %rbp                     # imm = 0x3FF
	cmpq	$100, %rbp
	movl	$100, %eax
	cmovaeq	%rax, %rbp
	movq	jo_chan_ComputeRisk_write@GOTPCREL(%rip), %rax
	movq	(%rax), %r14
	movq	%r13, %r15
	xorl	%ebx, %ebx
	cmpq	%rbp, %rbx
	jae	.LBB18_43
	.p2align	4, 0x90
.LBB18_42:                              # %body_479
                                        #   Parent Loop BB18_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%r14,%rbx), %r12d
	andl	$1023, %r12d                    # imm = 0x3FF
	movq	192(%rsp), %rdi                 # 8-byte Reload
	movq	184(%rsp), %rsi                 # 8-byte Reload
	movq	%r12, %rdx
	movq	%r15, %rcx
	callq	jo_dispatch_ComputeRisk@PLT
	movq	176(%rsp), %rdi                 # 8-byte Reload
	movq	168(%rsp), %rsi                 # 8-byte Reload
	movq	%r12, %rdx
	movq	%r15, %rcx
	callq	jo_dispatch_ComputeGreeks@PLT
	movq	160(%rsp), %rdi                 # 8-byte Reload
	movq	152(%rsp), %rsi                 # 8-byte Reload
	movq	%r12, %rdx
	movq	%r15, %rcx
	callq	jo_dispatch_ComputeMargin@PLT
	movq	144(%rsp), %rdi                 # 8-byte Reload
	movq	136(%rsp), %rsi                 # 8-byte Reload
	movq	%r12, %rdx
	movq	%r15, %rcx
	callq	jo_dispatch_ComputeVol@PLT
	movq	128(%rsp), %rdi                 # 8-byte Reload
	movq	120(%rsp), %rsi                 # 8-byte Reload
	movq	%r12, %rdx
	movq	%r15, %rcx
	callq	jo_dispatch_ComputeExposure@PLT
	movq	112(%rsp), %rdi                 # 8-byte Reload
	movq	104(%rsp), %rsi                 # 8-byte Reload
	movq	%r12, %rdx
	movq	%r15, %rcx
	callq	jo_dispatch_ComputePnL@PLT
	incq	%rbx
	subq	$-128, %r15
	cmpq	%rbp, %rbx
	jb	.LBB18_42
.LBB18_43:                              # %exit_479
                                        #   in Loop: Header=BB18_1 Depth=1
	addq	%rbp, 16(%rsp)
	addl	%ebp, %r14d
	andl	$1023, %r14d                    # imm = 0x3FF
	movq	jo_chan_ComputeRisk_write@GOTPCREL(%rip), %rax
	movq	%r14, (%rax)
	movl	$100, %eax
	subq	%rbp, %rax
	movq	96(%rsp), %rbx                  # 8-byte Reload
	je	.LBB18_45
# %bb.44:                               # %bp_drop_518
                                        #   in Loop: Header=BB18_1 Depth=1
	movq	jo_chan_ComputeRisk_drop_count@GOTPCREL(%rip), %rcx
	addq	%rax, (%rcx)
	jmp	.LBB18_45
.LBB18_46:                              # %bench_exit
	addq	$312, %rsp                      # imm = 0x138
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end18:
	.size	jo_main, .Lfunc_end18-jo_main
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -16
	movl	$131072, %esi                   # imm = 0x20000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_ring_orders@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$8192, %esi                     # imm = 0x2000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeRisk_hdr_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$131072, %esi                   # imm = 0x20000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeRisk_data_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$8192, %esi                     # imm = 0x2000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeGreeks_hdr_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$131072, %esi                   # imm = 0x20000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeGreeks_data_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$8192, %esi                     # imm = 0x2000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeMargin_hdr_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$131072, %esi                   # imm = 0x20000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeMargin_data_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$8192, %esi                     # imm = 0x2000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeVol_hdr_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$131072, %esi                   # imm = 0x20000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeVol_data_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$8192, %esi                     # imm = 0x2000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeExposure_hdr_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$131072, %esi                   # imm = 0x20000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeExposure_data_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$8192, %esi                     # imm = 0x2000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputePnL_hdr_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$131072, %esi                   # imm = 0x20000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputePnL_data_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$8192, %esi                     # imm = 0x2000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeRisk_ret_hdr_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$16384, %esi                    # imm = 0x4000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeRisk_ret_data_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$8192, %esi                     # imm = 0x2000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeGreeks_ret_hdr_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$16384, %esi                    # imm = 0x4000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeGreeks_ret_data_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$8192, %esi                     # imm = 0x2000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeMargin_ret_hdr_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$16384, %esi                    # imm = 0x4000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeMargin_ret_data_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$8192, %esi                     # imm = 0x2000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeVol_ret_hdr_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$16384, %esi                    # imm = 0x4000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeVol_ret_data_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$8192, %esi                     # imm = 0x2000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeExposure_ret_hdr_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$16384, %esi                    # imm = 0x4000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputeExposure_ret_data_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$8192, %esi                     # imm = 0x2000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputePnL_ret_hdr_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movl	$16384, %esi                    # imm = 0x4000
	xorl	%edi, %edi
	movl	$3, %edx
	movl	$34, %ecx
	movl	$-1, %r8d
	xorl	%r9d, %r9d
	callq	mmap@PLT
	movq	jo_chan_ComputePnL_ret_data_ring@GOTPCREL(%rip), %rcx
	movq	%rax, (%rcx)
	movq	jo_worker_wrapper_ComputeRisk@GOTPCREL(%rip), %rdx
	leaq	40(%rsp), %rdi
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	callq	pthread_create@PLT
	movq	jo_worker_wrapper_ComputeGreeks@GOTPCREL(%rip), %rdx
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	callq	pthread_create@PLT
	movq	jo_worker_wrapper_ComputeMargin@GOTPCREL(%rip), %rdx
	leaq	24(%rsp), %rdi
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	callq	pthread_create@PLT
	movq	jo_worker_wrapper_ComputeVol@GOTPCREL(%rip), %rdx
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	callq	pthread_create@PLT
	movq	jo_worker_wrapper_ComputeExposure@GOTPCREL(%rip), %rdx
	leaq	8(%rsp), %rdi
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	callq	pthread_create@PLT
	movq	jo_worker_wrapper_ComputePnL@GOTPCREL(%rip), %rdx
	movq	%rsp, %rdi
	xorl	%esi, %esi
	xorl	%ecx, %ecx
	callq	pthread_create@PLT
	movl	$8000000, %edi                  # imm = 0x7A1200
	callq	malloc@PLT
	movq	%rax, %rbx
	movl	$10000, %esi                    # imm = 0x2710
	movq	%rax, %rdi
	callq	jo_main@PLT
	movl	$1000000, %esi                  # imm = 0xF4240
	movq	%rbx, %rdi
	callq	jo_main@PLT
	movl	$1000000, %esi                  # imm = 0xF4240
	movq	%rbx, %rdi
	callq	jo_print_stats@PLT
	movq	%rbx, %rdi
	callq	free@PLT
	xorl	%eax, %eax
	addq	$48, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end19:
	.size	main, .Lfunc_end19-main
	.cfi_endproc
                                        # -- End function
	.type	jo_ring_orders,@object          # @jo_ring_orders
	.bss
	.globl	jo_ring_orders
	.p2align	3, 0x0
jo_ring_orders:
	.quad	0
	.size	jo_ring_orders, 8

	.type	jo_chan_ComputeRisk_hdr_ring,@object # @jo_chan_ComputeRisk_hdr_ring
	.globl	jo_chan_ComputeRisk_hdr_ring
	.p2align	3, 0x0
jo_chan_ComputeRisk_hdr_ring:
	.quad	0
	.size	jo_chan_ComputeRisk_hdr_ring, 8

	.type	jo_chan_ComputeRisk_data_ring,@object # @jo_chan_ComputeRisk_data_ring
	.globl	jo_chan_ComputeRisk_data_ring
	.p2align	3, 0x0
jo_chan_ComputeRisk_data_ring:
	.quad	0
	.size	jo_chan_ComputeRisk_data_ring, 8

	.type	jo_chan_ComputeRisk_write,@object # @jo_chan_ComputeRisk_write
	.globl	jo_chan_ComputeRisk_write
	.p2align	3, 0x0
jo_chan_ComputeRisk_write:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeRisk_write, 8

	.type	jo_chan_ComputeGreeks_hdr_ring,@object # @jo_chan_ComputeGreeks_hdr_ring
	.globl	jo_chan_ComputeGreeks_hdr_ring
	.p2align	3, 0x0
jo_chan_ComputeGreeks_hdr_ring:
	.quad	0
	.size	jo_chan_ComputeGreeks_hdr_ring, 8

	.type	jo_chan_ComputeGreeks_data_ring,@object # @jo_chan_ComputeGreeks_data_ring
	.globl	jo_chan_ComputeGreeks_data_ring
	.p2align	3, 0x0
jo_chan_ComputeGreeks_data_ring:
	.quad	0
	.size	jo_chan_ComputeGreeks_data_ring, 8

	.type	jo_chan_ComputeGreeks_write,@object # @jo_chan_ComputeGreeks_write
	.globl	jo_chan_ComputeGreeks_write
	.p2align	3, 0x0
jo_chan_ComputeGreeks_write:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeGreeks_write, 8

	.type	jo_chan_ComputeMargin_hdr_ring,@object # @jo_chan_ComputeMargin_hdr_ring
	.globl	jo_chan_ComputeMargin_hdr_ring
	.p2align	3, 0x0
jo_chan_ComputeMargin_hdr_ring:
	.quad	0
	.size	jo_chan_ComputeMargin_hdr_ring, 8

	.type	jo_chan_ComputeMargin_data_ring,@object # @jo_chan_ComputeMargin_data_ring
	.globl	jo_chan_ComputeMargin_data_ring
	.p2align	3, 0x0
jo_chan_ComputeMargin_data_ring:
	.quad	0
	.size	jo_chan_ComputeMargin_data_ring, 8

	.type	jo_chan_ComputeMargin_write,@object # @jo_chan_ComputeMargin_write
	.globl	jo_chan_ComputeMargin_write
	.p2align	3, 0x0
jo_chan_ComputeMargin_write:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeMargin_write, 8

	.type	jo_chan_ComputeVol_hdr_ring,@object # @jo_chan_ComputeVol_hdr_ring
	.globl	jo_chan_ComputeVol_hdr_ring
	.p2align	3, 0x0
jo_chan_ComputeVol_hdr_ring:
	.quad	0
	.size	jo_chan_ComputeVol_hdr_ring, 8

	.type	jo_chan_ComputeVol_data_ring,@object # @jo_chan_ComputeVol_data_ring
	.globl	jo_chan_ComputeVol_data_ring
	.p2align	3, 0x0
jo_chan_ComputeVol_data_ring:
	.quad	0
	.size	jo_chan_ComputeVol_data_ring, 8

	.type	jo_chan_ComputeVol_write,@object # @jo_chan_ComputeVol_write
	.globl	jo_chan_ComputeVol_write
	.p2align	3, 0x0
jo_chan_ComputeVol_write:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeVol_write, 8

	.type	jo_chan_ComputeExposure_hdr_ring,@object # @jo_chan_ComputeExposure_hdr_ring
	.globl	jo_chan_ComputeExposure_hdr_ring
	.p2align	3, 0x0
jo_chan_ComputeExposure_hdr_ring:
	.quad	0
	.size	jo_chan_ComputeExposure_hdr_ring, 8

	.type	jo_chan_ComputeExposure_data_ring,@object # @jo_chan_ComputeExposure_data_ring
	.globl	jo_chan_ComputeExposure_data_ring
	.p2align	3, 0x0
jo_chan_ComputeExposure_data_ring:
	.quad	0
	.size	jo_chan_ComputeExposure_data_ring, 8

	.type	jo_chan_ComputeExposure_write,@object # @jo_chan_ComputeExposure_write
	.globl	jo_chan_ComputeExposure_write
	.p2align	3, 0x0
jo_chan_ComputeExposure_write:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeExposure_write, 8

	.type	jo_chan_ComputePnL_hdr_ring,@object # @jo_chan_ComputePnL_hdr_ring
	.globl	jo_chan_ComputePnL_hdr_ring
	.p2align	3, 0x0
jo_chan_ComputePnL_hdr_ring:
	.quad	0
	.size	jo_chan_ComputePnL_hdr_ring, 8

	.type	jo_chan_ComputePnL_data_ring,@object # @jo_chan_ComputePnL_data_ring
	.globl	jo_chan_ComputePnL_data_ring
	.p2align	3, 0x0
jo_chan_ComputePnL_data_ring:
	.quad	0
	.size	jo_chan_ComputePnL_data_ring, 8

	.type	jo_chan_ComputePnL_write,@object # @jo_chan_ComputePnL_write
	.globl	jo_chan_ComputePnL_write
	.p2align	3, 0x0
jo_chan_ComputePnL_write:
	.quad	0                               # 0x0
	.size	jo_chan_ComputePnL_write, 8

	.type	jo_chan_ComputeRisk_ret_hdr_ring,@object # @jo_chan_ComputeRisk_ret_hdr_ring
	.globl	jo_chan_ComputeRisk_ret_hdr_ring
	.p2align	3, 0x0
jo_chan_ComputeRisk_ret_hdr_ring:
	.quad	0
	.size	jo_chan_ComputeRisk_ret_hdr_ring, 8

	.type	jo_chan_ComputeRisk_ret_data_ring,@object # @jo_chan_ComputeRisk_ret_data_ring
	.globl	jo_chan_ComputeRisk_ret_data_ring
	.p2align	3, 0x0
jo_chan_ComputeRisk_ret_data_ring:
	.quad	0
	.size	jo_chan_ComputeRisk_ret_data_ring, 8

	.type	jo_chan_ComputeRisk_ret_write,@object # @jo_chan_ComputeRisk_ret_write
	.globl	jo_chan_ComputeRisk_ret_write
	.p2align	3, 0x0
jo_chan_ComputeRisk_ret_write:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeRisk_ret_write, 8

	.type	jo_chan_ComputeRisk_ret_read,@object # @jo_chan_ComputeRisk_ret_read
	.globl	jo_chan_ComputeRisk_ret_read
	.p2align	3, 0x0
jo_chan_ComputeRisk_ret_read:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeRisk_ret_read, 8

	.type	jo_chan_ComputeGreeks_ret_hdr_ring,@object # @jo_chan_ComputeGreeks_ret_hdr_ring
	.globl	jo_chan_ComputeGreeks_ret_hdr_ring
	.p2align	3, 0x0
jo_chan_ComputeGreeks_ret_hdr_ring:
	.quad	0
	.size	jo_chan_ComputeGreeks_ret_hdr_ring, 8

	.type	jo_chan_ComputeGreeks_ret_data_ring,@object # @jo_chan_ComputeGreeks_ret_data_ring
	.globl	jo_chan_ComputeGreeks_ret_data_ring
	.p2align	3, 0x0
jo_chan_ComputeGreeks_ret_data_ring:
	.quad	0
	.size	jo_chan_ComputeGreeks_ret_data_ring, 8

	.type	jo_chan_ComputeGreeks_ret_write,@object # @jo_chan_ComputeGreeks_ret_write
	.globl	jo_chan_ComputeGreeks_ret_write
	.p2align	3, 0x0
jo_chan_ComputeGreeks_ret_write:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeGreeks_ret_write, 8

	.type	jo_chan_ComputeGreeks_ret_read,@object # @jo_chan_ComputeGreeks_ret_read
	.globl	jo_chan_ComputeGreeks_ret_read
	.p2align	3, 0x0
jo_chan_ComputeGreeks_ret_read:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeGreeks_ret_read, 8

	.type	jo_chan_ComputeMargin_ret_hdr_ring,@object # @jo_chan_ComputeMargin_ret_hdr_ring
	.globl	jo_chan_ComputeMargin_ret_hdr_ring
	.p2align	3, 0x0
jo_chan_ComputeMargin_ret_hdr_ring:
	.quad	0
	.size	jo_chan_ComputeMargin_ret_hdr_ring, 8

	.type	jo_chan_ComputeMargin_ret_data_ring,@object # @jo_chan_ComputeMargin_ret_data_ring
	.globl	jo_chan_ComputeMargin_ret_data_ring
	.p2align	3, 0x0
jo_chan_ComputeMargin_ret_data_ring:
	.quad	0
	.size	jo_chan_ComputeMargin_ret_data_ring, 8

	.type	jo_chan_ComputeMargin_ret_write,@object # @jo_chan_ComputeMargin_ret_write
	.globl	jo_chan_ComputeMargin_ret_write
	.p2align	3, 0x0
jo_chan_ComputeMargin_ret_write:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeMargin_ret_write, 8

	.type	jo_chan_ComputeMargin_ret_read,@object # @jo_chan_ComputeMargin_ret_read
	.globl	jo_chan_ComputeMargin_ret_read
	.p2align	3, 0x0
jo_chan_ComputeMargin_ret_read:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeMargin_ret_read, 8

	.type	jo_chan_ComputeVol_ret_hdr_ring,@object # @jo_chan_ComputeVol_ret_hdr_ring
	.globl	jo_chan_ComputeVol_ret_hdr_ring
	.p2align	3, 0x0
jo_chan_ComputeVol_ret_hdr_ring:
	.quad	0
	.size	jo_chan_ComputeVol_ret_hdr_ring, 8

	.type	jo_chan_ComputeVol_ret_data_ring,@object # @jo_chan_ComputeVol_ret_data_ring
	.globl	jo_chan_ComputeVol_ret_data_ring
	.p2align	3, 0x0
jo_chan_ComputeVol_ret_data_ring:
	.quad	0
	.size	jo_chan_ComputeVol_ret_data_ring, 8

	.type	jo_chan_ComputeVol_ret_write,@object # @jo_chan_ComputeVol_ret_write
	.globl	jo_chan_ComputeVol_ret_write
	.p2align	3, 0x0
jo_chan_ComputeVol_ret_write:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeVol_ret_write, 8

	.type	jo_chan_ComputeVol_ret_read,@object # @jo_chan_ComputeVol_ret_read
	.globl	jo_chan_ComputeVol_ret_read
	.p2align	3, 0x0
jo_chan_ComputeVol_ret_read:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeVol_ret_read, 8

	.type	jo_chan_ComputeExposure_ret_hdr_ring,@object # @jo_chan_ComputeExposure_ret_hdr_ring
	.globl	jo_chan_ComputeExposure_ret_hdr_ring
	.p2align	3, 0x0
jo_chan_ComputeExposure_ret_hdr_ring:
	.quad	0
	.size	jo_chan_ComputeExposure_ret_hdr_ring, 8

	.type	jo_chan_ComputeExposure_ret_data_ring,@object # @jo_chan_ComputeExposure_ret_data_ring
	.globl	jo_chan_ComputeExposure_ret_data_ring
	.p2align	3, 0x0
jo_chan_ComputeExposure_ret_data_ring:
	.quad	0
	.size	jo_chan_ComputeExposure_ret_data_ring, 8

	.type	jo_chan_ComputeExposure_ret_write,@object # @jo_chan_ComputeExposure_ret_write
	.globl	jo_chan_ComputeExposure_ret_write
	.p2align	3, 0x0
jo_chan_ComputeExposure_ret_write:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeExposure_ret_write, 8

	.type	jo_chan_ComputeExposure_ret_read,@object # @jo_chan_ComputeExposure_ret_read
	.globl	jo_chan_ComputeExposure_ret_read
	.p2align	3, 0x0
jo_chan_ComputeExposure_ret_read:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeExposure_ret_read, 8

	.type	jo_chan_ComputePnL_ret_hdr_ring,@object # @jo_chan_ComputePnL_ret_hdr_ring
	.globl	jo_chan_ComputePnL_ret_hdr_ring
	.p2align	3, 0x0
jo_chan_ComputePnL_ret_hdr_ring:
	.quad	0
	.size	jo_chan_ComputePnL_ret_hdr_ring, 8

	.type	jo_chan_ComputePnL_ret_data_ring,@object # @jo_chan_ComputePnL_ret_data_ring
	.globl	jo_chan_ComputePnL_ret_data_ring
	.p2align	3, 0x0
jo_chan_ComputePnL_ret_data_ring:
	.quad	0
	.size	jo_chan_ComputePnL_ret_data_ring, 8

	.type	jo_chan_ComputePnL_ret_write,@object # @jo_chan_ComputePnL_ret_write
	.globl	jo_chan_ComputePnL_ret_write
	.p2align	3, 0x0
jo_chan_ComputePnL_ret_write:
	.quad	0                               # 0x0
	.size	jo_chan_ComputePnL_ret_write, 8

	.type	jo_chan_ComputePnL_ret_read,@object # @jo_chan_ComputePnL_ret_read
	.globl	jo_chan_ComputePnL_ret_read
	.p2align	3, 0x0
jo_chan_ComputePnL_ret_read:
	.quad	0                               # 0x0
	.size	jo_chan_ComputePnL_ret_read, 8

	.type	jo_chan_ComputeRisk_drop_count,@object # @jo_chan_ComputeRisk_drop_count
	.globl	jo_chan_ComputeRisk_drop_count
	.p2align	3, 0x0
jo_chan_ComputeRisk_drop_count:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeRisk_drop_count, 8

	.type	jo_chan_ComputeGreeks_drop_count,@object # @jo_chan_ComputeGreeks_drop_count
	.globl	jo_chan_ComputeGreeks_drop_count
	.p2align	3, 0x0
jo_chan_ComputeGreeks_drop_count:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeGreeks_drop_count, 8

	.type	jo_chan_ComputeMargin_drop_count,@object # @jo_chan_ComputeMargin_drop_count
	.globl	jo_chan_ComputeMargin_drop_count
	.p2align	3, 0x0
jo_chan_ComputeMargin_drop_count:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeMargin_drop_count, 8

	.type	jo_chan_ComputeVol_drop_count,@object # @jo_chan_ComputeVol_drop_count
	.globl	jo_chan_ComputeVol_drop_count
	.p2align	3, 0x0
jo_chan_ComputeVol_drop_count:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeVol_drop_count, 8

	.type	jo_chan_ComputeExposure_drop_count,@object # @jo_chan_ComputeExposure_drop_count
	.globl	jo_chan_ComputeExposure_drop_count
	.p2align	3, 0x0
jo_chan_ComputeExposure_drop_count:
	.quad	0                               # 0x0
	.size	jo_chan_ComputeExposure_drop_count, 8

	.type	jo_chan_ComputePnL_drop_count,@object # @jo_chan_ComputePnL_drop_count
	.globl	jo_chan_ComputePnL_drop_count
	.p2align	3, 0x0
jo_chan_ComputePnL_drop_count:
	.quad	0                               # 0x0
	.size	jo_chan_ComputePnL_drop_count, 8

	.section	".note.GNU-stack","",@progbits
