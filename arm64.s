	.build_version macos, 14, 0
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_jo_worker_ComputeRisk          ; -- Begin function jo_worker_ComputeRisk
	.p2align	2
_jo_worker_ComputeRisk:                 ; @jo_worker_ComputeRisk
; %bb.0:                                ; %entry
	ldp	x8, x9, [x0, #16]
	add	x10, x8, #17
	ldp	x0, x11, [x0]
	mul	x10, x11, x10
	add	x10, x10, x10, lsl #1
	mov	w11, #13                        ; =0xd
	sub	x10, x10, x8
	add	x8, x10, x8, lsl #3
	madd	x1, x9, x11, x8
	ret
                                        ; -- End function
	.globl	_jo_worker_wrapper_ComputeRisk  ; -- Begin function jo_worker_wrapper_ComputeRisk
	.p2align	2
_jo_worker_wrapper_ComputeRisk:         ; @jo_worker_wrapper_ComputeRisk
; %bb.0:                                ; %entry
	mov	x0, #0                          ; =0x0
	mov	x9, #0                          ; =0x0
Lloh0:
	adrp	x8, _jo_chan_ComputeRisk_data_ring@PAGE
Lloh1:
	ldr	x8, [x8, _jo_chan_ComputeRisk_data_ring@PAGEOFF]
Lloh2:
	adrp	x10, _jo_chan_ComputeRisk_ret_hdr_ring@PAGE
Lloh3:
	ldr	x10, [x10, _jo_chan_ComputeRisk_ret_hdr_ring@PAGEOFF]
Lloh4:
	adrp	x11, _jo_chan_ComputeRisk_ret_data_ring@PAGE
Lloh5:
	ldr	x11, [x11, _jo_chan_ComputeRisk_ret_data_ring@PAGEOFF]
Lloh6:
	adrp	x12, _jo_chan_ComputeRisk_write@PAGE
Lloh7:
	add	x12, x12, _jo_chan_ComputeRisk_write@PAGEOFF
	mov	w13, #13                        ; =0xd
	mov	w14, #52450                     ; =0xcce2
	movk	w14, #39070, lsl #16
Lloh8:
	adrp	x15, _jo_chan_ComputeRisk_ret_write@PAGE
Lloh9:
	add	x15, x15, _jo_chan_ComputeRisk_ret_write@PAGEOFF
LBB1_1:                                 ; %poll
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_3 Depth 2
	ldapr	x16, [x12]
	cmp	x16, x0
	b.eq	LBB1_1
; %bb.2:                                ; %process.preheader
                                        ;   in Loop: Header=BB1_1 Depth=1
	lsl	x17, x0, #7
	add	x0, x0, #1
LBB1_3:                                 ; %process
                                        ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x1, x17, #0x1ff80
	add	x1, x8, x1
	ldp	x2, x3, [x1, #16]
	add	x4, x2, #17
	ldp	x1, x5, [x1]
	mul	x4, x5, x4
	add	x4, x4, x4, lsl #1
	sub	x4, x4, x2
	add	x2, x4, x2, lsl #3
	madd	x2, x3, x13, x2
	str	x14, [x10, x9, lsl #3]
	add	x3, x11, x9, lsl #4
	stp	x1, x2, [x3]
	add	w9, w9, #1
	and	x9, x9, #0x3ff
	and	x1, x0, #0x3ff
	add	x17, x17, #128
	add	x0, x0, #1
	cmp	x1, x16
	b.ne	LBB1_3
; %bb.4:                                ; %batch_done
                                        ;   in Loop: Header=BB1_1 Depth=1
	stlr	x9, [x15]
	mov	x0, x16
	b	LBB1_1
	.loh AdrpAdd	Lloh8, Lloh9
	.loh AdrpAdd	Lloh6, Lloh7
	.loh AdrpLdr	Lloh4, Lloh5
	.loh AdrpLdr	Lloh2, Lloh3
	.loh AdrpLdr	Lloh0, Lloh1
                                        ; -- End function
	.globl	_jo_worker_ComputeGreeks        ; -- Begin function jo_worker_ComputeGreeks
	.p2align	2
_jo_worker_ComputeGreeks:               ; @jo_worker_ComputeGreeks
; %bb.0:                                ; %entry
	ldp	x8, x9, [x0]
	mul	x10, x9, x9
	mov	x11, #63439                     ; =0xf7cf
	movk	x11, #58195, lsl #16
	movk	x11, #39845, lsl #32
	movk	x11, #8388, lsl #48
	umulh	x10, x10, x11
	ldp	x11, x12, [x0, #16]
	mul	x11, x11, x11
	mov	x13, #55051                     ; =0xd70b
	movk	x13, #28835, lsl #16
	movk	x13, #2621, lsl #32
	movk	x13, #41943, lsl #48
	umulh	x11, x11, x13
	mov	w13, #41                        ; =0x29
	mul	x9, x9, x13
	add	x9, x9, x10, lsr #7
	add	x9, x9, x11, lsr #6
	sub	x9, x9, x12
	add	x1, x9, x12, lsl #5
	mov	x0, x8
	ret
                                        ; -- End function
	.globl	_jo_worker_wrapper_ComputeGreeks ; -- Begin function jo_worker_wrapper_ComputeGreeks
	.p2align	2
_jo_worker_wrapper_ComputeGreeks:       ; @jo_worker_wrapper_ComputeGreeks
; %bb.0:                                ; %entry
	mov	x2, #0                          ; =0x0
	mov	x9, #0                          ; =0x0
Lloh10:
	adrp	x8, _jo_chan_ComputeGreeks_data_ring@PAGE
Lloh11:
	ldr	x8, [x8, _jo_chan_ComputeGreeks_data_ring@PAGEOFF]
Lloh12:
	adrp	x10, _jo_chan_ComputeGreeks_ret_hdr_ring@PAGE
Lloh13:
	ldr	x10, [x10, _jo_chan_ComputeGreeks_ret_hdr_ring@PAGEOFF]
Lloh14:
	adrp	x11, _jo_chan_ComputeGreeks_ret_data_ring@PAGE
Lloh15:
	ldr	x11, [x11, _jo_chan_ComputeGreeks_ret_data_ring@PAGEOFF]
Lloh16:
	adrp	x12, _jo_chan_ComputeGreeks_write@PAGE
Lloh17:
	add	x12, x12, _jo_chan_ComputeGreeks_write@PAGEOFF
	mov	x13, #63439                     ; =0xf7cf
	movk	x13, #58195, lsl #16
	movk	x13, #39845, lsl #32
	movk	x13, #8388, lsl #48
	mov	x14, #55051                     ; =0xd70b
	movk	x14, #28835, lsl #16
	movk	x14, #2621, lsl #32
	movk	x14, #41943, lsl #48
	mov	w15, #41                        ; =0x29
	mov	w16, #52450                     ; =0xcce2
	movk	w16, #39070, lsl #16
Lloh18:
	adrp	x17, _jo_chan_ComputeGreeks_ret_write@PAGE
Lloh19:
	add	x17, x17, _jo_chan_ComputeGreeks_ret_write@PAGEOFF
LBB3_1:                                 ; %poll
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_3 Depth 2
	ldapr	x0, [x12]
	cmp	x0, x2
	b.eq	LBB3_1
; %bb.2:                                ; %process.preheader
                                        ;   in Loop: Header=BB3_1 Depth=1
	lsl	x1, x2, #7
	add	x2, x2, #1
LBB3_3:                                 ; %process
                                        ;   Parent Loop BB3_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x3, x1, #0x1ff80
	add	x3, x8, x3
	ldp	x5, x4, [x3]
	mul	x6, x4, x4
	umulh	x6, x6, x13
	ldp	x7, x3, [x3, #16]
	mul	x7, x7, x7
	umulh	x7, x7, x14
	mul	x4, x4, x15
	add	x4, x4, x6, lsr #7
	add	x4, x4, x7, lsr #6
	sub	x4, x4, x3
	add	x3, x4, x3, lsl #5
	str	x16, [x10, x9, lsl #3]
	add	x4, x11, x9, lsl #4
	stp	x5, x3, [x4]
	add	w9, w9, #1
	and	x9, x9, #0x3ff
	and	x3, x2, #0x3ff
	add	x1, x1, #128
	add	x2, x2, #1
	cmp	x3, x0
	b.ne	LBB3_3
; %bb.4:                                ; %batch_done
                                        ;   in Loop: Header=BB3_1 Depth=1
	stlr	x9, [x17]
	mov	x2, x0
	b	LBB3_1
	.loh AdrpAdd	Lloh18, Lloh19
	.loh AdrpAdd	Lloh16, Lloh17
	.loh AdrpLdr	Lloh14, Lloh15
	.loh AdrpLdr	Lloh12, Lloh13
	.loh AdrpLdr	Lloh10, Lloh11
                                        ; -- End function
	.globl	_jo_worker_ComputeMargin        ; -- Begin function jo_worker_ComputeMargin
	.p2align	2
_jo_worker_ComputeMargin:               ; @jo_worker_ComputeMargin
; %bb.0:                                ; %entry
	ldp	x8, x9, [x0, #16]
	ldp	x0, x10, [x0]
	add	x11, x8, x10
	sub	x8, x10, x8
	mov	w12, #97                        ; =0x61
	mov	w13, #53                        ; =0x35
	mul	x10, x10, x13
	madd	x9, x9, x12, x10
	madd	x1, x11, x8, x9
	ret
                                        ; -- End function
	.globl	_jo_worker_wrapper_ComputeMargin ; -- Begin function jo_worker_wrapper_ComputeMargin
	.p2align	2
_jo_worker_wrapper_ComputeMargin:       ; @jo_worker_wrapper_ComputeMargin
; %bb.0:                                ; %entry
	mov	x1, #0                          ; =0x0
	mov	x9, #0                          ; =0x0
Lloh20:
	adrp	x8, _jo_chan_ComputeMargin_data_ring@PAGE
Lloh21:
	ldr	x8, [x8, _jo_chan_ComputeMargin_data_ring@PAGEOFF]
Lloh22:
	adrp	x10, _jo_chan_ComputeMargin_ret_hdr_ring@PAGE
Lloh23:
	ldr	x10, [x10, _jo_chan_ComputeMargin_ret_hdr_ring@PAGEOFF]
Lloh24:
	adrp	x11, _jo_chan_ComputeMargin_write@PAGE
Lloh25:
	add	x11, x11, _jo_chan_ComputeMargin_write@PAGEOFF
Lloh26:
	adrp	x12, _jo_chan_ComputeMargin_ret_data_ring@PAGE
Lloh27:
	ldr	x12, [x12, _jo_chan_ComputeMargin_ret_data_ring@PAGEOFF]
	mov	w13, #97                        ; =0x61
	mov	w14, #53                        ; =0x35
	mov	w15, #52450                     ; =0xcce2
	movk	w15, #39070, lsl #16
Lloh28:
	adrp	x16, _jo_chan_ComputeMargin_ret_write@PAGE
Lloh29:
	add	x16, x16, _jo_chan_ComputeMargin_ret_write@PAGEOFF
LBB5_1:                                 ; %poll
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_3 Depth 2
	ldapr	x17, [x11]
	cmp	x17, x1
	b.eq	LBB5_1
; %bb.2:                                ; %process.preheader
                                        ;   in Loop: Header=BB5_1 Depth=1
	lsl	x0, x1, #7
	add	x1, x1, #1
LBB5_3:                                 ; %process
                                        ;   Parent Loop BB5_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x2, x0, #0x1ff80
	add	x2, x8, x2
	ldp	x3, x4, [x2, #16]
	ldp	x2, x5, [x2]
	add	x6, x3, x5
	sub	x3, x5, x3
	mul	x5, x5, x14
	madd	x4, x4, x13, x5
	madd	x3, x6, x3, x4
	str	x15, [x10, x9, lsl #3]
	add	x4, x12, x9, lsl #4
	stp	x2, x3, [x4]
	add	w9, w9, #1
	and	x9, x9, #0x3ff
	and	x2, x1, #0x3ff
	add	x0, x0, #128
	add	x1, x1, #1
	cmp	x2, x17
	b.ne	LBB5_3
; %bb.4:                                ; %batch_done
                                        ;   in Loop: Header=BB5_1 Depth=1
	stlr	x9, [x16]
	mov	x1, x17
	b	LBB5_1
	.loh AdrpAdd	Lloh28, Lloh29
	.loh AdrpLdr	Lloh26, Lloh27
	.loh AdrpAdd	Lloh24, Lloh25
	.loh AdrpLdr	Lloh22, Lloh23
	.loh AdrpLdr	Lloh20, Lloh21
                                        ; -- End function
	.globl	_jo_worker_ComputeVol           ; -- Begin function jo_worker_ComputeVol
	.p2align	2
_jo_worker_ComputeVol:                  ; @jo_worker_ComputeVol
; %bb.0:                                ; %entry
	mov	w8, #131                        ; =0x83
	ldp	x9, x10, [x0, #16]
	mov	w11, #137                       ; =0x89
	ldp	x0, x12, [x0]
	mul	x13, x9, x12
	mov	x14, #-3689348814741910324      ; =0xcccccccccccccccc
	movk	x14, #52429
	umulh	x13, x13, x14
	neg	x14, x12
	madd	x8, x9, x8, x14
	add	x8, x8, x12, lsl #7
	madd	x8, x10, x11, x8
	add	x1, x8, x13, lsr #3
	ret
                                        ; -- End function
	.globl	_jo_worker_wrapper_ComputeVol   ; -- Begin function jo_worker_wrapper_ComputeVol
	.p2align	2
_jo_worker_wrapper_ComputeVol:          ; @jo_worker_wrapper_ComputeVol
; %bb.0:                                ; %entry
	stp	x20, x19, [sp, #-16]!           ; 16-byte Folded Spill
	mov	x2, #0                          ; =0x0
	mov	x9, #0                          ; =0x0
Lloh30:
	adrp	x8, _jo_chan_ComputeVol_data_ring@PAGE
Lloh31:
	ldr	x8, [x8, _jo_chan_ComputeVol_data_ring@PAGEOFF]
Lloh32:
	adrp	x10, _jo_chan_ComputeVol_ret_hdr_ring@PAGE
Lloh33:
	ldr	x10, [x10, _jo_chan_ComputeVol_ret_hdr_ring@PAGEOFF]
Lloh34:
	adrp	x11, _jo_chan_ComputeVol_ret_data_ring@PAGE
Lloh35:
	ldr	x11, [x11, _jo_chan_ComputeVol_ret_data_ring@PAGEOFF]
Lloh36:
	adrp	x12, _jo_chan_ComputeVol_write@PAGE
Lloh37:
	add	x12, x12, _jo_chan_ComputeVol_write@PAGEOFF
	mov	w13, #131                       ; =0x83
	mov	w14, #137                       ; =0x89
	mov	x15, #-3689348814741910324      ; =0xcccccccccccccccc
	movk	x15, #52429
	mov	w16, #52450                     ; =0xcce2
	movk	w16, #39070, lsl #16
Lloh38:
	adrp	x17, _jo_chan_ComputeVol_ret_write@PAGE
Lloh39:
	add	x17, x17, _jo_chan_ComputeVol_ret_write@PAGEOFF
LBB7_1:                                 ; %poll
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_3 Depth 2
	ldapr	x0, [x12]
	cmp	x0, x2
	b.eq	LBB7_1
; %bb.2:                                ; %process.preheader
                                        ;   in Loop: Header=BB7_1 Depth=1
	lsl	x1, x2, #7
	add	x2, x2, #1
LBB7_3:                                 ; %process
                                        ;   Parent Loop BB7_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x3, x1, #0x1ff80
	add	x3, x8, x3
	ldp	x4, x5, [x3, #16]
	ldp	x3, x6, [x3]
	mul	x7, x4, x6
	umulh	x7, x7, x15
	neg	x19, x6
	madd	x4, x4, x13, x19
	add	x4, x4, x6, lsl #7
	madd	x4, x5, x14, x4
	add	x4, x4, x7, lsr #3
	str	x16, [x10, x9, lsl #3]
	add	x5, x11, x9, lsl #4
	stp	x3, x4, [x5]
	add	w9, w9, #1
	and	x9, x9, #0x3ff
	and	x3, x2, #0x3ff
	add	x1, x1, #128
	add	x2, x2, #1
	cmp	x3, x0
	b.ne	LBB7_3
; %bb.4:                                ; %batch_done
                                        ;   in Loop: Header=BB7_1 Depth=1
	stlr	x9, [x17]
	mov	x2, x0
	b	LBB7_1
	.loh AdrpAdd	Lloh38, Lloh39
	.loh AdrpAdd	Lloh36, Lloh37
	.loh AdrpLdr	Lloh34, Lloh35
	.loh AdrpLdr	Lloh32, Lloh33
	.loh AdrpLdr	Lloh30, Lloh31
                                        ; -- End function
	.globl	_jo_worker_ComputeExposure      ; -- Begin function jo_worker_ComputeExposure
	.p2align	2
_jo_worker_ComputeExposure:             ; @jo_worker_ComputeExposure
; %bb.0:                                ; %entry
	ldp	x8, x9, [x0]
	add	x10, x9, x9, lsl #1
	ldp	x11, x12, [x0, #16]
	add	x11, x11, x11, lsl #2
	add	x10, x11, x10
	add	x11, x12, #7
	mov	w12, #67                        ; =0x43
	mul	x9, x9, x12
	madd	x1, x10, x11, x9
	mov	x0, x8
	ret
                                        ; -- End function
	.globl	_jo_worker_wrapper_ComputeExposure ; -- Begin function jo_worker_wrapper_ComputeExposure
	.p2align	2
_jo_worker_wrapper_ComputeExposure:     ; @jo_worker_wrapper_ComputeExposure
; %bb.0:                                ; %entry
	mov	x0, #0                          ; =0x0
	mov	x9, #0                          ; =0x0
Lloh40:
	adrp	x8, _jo_chan_ComputeExposure_data_ring@PAGE
Lloh41:
	ldr	x8, [x8, _jo_chan_ComputeExposure_data_ring@PAGEOFF]
Lloh42:
	adrp	x10, _jo_chan_ComputeExposure_ret_hdr_ring@PAGE
Lloh43:
	ldr	x10, [x10, _jo_chan_ComputeExposure_ret_hdr_ring@PAGEOFF]
Lloh44:
	adrp	x11, _jo_chan_ComputeExposure_ret_data_ring@PAGE
Lloh45:
	ldr	x11, [x11, _jo_chan_ComputeExposure_ret_data_ring@PAGEOFF]
Lloh46:
	adrp	x12, _jo_chan_ComputeExposure_write@PAGE
Lloh47:
	add	x12, x12, _jo_chan_ComputeExposure_write@PAGEOFF
	mov	w13, #67                        ; =0x43
	mov	w14, #52450                     ; =0xcce2
	movk	w14, #39070, lsl #16
Lloh48:
	adrp	x15, _jo_chan_ComputeExposure_ret_write@PAGE
Lloh49:
	add	x15, x15, _jo_chan_ComputeExposure_ret_write@PAGEOFF
LBB9_1:                                 ; %poll
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB9_3 Depth 2
	ldapr	x16, [x12]
	cmp	x16, x0
	b.eq	LBB9_1
; %bb.2:                                ; %process.preheader
                                        ;   in Loop: Header=BB9_1 Depth=1
	lsl	x17, x0, #7
	add	x0, x0, #1
LBB9_3:                                 ; %process
                                        ;   Parent Loop BB9_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x1, x17, #0x1ff80
	add	x1, x8, x1
	ldp	x3, x2, [x1]
	add	x4, x2, x2, lsl #1
	ldp	x5, x1, [x1, #16]
	add	x5, x5, x5, lsl #2
	add	x4, x5, x4
	add	x1, x1, #7
	mul	x2, x2, x13
	madd	x1, x4, x1, x2
	str	x14, [x10, x9, lsl #3]
	add	x2, x11, x9, lsl #4
	stp	x3, x1, [x2]
	add	w9, w9, #1
	and	x9, x9, #0x3ff
	and	x1, x0, #0x3ff
	add	x17, x17, #128
	add	x0, x0, #1
	cmp	x1, x16
	b.ne	LBB9_3
; %bb.4:                                ; %batch_done
                                        ;   in Loop: Header=BB9_1 Depth=1
	stlr	x9, [x15]
	mov	x0, x16
	b	LBB9_1
	.loh AdrpAdd	Lloh48, Lloh49
	.loh AdrpAdd	Lloh46, Lloh47
	.loh AdrpLdr	Lloh44, Lloh45
	.loh AdrpLdr	Lloh42, Lloh43
	.loh AdrpLdr	Lloh40, Lloh41
                                        ; -- End function
	.globl	_jo_worker_ComputePnL           ; -- Begin function jo_worker_ComputePnL
	.p2align	2
_jo_worker_ComputePnL:                  ; @jo_worker_ComputePnL
; %bb.0:                                ; %entry
	ldp	x8, x9, [x0]
	lsl	x10, x9, #1
	mov	w11, #71                        ; =0x47
	mul	x9, x9, x11
	ldp	x11, x12, [x0, #16]
	mov	w13, #79                        ; =0x4f
	add	x10, x10, #73
	madd	x9, x12, x13, x9
	madd	x1, x10, x11, x9
	mov	x0, x8
	ret
                                        ; -- End function
	.globl	_jo_worker_wrapper_ComputePnL   ; -- Begin function jo_worker_wrapper_ComputePnL
	.p2align	2
_jo_worker_wrapper_ComputePnL:          ; @jo_worker_wrapper_ComputePnL
; %bb.0:                                ; %entry
	mov	x1, #0                          ; =0x0
	mov	x9, #0                          ; =0x0
Lloh50:
	adrp	x8, _jo_chan_ComputePnL_data_ring@PAGE
Lloh51:
	ldr	x8, [x8, _jo_chan_ComputePnL_data_ring@PAGEOFF]
Lloh52:
	adrp	x10, _jo_chan_ComputePnL_ret_hdr_ring@PAGE
Lloh53:
	ldr	x10, [x10, _jo_chan_ComputePnL_ret_hdr_ring@PAGEOFF]
Lloh54:
	adrp	x11, _jo_chan_ComputePnL_write@PAGE
Lloh55:
	add	x11, x11, _jo_chan_ComputePnL_write@PAGEOFF
Lloh56:
	adrp	x12, _jo_chan_ComputePnL_ret_data_ring@PAGE
Lloh57:
	ldr	x12, [x12, _jo_chan_ComputePnL_ret_data_ring@PAGEOFF]
	mov	w13, #71                        ; =0x47
	mov	w14, #79                        ; =0x4f
	mov	w15, #52450                     ; =0xcce2
	movk	w15, #39070, lsl #16
Lloh58:
	adrp	x16, _jo_chan_ComputePnL_ret_write@PAGE
Lloh59:
	add	x16, x16, _jo_chan_ComputePnL_ret_write@PAGEOFF
LBB11_1:                                ; %poll
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB11_3 Depth 2
	ldapr	x17, [x11]
	cmp	x17, x1
	b.eq	LBB11_1
; %bb.2:                                ; %process.preheader
                                        ;   in Loop: Header=BB11_1 Depth=1
	lsl	x0, x1, #7
	add	x1, x1, #1
LBB11_3:                                ; %process
                                        ;   Parent Loop BB11_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x2, x0, #0x1ff80
	add	x2, x8, x2
	ldp	x4, x3, [x2]
	lsl	x5, x3, #1
	mul	x3, x3, x13
	ldp	x6, x2, [x2, #16]
	add	x5, x5, #73
	madd	x2, x2, x14, x3
	madd	x2, x5, x6, x2
	str	x15, [x10, x9, lsl #3]
	add	x3, x12, x9, lsl #4
	stp	x4, x2, [x3]
	add	w9, w9, #1
	and	x9, x9, #0x3ff
	and	x2, x1, #0x3ff
	add	x0, x0, #128
	add	x1, x1, #1
	cmp	x2, x17
	b.ne	LBB11_3
; %bb.4:                                ; %batch_done
                                        ;   in Loop: Header=BB11_1 Depth=1
	stlr	x9, [x16]
	mov	x1, x17
	b	LBB11_1
	.loh AdrpAdd	Lloh58, Lloh59
	.loh AdrpLdr	Lloh56, Lloh57
	.loh AdrpAdd	Lloh54, Lloh55
	.loh AdrpLdr	Lloh52, Lloh53
	.loh AdrpLdr	Lloh50, Lloh51
                                        ; -- End function
	.globl	_jo_dispatch_ComputeRisk        ; -- Begin function jo_dispatch_ComputeRisk
	.p2align	2
_jo_dispatch_ComputeRisk:               ; @jo_dispatch_ComputeRisk
; %bb.0:                                ; %entry
	mov	w8, #52450                      ; =0xcce2
	movk	w8, #39070, lsl #16
	str	x8, [x0, x2, lsl #3]
	ldp	q0, q1, [x3]
	add	x8, x1, x2, lsl #7
	stp	q0, q1, [x8]
	ret
                                        ; -- End function
	.globl	_jo_dispatch_ComputeGreeks      ; -- Begin function jo_dispatch_ComputeGreeks
	.p2align	2
_jo_dispatch_ComputeGreeks:             ; @jo_dispatch_ComputeGreeks
; %bb.0:                                ; %entry
	mov	w8, #52450                      ; =0xcce2
	movk	w8, #39070, lsl #16
	str	x8, [x0, x2, lsl #3]
	ldp	q0, q1, [x3]
	add	x8, x1, x2, lsl #7
	stp	q0, q1, [x8]
	ret
                                        ; -- End function
	.globl	_jo_dispatch_ComputeMargin      ; -- Begin function jo_dispatch_ComputeMargin
	.p2align	2
_jo_dispatch_ComputeMargin:             ; @jo_dispatch_ComputeMargin
; %bb.0:                                ; %entry
	mov	w8, #52450                      ; =0xcce2
	movk	w8, #39070, lsl #16
	str	x8, [x0, x2, lsl #3]
	ldp	q0, q1, [x3]
	add	x8, x1, x2, lsl #7
	stp	q0, q1, [x8]
	ret
                                        ; -- End function
	.globl	_jo_dispatch_ComputeVol         ; -- Begin function jo_dispatch_ComputeVol
	.p2align	2
_jo_dispatch_ComputeVol:                ; @jo_dispatch_ComputeVol
; %bb.0:                                ; %entry
	mov	w8, #52450                      ; =0xcce2
	movk	w8, #39070, lsl #16
	str	x8, [x0, x2, lsl #3]
	ldp	q0, q1, [x3]
	add	x8, x1, x2, lsl #7
	stp	q0, q1, [x8]
	ret
                                        ; -- End function
	.globl	_jo_dispatch_ComputeExposure    ; -- Begin function jo_dispatch_ComputeExposure
	.p2align	2
_jo_dispatch_ComputeExposure:           ; @jo_dispatch_ComputeExposure
; %bb.0:                                ; %entry
	mov	w8, #52450                      ; =0xcce2
	movk	w8, #39070, lsl #16
	str	x8, [x0, x2, lsl #3]
	ldp	q0, q1, [x3]
	add	x8, x1, x2, lsl #7
	stp	q0, q1, [x8]
	ret
                                        ; -- End function
	.globl	_jo_dispatch_ComputePnL         ; -- Begin function jo_dispatch_ComputePnL
	.p2align	2
_jo_dispatch_ComputePnL:                ; @jo_dispatch_ComputePnL
; %bb.0:                                ; %entry
	mov	w8, #52450                      ; =0xcce2
	movk	w8, #39070, lsl #16
	str	x8, [x0, x2, lsl #3]
	ldp	q0, q1, [x3]
	add	x8, x1, x2, lsl #7
	stp	q0, q1, [x8]
	ret
                                        ; -- End function
	.globl	_jo_main                        ; -- Begin function jo_main
	.p2align	2
_jo_main:                               ; @jo_main
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #384
	stp	x28, x27, [sp, #288]            ; 16-byte Folded Spill
	stp	x26, x25, [sp, #304]            ; 16-byte Folded Spill
	stp	x24, x23, [sp, #320]            ; 16-byte Folded Spill
	stp	x22, x21, [sp, #336]            ; 16-byte Folded Spill
	stp	x20, x19, [sp, #352]            ; 16-byte Folded Spill
	stp	x29, x30, [sp, #368]            ; 16-byte Folded Spill
	.cfi_def_cfa_offset 384
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	.cfi_offset w21, -40
	.cfi_offset w22, -48
	.cfi_offset w23, -56
	.cfi_offset w24, -64
	.cfi_offset w25, -72
	.cfi_offset w26, -80
	.cfi_offset w27, -88
	.cfi_offset w28, -96
	str	x0, [sp, #184]                  ; 8-byte Folded Spill
	mov	x22, #0                         ; =0x0
	mov	x24, #0                         ; =0x0
	mov	x9, #0                          ; =0x0
Lloh60:
	adrp	x8, _jo_ring_orders@PAGE
Lloh61:
	ldr	x23, [x8, _jo_ring_orders@PAGEOFF]
Lloh62:
	adrp	x8, _jo_chan_ComputeRisk_hdr_ring@PAGE
Lloh63:
	ldr	x26, [x8, _jo_chan_ComputeRisk_hdr_ring@PAGEOFF]
Lloh64:
	adrp	x8, _jo_chan_ComputeRisk_data_ring@PAGE
Lloh65:
	ldr	x27, [x8, _jo_chan_ComputeRisk_data_ring@PAGEOFF]
Lloh66:
	adrp	x8, _jo_chan_ComputeGreeks_hdr_ring@PAGE
Lloh67:
	ldr	x28, [x8, _jo_chan_ComputeGreeks_hdr_ring@PAGEOFF]
Lloh68:
	adrp	x8, _jo_chan_ComputeGreeks_data_ring@PAGE
Lloh69:
	ldr	x19, [x8, _jo_chan_ComputeGreeks_data_ring@PAGEOFF]
	add	x25, x23, #32
Lloh70:
	adrp	x8, _jo_chan_ComputeMargin_hdr_ring@PAGE
Lloh71:
	ldr	x8, [x8, _jo_chan_ComputeMargin_hdr_ring@PAGEOFF]
	str	x8, [sp, #248]                  ; 8-byte Folded Spill
	add	x20, x23, #40
Lloh72:
	adrp	x8, _jo_chan_ComputeMargin_data_ring@PAGE
Lloh73:
	ldr	x8, [x8, _jo_chan_ComputeMargin_data_ring@PAGEOFF]
	str	x8, [sp, #152]                  ; 8-byte Folded Spill
	add	x21, x23, #48
Lloh74:
	adrp	x8, _jo_chan_ComputeVol_hdr_ring@PAGE
Lloh75:
	ldr	x10, [x8, _jo_chan_ComputeVol_hdr_ring@PAGEOFF]
	add	x8, x23, #56
	stp	x8, x10, [sp, #128]             ; 16-byte Folded Spill
Lloh76:
	adrp	x8, _jo_chan_ComputeVol_data_ring@PAGE
Lloh77:
	ldr	x10, [x8, _jo_chan_ComputeVol_data_ring@PAGEOFF]
	add	x8, x23, #64
	stp	x8, x10, [sp, #112]             ; 16-byte Folded Spill
Lloh78:
	adrp	x8, _jo_chan_ComputeExposure_hdr_ring@PAGE
Lloh79:
	ldr	x10, [x8, _jo_chan_ComputeExposure_hdr_ring@PAGEOFF]
	cmp	x1, #1
Lloh80:
	adrp	x8, _jo_chan_ComputeExposure_data_ring@PAGE
Lloh81:
	ldr	x8, [x8, _jo_chan_ComputeExposure_data_ring@PAGEOFF]
	stp	x8, x10, [sp, #96]              ; 16-byte Folded Spill
	csinc	x10, x1, xzr, hi
Lloh82:
	adrp	x8, _jo_chan_ComputePnL_hdr_ring@PAGE
Lloh83:
	ldr	x8, [x8, _jo_chan_ComputePnL_hdr_ring@PAGEOFF]
	stp	x8, x10, [sp, #80]              ; 16-byte Folded Spill
Lloh84:
	adrp	x8, _jo_chan_ComputePnL_data_ring@PAGE
Lloh85:
	ldr	x10, [x8, _jo_chan_ComputePnL_data_ring@PAGEOFF]
Lloh86:
	adrp	x8, _jo_chan_ComputeRisk_ret_data_ring@PAGE
Lloh87:
	ldr	x11, [x8, _jo_chan_ComputeRisk_ret_data_ring@PAGEOFF]
Lloh88:
	adrp	x8, _jo_chan_ComputeGreeks_ret_data_ring@PAGE
Lloh89:
	ldr	x8, [x8, _jo_chan_ComputeGreeks_ret_data_ring@PAGEOFF]
	stp	x8, x10, [sp, #64]              ; 16-byte Folded Spill
Lloh90:
	adrp	x8, _jo_chan_ComputeMargin_ret_data_ring@PAGE
Lloh91:
	ldr	x10, [x8, _jo_chan_ComputeMargin_ret_data_ring@PAGEOFF]
Lloh92:
	adrp	x8, _jo_chan_ComputeVol_ret_data_ring@PAGE
Lloh93:
	ldr	x8, [x8, _jo_chan_ComputeVol_ret_data_ring@PAGEOFF]
	stp	x8, x10, [sp, #48]              ; 16-byte Folded Spill
Lloh94:
	adrp	x8, _jo_chan_ComputeExposure_ret_data_ring@PAGE
Lloh95:
	ldr	x10, [x8, _jo_chan_ComputeExposure_ret_data_ring@PAGEOFF]
Lloh96:
	adrp	x8, _jo_chan_ComputePnL_ret_data_ring@PAGE
Lloh97:
	ldr	x8, [x8, _jo_chan_ComputePnL_ret_data_ring@PAGEOFF]
	stp	x8, x10, [sp, #32]              ; 16-byte Folded Spill
	add	x8, x23, #72
	stp	x11, x8, [sp, #16]              ; 16-byte Folded Spill
	stp	x27, x26, [sp, #272]            ; 16-byte Folded Spill
	stp	x19, x28, [sp, #256]            ; 16-byte Folded Spill
	stp	x25, x23, [sp, #168]            ; 16-byte Folded Spill
	str	x20, [sp, #160]                 ; 8-byte Folded Spill
	str	x21, [sp, #144]                 ; 8-byte Folded Spill
	ldr	x26, [sp, #120]                 ; 8-byte Folded Reload
	ldp	x28, x27, [sp, #96]             ; 16-byte Folded Reload
	b	LBB18_4
LBB18_1:                                ; %exit_479.thread
                                        ;   in Loop: Header=BB18_4 Depth=1
	ldp	x8, x11, [sp, #200]             ; 16-byte Folded Reload
	and	x8, x8, #0x3ff
	adrp	x9, _jo_chan_ComputeRisk_write@PAGE
	str	x8, [x9, _jo_chan_ComputeRisk_write@PAGEOFF]
	ldp	x23, x24, [sp, #224]            ; 16-byte Folded Reload
LBB18_2:                                ; %bp_drop_518
                                        ;   in Loop: Header=BB18_4 Depth=1
	adrp	x10, _jo_chan_ComputeRisk_drop_count@PAGE
	ldr	x9, [x10, _jo_chan_ComputeRisk_drop_count@PAGEOFF]
	sub	x9, x9, x11
	add	x9, x9, #100
	str	x9, [x10, _jo_chan_ComputeRisk_drop_count@PAGEOFF]
LBB18_3:                                ; %bp_drop_done_518
                                        ;   in Loop: Header=BB18_4 Depth=1
Lloh98:
	adrp	x9, _jo_chan_ComputeRisk_write@PAGE
Lloh99:
	add	x9, x9, _jo_chan_ComputeRisk_write@PAGEOFF
	stlr	x8, [x9]
Lloh100:
	adrp	x9, _jo_chan_ComputeGreeks_write@PAGE
Lloh101:
	add	x9, x9, _jo_chan_ComputeGreeks_write@PAGEOFF
	ldr	x8, [x9]
	stlr	x8, [x9]
Lloh102:
	adrp	x9, _jo_chan_ComputeMargin_write@PAGE
Lloh103:
	add	x9, x9, _jo_chan_ComputeMargin_write@PAGEOFF
	ldr	x8, [x9]
	stlr	x8, [x9]
Lloh104:
	adrp	x9, _jo_chan_ComputeVol_write@PAGE
Lloh105:
	add	x9, x9, _jo_chan_ComputeVol_write@PAGEOFF
	ldr	x8, [x9]
	stlr	x8, [x9]
Lloh106:
	adrp	x9, _jo_chan_ComputeExposure_write@PAGE
Lloh107:
	add	x9, x9, _jo_chan_ComputeExposure_write@PAGEOFF
	ldr	x8, [x9]
	stlr	x8, [x9]
Lloh108:
	adrp	x9, _jo_chan_ComputePnL_write@PAGE
Lloh109:
	add	x9, x9, _jo_chan_ComputePnL_write@PAGEOFF
	ldr	x8, [x9]
	stlr	x8, [x9]
	mov	w0, #4                          ; =0x4
	bl	_clock_gettime_nsec_np
	ldr	x8, [sp, #216]                  ; 8-byte Folded Reload
	sub	x8, x0, x8
	ldr	x9, [sp, #184]                  ; 8-byte Folded Reload
	str	x8, [x9, x23, lsl #3]
	add	x9, x23, #1
	ldr	x8, [sp, #88]                   ; 8-byte Folded Reload
	cmp	x9, x8
	ldr	x22, [sp, #240]                 ; 8-byte Folded Reload
	ldp	x25, x23, [sp, #168]            ; 16-byte Folded Reload
	ldr	x20, [sp, #160]                 ; 8-byte Folded Reload
	ldr	x21, [sp, #144]                 ; 8-byte Folded Reload
	b.eq	LBB18_46
LBB18_4:                                ; %cycle
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB18_6 Depth 2
                                        ;     Child Loop BB18_10 Depth 2
                                        ;     Child Loop BB18_13 Depth 2
                                        ;     Child Loop BB18_16 Depth 2
                                        ;     Child Loop BB18_19 Depth 2
                                        ;     Child Loop BB18_22 Depth 2
                                        ;     Child Loop BB18_25 Depth 2
                                        ;     Child Loop BB18_44 Depth 2
	str	x9, [sp, #224]                  ; 8-byte Folded Spill
	mov	w0, #4                          ; =0x4
	bl	_clock_gettime_nsec_np
	str	x0, [sp, #216]                  ; 8-byte Folded Spill
Lloh110:
	adrp	x8, _jo_chan_ComputeRisk_ret_write@PAGE
Lloh111:
	add	x8, x8, _jo_chan_ComputeRisk_ret_write@PAGEOFF
	ldapr	x8, [x8]
Lloh112:
	adrp	x9, _jo_chan_ComputeRisk_ret_read@PAGE
Lloh113:
	ldr	x9, [x9, _jo_chan_ComputeRisk_ret_read@PAGEOFF]
	subs	x10, x8, x9
	b.ls	LBB18_8
; %bb.5:                                ; %scan_body_208.preheader
                                        ;   in Loop: Header=BB18_4 Depth=1
	lsl	x11, x9, #4
	ldr	x14, [sp, #16]                  ; 8-byte Folded Reload
LBB18_6:                                ; %scan_body_208
                                        ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x12, x11, #0x3ff0
	add	x12, x14, x12
	ldp	x13, x12, [x12]
	ubfiz	x13, x13, #7, #10
	str	x12, [x25, x13]
	add	x11, x11, #16
	subs	x10, x10, #1
	b.ne	LBB18_6
; %bb.7:                                ; %scan_done_208.loopexit
                                        ;   in Loop: Header=BB18_4 Depth=1
	add	x10, x22, x8
	sub	x22, x10, x9
LBB18_8:                                ; %scan_done_208
                                        ;   in Loop: Header=BB18_4 Depth=1
	ldr	x13, [sp, #128]                 ; 8-byte Folded Reload
	ldr	x14, [sp, #112]                 ; 8-byte Folded Reload
	ldp	x16, x15, [sp, #56]             ; 16-byte Folded Reload
	mov	w17, #79                        ; =0x4f
	mov	w0, #57010                      ; =0xdeb2
	mov	w1, #67                         ; =0x43
	mov	w2, #57009                      ; =0xdeb1
	mov	w3, #131                        ; =0x83
	mov	w4, #137                        ; =0x89
	mov	x5, #-3689348814741910324       ; =0xcccccccccccccccc
	movk	x5, #52429
	mov	w6, #57008                      ; =0xdeb0
	mov	w7, #97                         ; =0x61
	mov	x30, #55051                     ; =0xd70b
	movk	x30, #28835, lsl #16
	movk	x30, #2621, lsl #32
	movk	x30, #41943, lsl #48
Lloh114:
	adrp	x9, _jo_chan_ComputeRisk_ret_read@PAGE
	str	x8, [x9, _jo_chan_ComputeRisk_ret_read@PAGEOFF]
Lloh115:
	adrp	x8, _jo_chan_ComputeGreeks_ret_write@PAGE
Lloh116:
	add	x8, x8, _jo_chan_ComputeGreeks_ret_write@PAGEOFF
	ldapr	x8, [x8]
Lloh117:
	adrp	x9, _jo_chan_ComputeGreeks_ret_read@PAGE
Lloh118:
	ldr	x10, [x9, _jo_chan_ComputeGreeks_ret_read@PAGEOFF]
	subs	x9, x8, x10
	b.ls	LBB18_11
; %bb.9:                                ; %scan_body_225.preheader
                                        ;   in Loop: Header=BB18_4 Depth=1
	lsl	x10, x10, #4
LBB18_10:                               ; %scan_body_225
                                        ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x11, x10, #0x3ff0
	add	x11, x15, x11
	ldp	x12, x11, [x11]
	ubfiz	x12, x12, #7, #10
	str	x11, [x20, x12]
	add	x10, x10, #16
	subs	x9, x9, #1
	b.ne	LBB18_10
LBB18_11:                               ; %scan_done_225
                                        ;   in Loop: Header=BB18_4 Depth=1
Lloh119:
	adrp	x9, _jo_chan_ComputeGreeks_ret_read@PAGE
	str	x8, [x9, _jo_chan_ComputeGreeks_ret_read@PAGEOFF]
Lloh120:
	adrp	x8, _jo_chan_ComputeMargin_ret_write@PAGE
Lloh121:
	add	x8, x8, _jo_chan_ComputeMargin_ret_write@PAGEOFF
	ldapr	x8, [x8]
Lloh122:
	adrp	x9, _jo_chan_ComputeMargin_ret_read@PAGE
Lloh123:
	ldr	x10, [x9, _jo_chan_ComputeMargin_ret_read@PAGEOFF]
	subs	x9, x8, x10
	b.ls	LBB18_14
; %bb.12:                               ; %scan_body_242.preheader
                                        ;   in Loop: Header=BB18_4 Depth=1
	lsl	x10, x10, #4
LBB18_13:                               ; %scan_body_242
                                        ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x11, x10, #0x3ff0
	add	x11, x16, x11
	ldp	x12, x11, [x11]
	ubfiz	x12, x12, #7, #10
	str	x11, [x21, x12]
	add	x10, x10, #16
	subs	x9, x9, #1
	b.ne	LBB18_13
LBB18_14:                               ; %scan_done_242
                                        ;   in Loop: Header=BB18_4 Depth=1
Lloh124:
	adrp	x9, _jo_chan_ComputeMargin_ret_read@PAGE
	str	x8, [x9, _jo_chan_ComputeMargin_ret_read@PAGEOFF]
Lloh125:
	adrp	x8, _jo_chan_ComputeVol_ret_write@PAGE
Lloh126:
	add	x8, x8, _jo_chan_ComputeVol_ret_write@PAGEOFF
	ldapr	x8, [x8]
Lloh127:
	adrp	x9, _jo_chan_ComputeVol_ret_read@PAGE
Lloh128:
	ldr	x10, [x9, _jo_chan_ComputeVol_ret_read@PAGEOFF]
	subs	x9, x8, x10
	ldr	x15, [sp, #48]                  ; 8-byte Folded Reload
	b.ls	LBB18_17
; %bb.15:                               ; %scan_body_259.preheader
                                        ;   in Loop: Header=BB18_4 Depth=1
	lsl	x10, x10, #4
LBB18_16:                               ; %scan_body_259
                                        ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x11, x10, #0x3ff0
	add	x11, x15, x11
	ldp	x12, x11, [x11]
	ubfiz	x12, x12, #7, #10
	str	x11, [x13, x12]
	add	x10, x10, #16
	subs	x9, x9, #1
	b.ne	LBB18_16
LBB18_17:                               ; %scan_done_259
                                        ;   in Loop: Header=BB18_4 Depth=1
Lloh129:
	adrp	x9, _jo_chan_ComputeVol_ret_read@PAGE
	str	x8, [x9, _jo_chan_ComputeVol_ret_read@PAGEOFF]
Lloh130:
	adrp	x8, _jo_chan_ComputeExposure_ret_write@PAGE
Lloh131:
	add	x8, x8, _jo_chan_ComputeExposure_ret_write@PAGEOFF
	ldapr	x8, [x8]
Lloh132:
	adrp	x9, _jo_chan_ComputeExposure_ret_read@PAGE
Lloh133:
	ldr	x10, [x9, _jo_chan_ComputeExposure_ret_read@PAGEOFF]
	subs	x9, x8, x10
	ldp	x15, x13, [sp, #32]             ; 16-byte Folded Reload
	ldr	x16, [sp, #24]                  ; 8-byte Folded Reload
	b.ls	LBB18_20
; %bb.18:                               ; %scan_body_276.preheader
                                        ;   in Loop: Header=BB18_4 Depth=1
	lsl	x10, x10, #4
LBB18_19:                               ; %scan_body_276
                                        ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x11, x10, #0x3ff0
	add	x11, x13, x11
	ldp	x12, x11, [x11]
	ubfiz	x12, x12, #7, #10
	str	x11, [x14, x12]
	add	x10, x10, #16
	subs	x9, x9, #1
	b.ne	LBB18_19
LBB18_20:                               ; %scan_done_276
                                        ;   in Loop: Header=BB18_4 Depth=1
Lloh134:
	adrp	x9, _jo_chan_ComputeExposure_ret_read@PAGE
	str	x8, [x9, _jo_chan_ComputeExposure_ret_read@PAGEOFF]
Lloh135:
	adrp	x8, _jo_chan_ComputePnL_ret_write@PAGE
Lloh136:
	add	x8, x8, _jo_chan_ComputePnL_ret_write@PAGEOFF
	ldapr	x8, [x8]
Lloh137:
	adrp	x9, _jo_chan_ComputePnL_ret_read@PAGE
Lloh138:
	ldr	x10, [x9, _jo_chan_ComputePnL_ret_read@PAGEOFF]
	subs	x9, x8, x10
	b.ls	LBB18_23
; %bb.21:                               ; %scan_body_293.preheader
                                        ;   in Loop: Header=BB18_4 Depth=1
	lsl	x10, x10, #4
LBB18_22:                               ; %scan_body_293
                                        ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x11, x10, #0x3ff0
	add	x11, x15, x11
	ldp	x12, x11, [x11]
	ubfiz	x12, x12, #7, #10
	str	x11, [x16, x12]
	add	x10, x10, #16
	subs	x9, x9, #1
	b.ne	LBB18_22
LBB18_23:                               ; %scan_done_293
                                        ;   in Loop: Header=BB18_4 Depth=1
	adrp	x9, _jo_chan_ComputePnL_ret_read@PAGE
	str	x8, [x9, _jo_chan_ComputePnL_ret_read@PAGEOFF]
	mov	x8, x23
	mov	w9, #100                        ; =0x64
	mov	w16, #71                        ; =0x47
	mov	w20, #53                        ; =0x35
	mov	w21, #57007                     ; =0xdeaf
	mov	x25, #63439                     ; =0xf7cf
	movk	x25, #58195, lsl #16
	movk	x25, #39845, lsl #32
	movk	x25, #8388, lsl #48
	b	LBB18_25
LBB18_24:                               ; %merge_448
                                        ;   in Loop: Header=BB18_25 Depth=2
	add	x10, x10, #1
	str	x10, [x8, #8]
	add	x8, x8, #128
	subs	x9, x9, #1
	b.eq	LBB18_43
LBB18_25:                               ; %body_307
                                        ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ldr	x10, [x8, #32]
	cbz	x10, LBB18_28
; %bb.26:                               ; %then_312
                                        ;   in Loop: Header=BB18_25 Depth=2
	ldp	x11, x12, [x8, #8]
	add	x13, x12, #17
	mul	x11, x11, x13
	add	x11, x11, x11, lsl #1
	sub	x11, x11, x12
	add	x11, x11, x12, lsl #3
	ldr	x12, [x8, #24]
	mov	w13, #13                        ; =0xd
	madd	x11, x12, x13, x11
	cmp	x10, x11
	b.eq	LBB18_28
; %bb.27:                               ; %then_334
                                        ;   in Loop: Header=BB18_25 Depth=2
	mov	w10, #57005                     ; =0xdead
	str	x10, [x8]
LBB18_28:                               ; %merge_312
                                        ;   in Loop: Header=BB18_25 Depth=2
	ldr	x10, [x8, #40]
	cbz	x10, LBB18_31
; %bb.29:                               ; %then_339
                                        ;   in Loop: Header=BB18_25 Depth=2
	ldp	x11, x12, [x8, #8]
	mul	x13, x11, x11
	umulh	x13, x13, x25
	mul	x12, x12, x12
	umulh	x12, x12, x30
	ldr	x14, [x8, #24]
	mov	w15, #41                        ; =0x29
	mul	x11, x11, x15
	add	x11, x11, x13, lsr #7
	add	x11, x11, x12, lsr #6
	sub	x11, x11, x14
	add	x11, x11, x14, lsl #5
	cmp	x10, x11
	b.eq	LBB18_31
; %bb.30:                               ; %then_364
                                        ;   in Loop: Header=BB18_25 Depth=2
	mov	w10, #57006                     ; =0xdeae
	str	x10, [x8]
LBB18_31:                               ; %merge_339
                                        ;   in Loop: Header=BB18_25 Depth=2
	ldr	x10, [x8, #48]
	cbz	x10, LBB18_34
; %bb.32:                               ; %then_369
                                        ;   in Loop: Header=BB18_25 Depth=2
	ldp	x11, x12, [x8, #8]
	add	x13, x12, x11
	sub	x12, x11, x12
	ldr	x14, [x8, #24]
	mul	x11, x11, x20
	madd	x11, x14, x7, x11
	madd	x11, x13, x12, x11
	cmp	x10, x11
	b.eq	LBB18_34
; %bb.33:                               ; %then_392
                                        ;   in Loop: Header=BB18_25 Depth=2
	str	x21, [x8]
LBB18_34:                               ; %merge_369
                                        ;   in Loop: Header=BB18_25 Depth=2
	ldr	x10, [x8, #56]
	cbz	x10, LBB18_37
; %bb.35:                               ; %then_397
                                        ;   in Loop: Header=BB18_25 Depth=2
	ldp	x11, x12, [x8, #8]
	neg	x13, x11
	madd	x13, x12, x3, x13
	add	x13, x13, x11, lsl #7
	ldr	x14, [x8, #24]
	madd	x13, x14, x4, x13
	mul	x11, x12, x11
	umulh	x11, x11, x5
	add	x11, x13, x11, lsr #3
	cmp	x10, x11
	b.eq	LBB18_37
; %bb.36:                               ; %then_419
                                        ;   in Loop: Header=BB18_25 Depth=2
	str	x6, [x8]
LBB18_37:                               ; %merge_397
                                        ;   in Loop: Header=BB18_25 Depth=2
	ldr	x10, [x8, #64]
	cbz	x10, LBB18_40
; %bb.38:                               ; %then_424
                                        ;   in Loop: Header=BB18_25 Depth=2
	ldp	x11, x12, [x8, #8]
	add	x13, x11, x11, lsl #1
	add	x12, x12, x12, lsl #2
	add	x12, x12, x13
	ldr	x13, [x8, #24]
	add	x13, x13, #7
	mul	x11, x11, x1
	madd	x11, x12, x13, x11
	cmp	x10, x11
	b.eq	LBB18_40
; %bb.39:                               ; %then_443
                                        ;   in Loop: Header=BB18_25 Depth=2
	str	x2, [x8]
LBB18_40:                               ; %merge_424
                                        ;   in Loop: Header=BB18_25 Depth=2
	ldr	x11, [x8, #72]
	ldr	x10, [x8, #8]
	cbz	x11, LBB18_24
; %bb.41:                               ; %then_448
                                        ;   in Loop: Header=BB18_25 Depth=2
	lsl	x12, x10, #1
	mul	x13, x10, x16
	ldp	x14, x15, [x8, #16]
	add	x12, x12, #73
	madd	x13, x15, x17, x13
	madd	x12, x12, x14, x13
	cmp	x11, x12
	b.eq	LBB18_24
; %bb.42:                               ; %then_470
                                        ;   in Loop: Header=BB18_25 Depth=2
	str	x0, [x8]
	b	LBB18_24
LBB18_43:                               ; %exit_307
                                        ;   in Loop: Header=BB18_4 Depth=1
	stp	x24, x22, [sp, #232]            ; 16-byte Folded Spill
	sub	x8, x22, x24
Lloh139:
	adrp	x9, _jo_chan_ComputeRisk_write@PAGE
Lloh140:
	ldr	x24, [x9, _jo_chan_ComputeRisk_write@PAGEOFF]
	mov	x22, x23
	add	x9, x8, #1023
	cmp	x9, #100
	mov	w8, #100                        ; =0x64
	csel	x25, x9, x8, lo
	stp	x24, x25, [sp, #200]            ; 16-byte Folded Spill
	ldr	x21, [sp, #152]                 ; 8-byte Folded Reload
	ldr	x23, [sp, #136]                 ; 8-byte Folded Reload
	ldp	x20, x19, [sp, #72]             ; 16-byte Folded Reload
	str	x9, [sp, #192]                  ; 8-byte Folded Spill
	cbz	x9, LBB18_1
LBB18_44:                               ; %body_479
                                        ;   Parent Loop BB18_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	and	x2, x24, #0x3ff
	ldp	x1, x0, [sp, #272]              ; 16-byte Folded Reload
	mov	x3, x22
	bl	_jo_dispatch_ComputeRisk
	and	x2, x24, #0x3ff
	ldp	x1, x0, [sp, #256]              ; 16-byte Folded Reload
	mov	x3, x22
	bl	_jo_dispatch_ComputeGreeks
	and	x2, x24, #0x3ff
	ldr	x0, [sp, #248]                  ; 8-byte Folded Reload
	mov	x1, x21
	mov	x3, x22
	bl	_jo_dispatch_ComputeMargin
	and	x2, x24, #0x3ff
	mov	x0, x23
	mov	x1, x26
	mov	x3, x22
	bl	_jo_dispatch_ComputeVol
	and	x2, x24, #0x3ff
	mov	x0, x27
	mov	x1, x28
	mov	x3, x22
	bl	_jo_dispatch_ComputeExposure
	and	x2, x24, #0x3ff
	mov	x0, x19
	mov	x1, x20
	mov	x3, x22
	bl	_jo_dispatch_ComputePnL
	add	x24, x24, #1
	add	x22, x22, #128
	subs	x25, x25, #1
	b.ne	LBB18_44
; %bb.45:                               ; %exit_479
                                        ;   in Loop: Header=BB18_4 Depth=1
	ldp	x23, x24, [sp, #224]            ; 16-byte Folded Reload
	ldp	x8, x11, [sp, #200]             ; 16-byte Folded Reload
	add	x24, x11, x24
	add	w8, w8, w11
	and	x8, x8, #0x3ff
	adrp	x9, _jo_chan_ComputeRisk_write@PAGE
	str	x8, [x9, _jo_chan_ComputeRisk_write@PAGEOFF]
	ldr	x9, [sp, #192]                  ; 8-byte Folded Reload
	cmp	x9, #99
	b.ls	LBB18_2
	b	LBB18_3
LBB18_46:                               ; %bench_exit
	ldp	x29, x30, [sp, #368]            ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #352]            ; 16-byte Folded Reload
	ldp	x22, x21, [sp, #336]            ; 16-byte Folded Reload
	ldp	x24, x23, [sp, #320]            ; 16-byte Folded Reload
	ldp	x26, x25, [sp, #304]            ; 16-byte Folded Reload
	ldp	x28, x27, [sp, #288]            ; 16-byte Folded Reload
	add	sp, sp, #384
	ret
	.loh AdrpLdr	Lloh96, Lloh97
	.loh AdrpAdrp	Lloh94, Lloh96
	.loh AdrpLdr	Lloh94, Lloh95
	.loh AdrpLdr	Lloh92, Lloh93
	.loh AdrpAdrp	Lloh90, Lloh92
	.loh AdrpLdr	Lloh90, Lloh91
	.loh AdrpLdr	Lloh88, Lloh89
	.loh AdrpAdrp	Lloh86, Lloh88
	.loh AdrpLdr	Lloh86, Lloh87
	.loh AdrpAdrp	Lloh84, Lloh86
	.loh AdrpLdr	Lloh84, Lloh85
	.loh AdrpLdr	Lloh82, Lloh83
	.loh AdrpLdr	Lloh80, Lloh81
	.loh AdrpAdrp	Lloh78, Lloh80
	.loh AdrpLdr	Lloh78, Lloh79
	.loh AdrpLdr	Lloh76, Lloh77
	.loh AdrpLdr	Lloh74, Lloh75
	.loh AdrpLdr	Lloh72, Lloh73
	.loh AdrpLdr	Lloh70, Lloh71
	.loh AdrpAdrp	Lloh68, Lloh70
	.loh AdrpLdr	Lloh68, Lloh69
	.loh AdrpAdrp	Lloh66, Lloh68
	.loh AdrpLdr	Lloh66, Lloh67
	.loh AdrpAdrp	Lloh64, Lloh66
	.loh AdrpLdr	Lloh64, Lloh65
	.loh AdrpAdrp	Lloh62, Lloh64
	.loh AdrpLdr	Lloh62, Lloh63
	.loh AdrpAdrp	Lloh60, Lloh62
	.loh AdrpLdr	Lloh60, Lloh61
	.loh AdrpAdd	Lloh108, Lloh109
	.loh AdrpAdd	Lloh106, Lloh107
	.loh AdrpAdd	Lloh104, Lloh105
	.loh AdrpAdd	Lloh102, Lloh103
	.loh AdrpAdd	Lloh100, Lloh101
	.loh AdrpAdd	Lloh98, Lloh99
	.loh AdrpLdr	Lloh112, Lloh113
	.loh AdrpAdd	Lloh110, Lloh111
	.loh AdrpLdr	Lloh117, Lloh118
	.loh AdrpAdd	Lloh115, Lloh116
	.loh AdrpAdrp	Lloh114, Lloh117
	.loh AdrpLdr	Lloh122, Lloh123
	.loh AdrpAdd	Lloh120, Lloh121
	.loh AdrpAdrp	Lloh119, Lloh122
	.loh AdrpLdr	Lloh127, Lloh128
	.loh AdrpAdd	Lloh125, Lloh126
	.loh AdrpAdrp	Lloh124, Lloh127
	.loh AdrpLdr	Lloh132, Lloh133
	.loh AdrpAdd	Lloh130, Lloh131
	.loh AdrpAdrp	Lloh129, Lloh132
	.loh AdrpLdr	Lloh137, Lloh138
	.loh AdrpAdd	Lloh135, Lloh136
	.loh AdrpAdrp	Lloh134, Lloh137
	.loh AdrpLdr	Lloh139, Lloh140
	.cfi_endproc
                                        ; -- End function
	.globl	_main                           ; -- Begin function main
	.p2align	2
_main:                                  ; @main
	.cfi_startproc
; %bb.0:                                ; %entry
	sub	sp, sp, #80
	stp	x20, x19, [sp, #48]             ; 16-byte Folded Spill
	stp	x29, x30, [sp, #64]             ; 16-byte Folded Spill
	.cfi_def_cfa_offset 80
	.cfi_offset w30, -8
	.cfi_offset w29, -16
	.cfi_offset w19, -24
	.cfi_offset w20, -32
	mov	x0, #0                          ; =0x0
	mov	w1, #131072                     ; =0x20000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_ring_orders@PAGE
	str	x0, [x8, _jo_ring_orders@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #8192                       ; =0x2000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeRisk_hdr_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeRisk_hdr_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #131072                     ; =0x20000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeRisk_data_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeRisk_data_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #8192                       ; =0x2000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeGreeks_hdr_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeGreeks_hdr_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #131072                     ; =0x20000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeGreeks_data_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeGreeks_data_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #8192                       ; =0x2000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeMargin_hdr_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeMargin_hdr_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #131072                     ; =0x20000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeMargin_data_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeMargin_data_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #8192                       ; =0x2000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeVol_hdr_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeVol_hdr_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #131072                     ; =0x20000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeVol_data_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeVol_data_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #8192                       ; =0x2000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeExposure_hdr_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeExposure_hdr_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #131072                     ; =0x20000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeExposure_data_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeExposure_data_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #8192                       ; =0x2000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputePnL_hdr_ring@PAGE
	str	x0, [x8, _jo_chan_ComputePnL_hdr_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #131072                     ; =0x20000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputePnL_data_ring@PAGE
	str	x0, [x8, _jo_chan_ComputePnL_data_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #8192                       ; =0x2000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeRisk_ret_hdr_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeRisk_ret_hdr_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #16384                      ; =0x4000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeRisk_ret_data_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeRisk_ret_data_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #8192                       ; =0x2000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeGreeks_ret_hdr_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeGreeks_ret_hdr_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #16384                      ; =0x4000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeGreeks_ret_data_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeGreeks_ret_data_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #8192                       ; =0x2000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeMargin_ret_hdr_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeMargin_ret_hdr_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #16384                      ; =0x4000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeMargin_ret_data_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeMargin_ret_data_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #8192                       ; =0x2000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeVol_ret_hdr_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeVol_ret_hdr_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #16384                      ; =0x4000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeVol_ret_data_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeVol_ret_data_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #8192                       ; =0x2000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeExposure_ret_hdr_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeExposure_ret_hdr_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #16384                      ; =0x4000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputeExposure_ret_data_ring@PAGE
	str	x0, [x8, _jo_chan_ComputeExposure_ret_data_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #8192                       ; =0x2000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputePnL_ret_hdr_ring@PAGE
	str	x0, [x8, _jo_chan_ComputePnL_ret_hdr_ring@PAGEOFF]
	mov	x0, #0                          ; =0x0
	mov	w1, #16384                      ; =0x4000
	mov	w2, #3                          ; =0x3
	mov	w3, #4098                       ; =0x1002
	mov	w4, #-1                         ; =0xffffffff
	mov	x5, #0                          ; =0x0
	bl	_mmap
	adrp	x8, _jo_chan_ComputePnL_ret_data_ring@PAGE
	str	x0, [x8, _jo_chan_ComputePnL_ret_data_ring@PAGEOFF]
Lloh141:
	adrp	x2, _jo_worker_wrapper_ComputeRisk@PAGE
Lloh142:
	add	x2, x2, _jo_worker_wrapper_ComputeRisk@PAGEOFF
	add	x0, sp, #40
	mov	x1, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	bl	_pthread_create
Lloh143:
	adrp	x2, _jo_worker_wrapper_ComputeGreeks@PAGE
Lloh144:
	add	x2, x2, _jo_worker_wrapper_ComputeGreeks@PAGEOFF
	add	x0, sp, #32
	mov	x1, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	bl	_pthread_create
Lloh145:
	adrp	x2, _jo_worker_wrapper_ComputeMargin@PAGE
Lloh146:
	add	x2, x2, _jo_worker_wrapper_ComputeMargin@PAGEOFF
	add	x0, sp, #24
	mov	x1, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	bl	_pthread_create
Lloh147:
	adrp	x2, _jo_worker_wrapper_ComputeVol@PAGE
Lloh148:
	add	x2, x2, _jo_worker_wrapper_ComputeVol@PAGEOFF
	add	x0, sp, #16
	mov	x1, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	bl	_pthread_create
Lloh149:
	adrp	x2, _jo_worker_wrapper_ComputeExposure@PAGE
Lloh150:
	add	x2, x2, _jo_worker_wrapper_ComputeExposure@PAGEOFF
	add	x0, sp, #8
	mov	x1, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	bl	_pthread_create
Lloh151:
	adrp	x2, _jo_worker_wrapper_ComputePnL@PAGE
Lloh152:
	add	x2, x2, _jo_worker_wrapper_ComputePnL@PAGEOFF
	mov	x0, sp
	mov	x1, #0                          ; =0x0
	mov	x3, #0                          ; =0x0
	bl	_pthread_create
	mov	w0, #4608                       ; =0x1200
	movk	w0, #122, lsl #16
	bl	_malloc
	mov	x19, x0
	mov	w1, #10000                      ; =0x2710
	bl	_jo_main
	mov	x0, x19
	mov	w1, #16960                      ; =0x4240
	movk	w1, #15, lsl #16
	bl	_jo_main
	mov	x0, x19
	mov	w1, #16960                      ; =0x4240
	movk	w1, #15, lsl #16
	bl	_jo_print_stats
	mov	x0, x19
	bl	_free
	mov	w0, #0                          ; =0x0
	ldp	x29, x30, [sp, #64]             ; 16-byte Folded Reload
	ldp	x20, x19, [sp, #48]             ; 16-byte Folded Reload
	add	sp, sp, #80
	ret
	.loh AdrpAdd	Lloh151, Lloh152
	.loh AdrpAdd	Lloh149, Lloh150
	.loh AdrpAdd	Lloh147, Lloh148
	.loh AdrpAdd	Lloh145, Lloh146
	.loh AdrpAdd	Lloh143, Lloh144
	.loh AdrpAdd	Lloh141, Lloh142
	.cfi_endproc
                                        ; -- End function
	.globl	_jo_ring_orders                 ; @jo_ring_orders
.zerofill __DATA,__common,_jo_ring_orders,8,3
	.globl	_jo_chan_ComputeRisk_hdr_ring   ; @jo_chan_ComputeRisk_hdr_ring
.zerofill __DATA,__common,_jo_chan_ComputeRisk_hdr_ring,8,3
	.globl	_jo_chan_ComputeRisk_data_ring  ; @jo_chan_ComputeRisk_data_ring
.zerofill __DATA,__common,_jo_chan_ComputeRisk_data_ring,8,3
	.globl	_jo_chan_ComputeRisk_write      ; @jo_chan_ComputeRisk_write
.zerofill __DATA,__common,_jo_chan_ComputeRisk_write,8,3
	.globl	_jo_chan_ComputeGreeks_hdr_ring ; @jo_chan_ComputeGreeks_hdr_ring
.zerofill __DATA,__common,_jo_chan_ComputeGreeks_hdr_ring,8,3
	.globl	_jo_chan_ComputeGreeks_data_ring ; @jo_chan_ComputeGreeks_data_ring
.zerofill __DATA,__common,_jo_chan_ComputeGreeks_data_ring,8,3
	.globl	_jo_chan_ComputeGreeks_write    ; @jo_chan_ComputeGreeks_write
.zerofill __DATA,__common,_jo_chan_ComputeGreeks_write,8,3
	.globl	_jo_chan_ComputeMargin_hdr_ring ; @jo_chan_ComputeMargin_hdr_ring
.zerofill __DATA,__common,_jo_chan_ComputeMargin_hdr_ring,8,3
	.globl	_jo_chan_ComputeMargin_data_ring ; @jo_chan_ComputeMargin_data_ring
.zerofill __DATA,__common,_jo_chan_ComputeMargin_data_ring,8,3
	.globl	_jo_chan_ComputeMargin_write    ; @jo_chan_ComputeMargin_write
.zerofill __DATA,__common,_jo_chan_ComputeMargin_write,8,3
	.globl	_jo_chan_ComputeVol_hdr_ring    ; @jo_chan_ComputeVol_hdr_ring
.zerofill __DATA,__common,_jo_chan_ComputeVol_hdr_ring,8,3
	.globl	_jo_chan_ComputeVol_data_ring   ; @jo_chan_ComputeVol_data_ring
.zerofill __DATA,__common,_jo_chan_ComputeVol_data_ring,8,3
	.globl	_jo_chan_ComputeVol_write       ; @jo_chan_ComputeVol_write
.zerofill __DATA,__common,_jo_chan_ComputeVol_write,8,3
	.globl	_jo_chan_ComputeExposure_hdr_ring ; @jo_chan_ComputeExposure_hdr_ring
.zerofill __DATA,__common,_jo_chan_ComputeExposure_hdr_ring,8,3
	.globl	_jo_chan_ComputeExposure_data_ring ; @jo_chan_ComputeExposure_data_ring
.zerofill __DATA,__common,_jo_chan_ComputeExposure_data_ring,8,3
	.globl	_jo_chan_ComputeExposure_write  ; @jo_chan_ComputeExposure_write
.zerofill __DATA,__common,_jo_chan_ComputeExposure_write,8,3
	.globl	_jo_chan_ComputePnL_hdr_ring    ; @jo_chan_ComputePnL_hdr_ring
.zerofill __DATA,__common,_jo_chan_ComputePnL_hdr_ring,8,3
	.globl	_jo_chan_ComputePnL_data_ring   ; @jo_chan_ComputePnL_data_ring
.zerofill __DATA,__common,_jo_chan_ComputePnL_data_ring,8,3
	.globl	_jo_chan_ComputePnL_write       ; @jo_chan_ComputePnL_write
.zerofill __DATA,__common,_jo_chan_ComputePnL_write,8,3
	.globl	_jo_chan_ComputeRisk_ret_hdr_ring ; @jo_chan_ComputeRisk_ret_hdr_ring
.zerofill __DATA,__common,_jo_chan_ComputeRisk_ret_hdr_ring,8,3
	.globl	_jo_chan_ComputeRisk_ret_data_ring ; @jo_chan_ComputeRisk_ret_data_ring
.zerofill __DATA,__common,_jo_chan_ComputeRisk_ret_data_ring,8,3
	.globl	_jo_chan_ComputeRisk_ret_write  ; @jo_chan_ComputeRisk_ret_write
.zerofill __DATA,__common,_jo_chan_ComputeRisk_ret_write,8,3
	.globl	_jo_chan_ComputeRisk_ret_read   ; @jo_chan_ComputeRisk_ret_read
.zerofill __DATA,__common,_jo_chan_ComputeRisk_ret_read,8,3
	.globl	_jo_chan_ComputeGreeks_ret_hdr_ring ; @jo_chan_ComputeGreeks_ret_hdr_ring
.zerofill __DATA,__common,_jo_chan_ComputeGreeks_ret_hdr_ring,8,3
	.globl	_jo_chan_ComputeGreeks_ret_data_ring ; @jo_chan_ComputeGreeks_ret_data_ring
.zerofill __DATA,__common,_jo_chan_ComputeGreeks_ret_data_ring,8,3
	.globl	_jo_chan_ComputeGreeks_ret_write ; @jo_chan_ComputeGreeks_ret_write
.zerofill __DATA,__common,_jo_chan_ComputeGreeks_ret_write,8,3
	.globl	_jo_chan_ComputeGreeks_ret_read ; @jo_chan_ComputeGreeks_ret_read
.zerofill __DATA,__common,_jo_chan_ComputeGreeks_ret_read,8,3
	.globl	_jo_chan_ComputeMargin_ret_hdr_ring ; @jo_chan_ComputeMargin_ret_hdr_ring
.zerofill __DATA,__common,_jo_chan_ComputeMargin_ret_hdr_ring,8,3
	.globl	_jo_chan_ComputeMargin_ret_data_ring ; @jo_chan_ComputeMargin_ret_data_ring
.zerofill __DATA,__common,_jo_chan_ComputeMargin_ret_data_ring,8,3
	.globl	_jo_chan_ComputeMargin_ret_write ; @jo_chan_ComputeMargin_ret_write
.zerofill __DATA,__common,_jo_chan_ComputeMargin_ret_write,8,3
	.globl	_jo_chan_ComputeMargin_ret_read ; @jo_chan_ComputeMargin_ret_read
.zerofill __DATA,__common,_jo_chan_ComputeMargin_ret_read,8,3
	.globl	_jo_chan_ComputeVol_ret_hdr_ring ; @jo_chan_ComputeVol_ret_hdr_ring
.zerofill __DATA,__common,_jo_chan_ComputeVol_ret_hdr_ring,8,3
	.globl	_jo_chan_ComputeVol_ret_data_ring ; @jo_chan_ComputeVol_ret_data_ring
.zerofill __DATA,__common,_jo_chan_ComputeVol_ret_data_ring,8,3
	.globl	_jo_chan_ComputeVol_ret_write   ; @jo_chan_ComputeVol_ret_write
.zerofill __DATA,__common,_jo_chan_ComputeVol_ret_write,8,3
	.globl	_jo_chan_ComputeVol_ret_read    ; @jo_chan_ComputeVol_ret_read
.zerofill __DATA,__common,_jo_chan_ComputeVol_ret_read,8,3
	.globl	_jo_chan_ComputeExposure_ret_hdr_ring ; @jo_chan_ComputeExposure_ret_hdr_ring
.zerofill __DATA,__common,_jo_chan_ComputeExposure_ret_hdr_ring,8,3
	.globl	_jo_chan_ComputeExposure_ret_data_ring ; @jo_chan_ComputeExposure_ret_data_ring
.zerofill __DATA,__common,_jo_chan_ComputeExposure_ret_data_ring,8,3
	.globl	_jo_chan_ComputeExposure_ret_write ; @jo_chan_ComputeExposure_ret_write
.zerofill __DATA,__common,_jo_chan_ComputeExposure_ret_write,8,3
	.globl	_jo_chan_ComputeExposure_ret_read ; @jo_chan_ComputeExposure_ret_read
.zerofill __DATA,__common,_jo_chan_ComputeExposure_ret_read,8,3
	.globl	_jo_chan_ComputePnL_ret_hdr_ring ; @jo_chan_ComputePnL_ret_hdr_ring
.zerofill __DATA,__common,_jo_chan_ComputePnL_ret_hdr_ring,8,3
	.globl	_jo_chan_ComputePnL_ret_data_ring ; @jo_chan_ComputePnL_ret_data_ring
.zerofill __DATA,__common,_jo_chan_ComputePnL_ret_data_ring,8,3
	.globl	_jo_chan_ComputePnL_ret_write   ; @jo_chan_ComputePnL_ret_write
.zerofill __DATA,__common,_jo_chan_ComputePnL_ret_write,8,3
	.globl	_jo_chan_ComputePnL_ret_read    ; @jo_chan_ComputePnL_ret_read
.zerofill __DATA,__common,_jo_chan_ComputePnL_ret_read,8,3
	.globl	_jo_chan_ComputeRisk_drop_count ; @jo_chan_ComputeRisk_drop_count
.zerofill __DATA,__common,_jo_chan_ComputeRisk_drop_count,8,3
	.globl	_jo_chan_ComputeGreeks_drop_count ; @jo_chan_ComputeGreeks_drop_count
.zerofill __DATA,__common,_jo_chan_ComputeGreeks_drop_count,8,3
	.globl	_jo_chan_ComputeMargin_drop_count ; @jo_chan_ComputeMargin_drop_count
.zerofill __DATA,__common,_jo_chan_ComputeMargin_drop_count,8,3
	.globl	_jo_chan_ComputeVol_drop_count  ; @jo_chan_ComputeVol_drop_count
.zerofill __DATA,__common,_jo_chan_ComputeVol_drop_count,8,3
	.globl	_jo_chan_ComputeExposure_drop_count ; @jo_chan_ComputeExposure_drop_count
.zerofill __DATA,__common,_jo_chan_ComputeExposure_drop_count,8,3
	.globl	_jo_chan_ComputePnL_drop_count  ; @jo_chan_ComputePnL_drop_count
.zerofill __DATA,__common,_jo_chan_ComputePnL_drop_count,8,3
.subsections_via_symbols
