	.cpu arm7tdmi
	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #1
	push	{r10, fp}
	mov	r1, #16
	mov	r10, #160
	mov	fp, #96
	ldr	r3, .L4
	str	r2, [r3, #16]
	str	r2, [r3, #100]
	str	r2, [r3, #116]
	str	r2, [r3, #160]
	str	r2, [r3, #264]
	mov	r2, #0
	mov	ip, #2
	mov	r0, #32
	stm	r3, {r10-fp}
	str	r1, [r3, #24]
	mov	r10, #224
	mov	fp, #96
	str	r1, [r3, #168]
	mov	r1, #10
	str	r2, [r3, #68]
	str	r2, [r3, #132]
	str	r2, [r3, #120]
	str	r2, [r3, #52]
	str	r2, [r3, #108]
	str	r2, [r3, #244]
	str	r2, [r3, #212]
	str	r2, [r3, #276]
	str	r2, [r3, #196]
	str	r2, [r3, #252]
	ldr	r2, .L4+4
	str	r10, [r3, #144]
	str	fp, [r3, #148]
	str	ip, [r3, #20]
	str	ip, [r3, #164]
	str	r0, [r3, #28]
	str	r1, [r3, #112]
	str	r0, [r3, #172]
	str	r1, [r3, #256]
	str	r2, [r3, #80]
	str	r2, [r3, #224]
	pop	{r10, fp}
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.word	1100
	.size	initGame, .-initGame
	.align	2
	.global	changeCharacters
	.syntax unified
	.arm
	.type	changeCharacters, %function
changeCharacters:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L18
	ldr	r3, [r4, #116]
	cmp	r3, #1
	sub	sp, sp, #12
	beq	.L13
.L7:
	ldr	r0, [r4, #260]
	cmp	r0, #0
	beq	.L14
	cmp	r0, #3
	beq	.L15
.L9:
	cmp	r0, #2
	beq	.L16
.L10:
	cmp	r0, #4
	beq	.L17
.L11:
	ldr	r3, .L18+4
	ldrh	r2, [r3, #6]
	ldrh	r3, [r3, #38]
	str	r2, [r4, #124]
	str	r3, [r4, #268]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L14:
	ldr	r0, .L18+8
	ldr	ip, .L18+12
	mov	r3, #8192
	ldr	r2, .L18+16
	ldr	r1, .L18+20
	str	r0, [r4, #272]
	mov	r0, #3
	mov	r5, ip
	mov	lr, pc
	bx	ip
	mov	r0, #3
	mov	r3, #16
	ldr	r2, .L18+24
	ldr	r1, .L18+28
	mov	lr, pc
	bx	r5
	ldr	r0, [r4, #260]
	cmp	r0, #3
	bne	.L9
.L15:
	ldr	r1, .L18+32
	mov	r3, #8192
	ldr	r2, .L18+16
	str	r1, [r4, #272]
	ldr	r5, .L18+12
	ldr	r1, .L18+36
	str	r0, [sp, #4]
	mov	lr, pc
	bx	r5
	ldr	r0, [sp, #4]
	mov	r3, #16
	ldr	r2, .L18+24
	ldr	r1, .L18+40
	mov	lr, pc
	bx	r5
	ldr	r0, [r4, #260]
	cmp	r0, #2
	bne	.L10
.L16:
	ldr	r0, .L18+32
	ldr	ip, .L18+12
	mov	r3, #8192
	ldr	r2, .L18+16
	ldr	r1, .L18+44
	str	r0, [r4, #272]
	mov	r0, #3
	mov	r5, ip
	mov	lr, pc
	bx	ip
	mov	r0, #3
	mov	r3, #16
	ldr	r2, .L18+24
	ldr	r1, .L18+48
	mov	lr, pc
	bx	r5
	ldr	r0, [r4, #260]
	cmp	r0, #4
	bne	.L11
.L17:
	ldr	r0, .L18+32
	ldr	ip, .L18+12
	str	r0, [r4, #272]
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L18+16
	ldr	r1, .L18+52
	mov	r5, ip
	mov	lr, pc
	bx	ip
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L18+24
	ldr	r1, .L18+56
	mov	lr, pc
	bx	r5
	b	.L11
.L13:
	ldr	r0, .L18+32
	ldr	ip, .L18+12
	str	r0, [r4, #128]
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L18+60
	ldr	r1, .L18+64
	mov	r5, ip
	mov	lr, pc
	bx	ip
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L18+4
	ldr	r1, .L18+68
	mov	lr, pc
	bx	r5
	b	.L7
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.word	83886592
	.word	dummyMovelist
	.word	DMANow
	.word	100745216
	.word	dummySheetTiles
	.word	83886624
	.word	dummySheetPal
	.word	changmoMovelist
	.word	gingerSheetTiles
	.word	gingerSheetPal
	.word	neonSheetTiles
	.word	neonSheetPal
	.word	nujaSheetTiles
	.word	nujaSheetPal
	.word	100728832
	.word	changmoSheetTiles
	.word	changmoSheetPal
	.size	changeCharacters, .-changeCharacters
	.align	2
	.global	checkPosition
	.syntax unified
	.arm
	.type	checkPosition, %function
checkPosition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L23
	ldr	r1, [r3]
	ldr	r2, [r3, #144]
	cmp	r1, r2
	bge	.L21
	mov	r1, #1
	mov	r2, #0
	str	r1, [r3, #100]
	str	r2, [r3, #244]
	bx	lr
.L21:
	movgt	r1, #0
	movgt	r2, #1
	strgt	r1, [r3, #100]
	strgt	r2, [r3, #244]
	bx	lr
.L24:
	.align	2
.L23:
	.word	.LANCHOR0
	.size	checkPosition, .-checkPosition
	.align	2
	.global	drawPortraits
	.syntax unified
	.arm
	.type	drawPortraits, %function
drawPortraits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #0
	mov	r4, #16384
	mov	ip, #448
	mov	r0, #5056
	ldr	r3, .L27
	ldr	lr, .L27+4
	add	r2, r3, #1016
	strh	r4, [r2, #2]	@ movhi
	strh	r1, [r2]	@ movhi
	add	r2, r3, #1008
	strh	r1, [r2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	add	r2, r3, #1012
	add	r3, r3, #1020
	strh	ip, [r3]	@ movhi
	strh	r0, [r2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	shadowOAM
	.word	20704
	.size	drawPortraits, .-drawPortraits
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L77
	push	{r4, lr}
	ldr	r2, [r3, #120]
	ldr	r4, .L77+4
	lsl	r0, r2, #3
	add	r1, r4, r2, lsl #3
	ldr	r2, [r3, #8]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	ip, r2, lsl #17
	mvn	ip, ip, lsr #17
	ldr	lr, [r3, #100]
	cmp	lr, #0
	orreq	r2, r2, #36864
	strh	ip, [r1, #2]	@ movhi
	strheq	r2, [r1, #2]	@ movhi
	ldr	r1, [r3, #52]
	ldrb	lr, [r3, #4]	@ zero_extendqisi2
	cmp	r1, #0
	strh	lr, [r4, r0]	@ movhi
	beq	.L31
	mov	r2, #140
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
.L32:
	ldr	r2, [r3, #96]
	cmp	r2, #0
	ble	.L58
	add	r2, r2, #1
	cmp	r2, #3
	mov	r0, #31
	movgt	r2, #0
	ldr	r1, .L77+8
	pop	{r4, lr}
	strh	r0, [r1, #6]	@ movhi
	str	r2, [r3, #96]
	bx	lr
.L31:
	ldr	ip, [r3, #48]
	cmp	ip, #0
	ldr	r1, [r3, #68]
	beq	.L33
	mov	r2, #12
	add	r0, r4, r0
	cmp	r1, #0
	strh	r2, [r0, #4]	@ movhi
	beq	.L32
	ldr	r2, [r3, #132]
	cmp	r2, #0
	beq	.L32
	ldr	r1, [r3, #76]
	cmp	r1, #5
	beq	.L76
	cmp	r1, #2
	bne	.L32
	ldr	ip, [r3, #72]
	ldr	r1, [r2, #8]
	cmp	ip, r1
	ble	.L38
	ldr	r2, [r2]
	add	r1, r1, r2
	cmp	ip, r1
	movle	r2, #148
	strhle	r2, [r0, #4]	@ movhi
	ble	.L32
.L38:
	mov	r2, #144
	strh	r2, [r0, #4]	@ movhi
	b	.L32
.L33:
	cmp	r1, #0
	beq	.L39
	ldr	r1, [r3, #132]
	cmp	r1, #0
	beq	.L39
	ldr	r2, [r3, #76]
	ldr	ip, .L77+12
	sub	r2, r2, #1
	cmp	r2, #9
	bhi	.L32
	ldrsb	r2, [ip, r2]
	add	pc, pc, r2, lsl #2
.Lrtx41:
	nop
	.section	.rodata
.L41:
	.byte	(.L44-.Lrtx41-4)/4
	.byte	(.L32-.Lrtx41-4)/4
	.byte	(.L32-.Lrtx41-4)/4
	.byte	(.L43-.Lrtx41-4)/4
	.byte	(.L32-.Lrtx41-4)/4
	.byte	(.L32-.Lrtx41-4)/4
	.byte	(.L42-.Lrtx41-4)/4
	.byte	(.L32-.Lrtx41-4)/4
	.byte	(.L32-.Lrtx41-4)/4
	.byte	(.L40-.Lrtx41-4)/4
	.text
	.p2align 2
.L58:
	ldr	r2, .L77+8
	ldr	r3, [r3, #124]
	pop	{r4, lr}
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L39:
	ldr	r1, [r3, #104]
	cmp	r1, #0
	ldrne	r2, [r3, #108]
	lslne	r2, r2, #2
	addne	r0, r4, r0
	andne	r2, r2, #1020
	addeq	r2, r4, r0
	strhne	r2, [r0, #4]	@ movhi
	strheq	r1, [r2, #4]	@ movhi
	b	.L32
.L40:
	ldr	r2, [r3, #72]
	ldr	ip, [r1, #8]
	cmp	r2, ip
	bgt	.L51
	cmp	r2, #4
	bgt	.L52
	ldr	r2, .L77+16
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L32
.L42:
	ldr	r2, [r1, #8]
	ldr	ip, [r3, #72]
	cmp	ip, r2
	movle	r2, #272
	movgt	r2, #276
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L32
.L43:
	ldr	ip, [r3, #72]
	ldr	r2, [r1, #8]
	cmp	ip, r2
	ble	.L48
	ldr	r1, [r1]
	add	r2, r2, r1
	cmp	ip, r2
	bgt	.L48
	mov	r2, #28
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L32
.L44:
	ldr	ip, [r3, #72]
	ldr	r2, [r1, #8]
	cmp	ip, r2
	ble	.L46
	ldr	r1, [r1]
	add	r2, r2, r1
	cmp	ip, r2
	bgt	.L46
	mov	r2, #20
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L32
.L76:
	ldr	ip, [r3, #72]
	ldr	r1, [r2, #8]
	cmp	ip, r1
	ble	.L36
	ldr	r2, [r2]
	add	r1, r1, r2
	cmp	ip, r1
	movle	r2, #156
	strhle	r2, [r0, #4]	@ movhi
	ble	.L32
.L36:
	mov	r2, #152
	strh	r2, [r0, #4]	@ movhi
	b	.L32
.L48:
	mov	r2, #24
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L32
.L46:
	mov	r2, #16
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L32
.L51:
	ldr	r1, [r1]
	add	r1, ip, r1
	cmp	r2, r1
	bgt	.L55
	add	ip, ip, #10
	cmp	r2, ip
	ldrle	r2, .L77+20
	ldrgt	r2, .L77+24
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L32
.L52:
	cmp	r2, #8
	bgt	.L53
	ldr	r2, .L77+28
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L32
.L55:
	ldr	r2, .L77+32
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L32
.L53:
	cmp	r2, #12
	ldrle	r2, .L77+36
	ldrgt	r2, .L77+40
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L32
.L78:
	.align	2
.L77:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	83886592
	.word	.L41
	.word	386
	.word	402
	.word	406
	.word	390
	.word	410
	.word	394
	.word	398
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawOpp
	.syntax unified
	.arm
	.type	drawOpp, %function
drawOpp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L127
	push	{r4, lr}
	ldr	r2, [r3, #264]
	ldr	r4, .L127+4
	lsl	r0, r2, #3
	add	r1, r4, r2, lsl #3
	ldr	r2, [r3, #152]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	ip, r2, lsl #17
	mvn	ip, ip, lsr #17
	ldr	lr, [r3, #244]
	cmp	lr, #0
	orreq	r2, r2, #36864
	strh	ip, [r1, #2]	@ movhi
	strheq	r2, [r1, #2]	@ movhi
	ldr	r1, [r3, #196]
	ldrb	lr, [r3, #148]	@ zero_extendqisi2
	cmp	r1, #0
	strh	lr, [r4, r0]	@ movhi
	beq	.L81
	ldr	r2, .L127+8
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
.L82:
	ldr	r2, [r3, #240]
	cmp	r2, #0
	ble	.L108
	add	r2, r2, #1
	cmp	r2, #3
	mov	r0, #31
	movgt	r2, #0
	ldr	r1, .L127+12
	pop	{r4, lr}
	strh	r0, [r1, #38]	@ movhi
	str	r2, [r3, #240]
	bx	lr
.L81:
	ldr	ip, [r3, #192]
	cmp	ip, #0
	ldr	r1, [r3, #212]
	beq	.L83
	ldr	r2, .L127+16
	add	r0, r4, r0
	cmp	r1, #0
	strh	r2, [r0, #4]	@ movhi
	beq	.L82
	ldr	r2, [r3, #276]
	cmp	r2, #0
	beq	.L82
	ldr	r1, [r3, #220]
	cmp	r1, #5
	beq	.L126
	cmp	r1, #2
	bne	.L82
	ldr	ip, [r3, #216]
	ldr	r1, [r2, #8]
	cmp	ip, r1
	ble	.L88
	ldr	r2, [r2]
	add	r1, r1, r2
	cmp	ip, r1
	bgt	.L88
	ldr	r2, .L127+20
	strh	r2, [r0, #4]	@ movhi
	b	.L82
.L83:
	cmp	r1, #0
	beq	.L89
	ldr	r1, [r3, #276]
	cmp	r1, #0
	beq	.L89
	ldr	r2, [r3, #220]
	ldr	ip, .L127+24
	sub	r2, r2, #1
	cmp	r2, #9
	bhi	.L82
	ldrsb	r2, [ip, r2]
	add	pc, pc, r2, lsl #2
.Lrtx91:
	nop
	.section	.rodata
.L91:
	.byte	(.L94-.Lrtx91-4)/4
	.byte	(.L82-.Lrtx91-4)/4
	.byte	(.L82-.Lrtx91-4)/4
	.byte	(.L93-.Lrtx91-4)/4
	.byte	(.L82-.Lrtx91-4)/4
	.byte	(.L82-.Lrtx91-4)/4
	.byte	(.L92-.Lrtx91-4)/4
	.byte	(.L82-.Lrtx91-4)/4
	.byte	(.L82-.Lrtx91-4)/4
	.byte	(.L90-.Lrtx91-4)/4
	.text
	.p2align 2
.L108:
	ldr	r2, .L127+12
	ldr	r3, [r3, #268]
	pop	{r4, lr}
	strh	r3, [r2, #38]	@ movhi
	bx	lr
.L89:
	ldr	r2, [r3, #248]
	cmp	r2, #0
	moveq	r1, #4608
	ldrne	r2, [r3, #252]
	addne	r2, r2, #128
	lslne	r2, r2, #2
	andne	r2, r2, #1020
	addne	r0, r4, r0
	orrne	r2, r2, #4096
	addeq	r2, r4, r0
	strhne	r2, [r0, #4]	@ movhi
	strheq	r1, [r2, #4]	@ movhi
	b	.L82
.L90:
	ldr	r2, [r3, #216]
	ldr	ip, [r1, #8]
	cmp	r2, ip
	bgt	.L101
	cmp	r2, #4
	bgt	.L102
	ldr	r2, .L127+28
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L82
.L93:
	ldr	ip, [r3, #216]
	ldr	r2, [r1, #8]
	cmp	ip, r2
	ble	.L98
	ldr	r1, [r1]
	add	r2, r2, r1
	cmp	ip, r2
	bgt	.L98
	ldr	r2, .L127+32
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L82
.L94:
	ldr	ip, [r3, #216]
	ldr	r2, [r1, #8]
	cmp	ip, r2
	ble	.L96
	ldr	r1, [r1]
	add	r2, r2, r1
	cmp	ip, r2
	bgt	.L96
	ldr	r2, .L127+36
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L82
.L92:
	ldr	r2, [r1, #8]
	ldr	ip, [r3, #216]
	cmp	ip, r2
	ldrle	r2, .L127+40
	ldrgt	r2, .L127+44
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L82
.L126:
	ldr	ip, [r3, #216]
	ldr	r1, [r2, #8]
	cmp	ip, r1
	bgt	.L85
	ldr	r2, [r3, #120]
	ldr	r1, .L127+48
	add	r2, r4, r2, lsl #3
	strh	r1, [r2, #4]	@ movhi
	b	.L82
.L85:
	ldr	r2, [r2]
	add	r1, r1, r2
	cmp	ip, r1
	ldrle	r2, .L127+52
	ldrgt	r2, .L127+48
	strh	r2, [r0, #4]	@ movhi
	b	.L82
.L88:
	ldr	r2, .L127+56
	strh	r2, [r0, #4]	@ movhi
	b	.L82
.L98:
	ldr	r2, .L127+60
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L82
.L96:
	ldr	r2, .L127+64
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L82
.L101:
	ldr	r1, [r1]
	add	r1, ip, r1
	cmp	r2, r1
	bgt	.L105
	add	ip, ip, #10
	cmp	r2, ip
	ldrle	r2, .L127+68
	ldrgt	r2, .L127+72
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L82
.L102:
	cmp	r2, #8
	bgt	.L103
	ldr	r2, .L127+76
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L82
.L105:
	ldr	r2, .L127+80
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L82
.L103:
	cmp	r2, #12
	ldrle	r2, .L127+84
	ldrgt	r2, .L127+88
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L82
.L128:
	.align	2
.L127:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	4748
	.word	83886592
	.word	4620
	.word	4756
	.word	.L91
	.word	4994
	.word	4636
	.word	4628
	.word	4880
	.word	4884
	.word	4760
	.word	4764
	.word	4752
	.word	4632
	.word	4624
	.word	5010
	.word	5014
	.word	4998
	.word	5018
	.word	5002
	.word	5006
	.size	drawOpp, .-drawOpp
	.align	2
	.global	updateCamera
	.syntax unified
	.arm
	.type	updateCamera, %function
updateCamera:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L130
	ldr	r1, [r2, #144]
	ldr	r0, [r2]
	ldr	ip, [r2, #24]
	add	r3, r1, r0
	add	r3, r3, ip
	add	r3, r3, r3, lsr #31
	asr	r3, r3, #1
	sub	r3, r3, #120
	cmp	r3, #176
	movge	r3, #176
	bic	r3, r3, r3, asr #31
	sub	r0, r0, r3
	sub	r1, r1, r3
	str	r3, [r2, #284]
	str	r0, [r2, #8]
	str	r1, [r2, #152]
	bx	lr
.L131:
	.align	2
.L130:
	.word	.LANCHOR0
	.size	updateCamera, .-updateCamera
	.align	2
	.global	spawnHitbox
	.syntax unified
	.arm
	.type	spawnHitbox, %function
spawnHitbox:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, [r1, #28]
	sub	sp, sp, #20
	str	r3, [sp, #12]
	ldr	r3, [r1, #24]
	str	r3, [sp, #8]
	ldr	r3, [r1, #40]
	str	r3, [sp, #4]
	ldr	r3, [r1, #32]
	str	r3, [sp]
	mov	r4, r0
	ldr	r3, [r0, #48]
	mov	r7, r2
	add	r0, r0, #36
	ldr	r2, [r0, #16]
	mov	r5, r1
	ldr	r6, .L144
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L132
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L132
	ldr	r1, [r5, #56]
	ldr	r3, [r4, #24]
	cmp	r1, r3
	ldr	r2, [r7, #84]
	beq	.L134
	sub	r0, r3, #3
	rsbs	r3, r0, #0
	adc	r3, r3, r0
	cmp	r1, #0
	moveq	r3, #0
	cmp	r3, #0
	bne	.L134
	mov	r1, #1
	ldr	r0, [r4, #20]
	ldr	r3, [r5, #80]
	cmp	r2, #99
	sub	r3, r3, r0
	addle	r2, r2, #10
	str	r3, [r5, #80]
	str	r1, [r5, #96]
	str	r1, [r4, #32]
	strle	r2, [r7, #84]
	ldr	r3, [r5, #84]
	cmp	r3, #99
	addle	r3, r3, #5
	strle	r3, [r5, #84]
	ldr	r3, .L144+4
	ldr	r1, [r3]
	mov	r2, #0
	ldr	r0, .L144+8
	ldr	r3, .L144+12
	sub	r1, r1, #25
	mov	lr, pc
	bx	r3
.L137:
	str	r4, [r5, #136]
.L132:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L134:
	mov	r3, #1
	str	r3, [r5, #60]
	str	r3, [r4, #32]
	ldr	r3, .L144+16
	cmp	r2, #99
	ldr	r1, [r3]
	addle	r2, r2, #5
	strle	r2, [r7, #84]
	ldr	r0, .L144+20
	mov	r2, #0
	ldr	r3, .L144+12
	sub	r1, r1, #25
	mov	lr, pc
	bx	r3
	b	.L137
.L145:
	.align	2
.L144:
	.word	collision
	.word	hit_length
	.word	hit_data
	.word	playSoundB
	.word	block_length
	.word	block_data
	.size	spawnHitbox, .-spawnHitbox
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L239
	ldrh	lr, [r6]
	tst	lr, #4
	sub	sp, sp, #16
	bne	.L222
	ldr	r4, .L239+4
.L147:
	mov	r3, #0
	ldr	r2, [r4, #100]
	ldr	r0, [r4]
	cmp	r2, #1
	ldr	r2, [r4, #24]
	addne	r0, r0, #16
	ldr	r1, [r4, #4]
	ldr	r7, [r4, #28]
	add	ip, r2, r0
	sub	ip, ip, #1
	str	r3, [r4, #104]
	str	r3, [r4, #56]
	ldr	r3, [r4, #68]
	str	ip, [r4, #36]
	add	ip, r1, r7
	cmp	r3, #0
	sub	r3, ip, #1
	str	r0, [r4, #32]
	str	r1, [r4, #40]
	str	r3, [r4, #44]
	beq	.L224
	ldr	r5, .L239+8
.L149:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	bne	.L165
.L232:
	ldr	r3, [r4, #68]
.L178:
	ldr	r2, [r4, #104]
	cmp	r2, #0
	streq	r2, [r4, #108]
	beq	.L182
	ldr	r2, [r4, #112]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r4, #112]
	bne	.L182
	ldr	r1, [r4, #108]
	ldr	r2, .L239+12
	add	r1, r1, #1
	smull	r0, r2, r1, r2
	sub	r2, r2, r1, asr #31
	add	r2, r2, r2, lsl #1
	sub	r1, r1, r2
	mov	r2, #10
	str	r1, [r4, #108]
	str	r2, [r4, #112]
.L182:
	cmp	r3, #0
	streq	r3, [r4, #72]
	bne	.L177
.L185:
	add	r2, r4, #28
	ldr	r1, [r4, #4]
	ldm	r2, {r2, r3}
	add	r2, r1, r2
	add	r3, r3, r2, lsl #9
	ldrb	r3, [r5, r3]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	ldreq	r3, [r4, #20]
	addeq	r3, r3, r1
	streq	r3, [r4, #4]
	strne	r3, [r4, #52]
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L165:
	ldr	r3, [r4, #100]
	cmp	r3, #1
	beq	.L233
	cmp	r3, #0
	streq	r3, [r4, #60]
	b	.L232
.L224:
	ldr	r8, [r4, #60]
	ldr	r5, [r4, #48]
	orrs	r5, r8, r5
	beq	.L225
	ldr	r5, .L239+8
.L150:
	cmp	r8, #0
	bne	.L165
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L232
	ldr	r3, .L239+16
	ldrh	r3, [r3]
	and	r2, r3, #128
	rsbs	r1, r2, #1
	movcc	r1, #0
	cmp	r2, #0
	str	r1, [r4, #48]
	bne	.L232
	ldr	r2, [r4, #100]
	cmp	r2, #1
	beq	.L234
	cmp	r2, #0
	bne	.L171
	tst	r3, #16
	bne	.L170
.L172:
	mov	r2, #2
	str	r2, [r4, #56]
.L171:
	ldrh	r2, [r6]
	tst	r2, #1
	beq	.L173
	ands	r0, r3, #1
	bne	.L173
	mov	r1, #1
	str	r1, [r4, #68]
	mov	r1, #2
	str	r1, [r4, #76]
	ldr	r1, [r4, #128]
	str	r0, [r1, #144]
	add	r1, r1, #112
	str	r1, [r4, #132]
.L173:
	tst	r2, #2
	beq	.L232
	ands	r3, r3, #2
	bne	.L232
	mov	r0, #1
	mov	r1, #5
	ldr	r2, [r4, #128]
	str	r3, [r2, #200]
	ldr	r3, [r4, #104]
	add	r2, r2, #168
	cmp	r3, #0
	str	r2, [r4, #132]
	str	r0, [r4, #68]
	str	r1, [r4, #76]
	streq	r3, [r4, #108]
	beq	.L177
	ldr	r3, [r4, #112]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #112]
	bne	.L177
	mov	r1, #10
	ldr	r2, [r4, #108]
	ldr	r3, .L239+12
	add	r2, r2, #1
	smull	r0, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	sub	r2, r2, r3
	str	r2, [r4, #108]
	str	r1, [r4, #112]
.L177:
	ldr	r0, [r4, #132]
	ldr	r3, [r4, #72]
	ldr	r2, [r0, #12]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #72]
	blt	.L184
	mov	r3, #0
	str	r3, [r4, #68]
	str	r3, [r4, #132]
	b	.L185
.L222:
	ldr	r3, .L239+16
	ldrh	r3, [r3]
	tst	r3, #4
	ldr	r4, .L239+4
	bne	.L147
	ldr	r3, [r4, #80]
	ldr	r2, .L239+20
	cmp	r3, r2
	addle	r3, r3, #100
	strle	r3, [r4, #80]
	b	.L147
.L184:
	ldr	r1, [r0, #8]
	ldr	ip, [r0]
	add	r1, r1, ip
	cmp	r3, r1
	blt	.L185
	ldr	r1, [r0, #4]
	sub	r2, r2, r1
	cmp	r3, r2
	bgt	.L185
	ldr	r2, .L239+4
	add	r1, r2, #144
	bl	spawnHitbox
	b	.L185
.L225:
	tst	lr, #64
	ldr	lr, .L239+16
	ldrh	lr, [lr]
	beq	.L230
	tst	lr, #64
	beq	.L227
.L230:
	ldr	r5, .L239+8
.L151:
	tst	lr, #32
	bne	.L152
	ldr	ip, [r4, #16]
	sub	r0, r0, ip
	add	ip, r0, r1, lsl #9
	ldrb	ip, [r5, ip]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L235
.L152:
	tst	lr, #16
	bne	.L157
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #36]
	ldr	r1, [r4, #40]
	add	r3, r2, r3
	add	r0, r3, r1, lsl #9
	ldrb	r0, [r5, r0]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L236
.L157:
	ldrh	r3, [r6]
	tst	r3, #1
	beq	.L160
	ldr	r2, .L239+16
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L160
	ldr	r2, [r4, #52]
	cmp	r2, #0
	bne	.L160
	mov	r0, #1
	ldr	r1, [r4, #128]
	str	r0, [r4, #68]
	str	r1, [r4, #132]
	str	r0, [r4, #76]
	str	r2, [r1, #32]
.L160:
	tst	r3, #2
	beq	.L161
	ldr	r2, .L239+16
	ldrh	r2, [r2]
	tst	r2, #2
	bne	.L161
	ldr	r2, [r4, #52]
	cmp	r2, #0
	bne	.L161
	mov	r1, #1
	str	r1, [r4, #68]
	mov	r1, #4
	str	r1, [r4, #76]
	ldr	r1, [r4, #128]
	add	r0, r1, #56
	str	r0, [r4, #132]
	str	r2, [r1, #88]
.L161:
	tst	r3, #256
	and	r3, r3, #512
	beq	.L162
	ldr	r2, .L239+16
	ldrh	r2, [r2]
	tst	r2, #256
	bne	.L162
	ldr	r1, [r4, #52]
	cmp	r1, #0
	bne	.L162
	cmp	r3, #0
	mov	r3, #1
	str	r3, [r4, #68]
	mov	r3, #7
	str	r3, [r4, #76]
	ldr	r3, [r4, #128]
	str	r1, [r3, #256]
	add	r3, r3, #224
	str	r3, [r4, #132]
	beq	.L149
	tst	r2, #512
	bne	.L149
.L189:
	ldr	r3, [r4, #84]
	cmp	r3, #100
	bne	.L164
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L164
	mov	r0, #1
	mov	r1, #10
	ldr	r2, [r4, #128]
	str	r3, [r2, #312]
	add	r2, r2, #280
	str	r3, [r4, #84]
	str	r2, [r4, #132]
	str	r0, [r4, #68]
	str	r1, [r4, #76]
	b	.L149
.L233:
	mov	r2, #0
	ldr	r3, [r4, #68]
	str	r2, [r4, #60]
	b	.L178
.L162:
	cmp	r3, #0
	bne	.L237
.L164:
	ldr	r3, [r4, #68]
	cmp	r3, #0
	ldr	r8, [r4, #60]
	beq	.L150
	b	.L149
.L227:
	ldr	r5, .L239+8
	add	ip, r0, ip, lsl #9
	ldrb	ip, [r5, ip]	@ zero_extendqisi2
	cmp	ip, #0
	moveq	ip, #1
	streq	ip, [r4, #52]
	subeq	ip, r1, #60
	streq	ip, [r4, #4]
	b	.L151
.L234:
	tst	r3, #32
	beq	.L172
.L170:
	mov	r2, #0
	str	r2, [r4, #56]
	b	.L171
.L236:
	ldr	r0, [r4, #44]
	add	r3, r3, r0, lsl #9
	ldrb	r7, [r5, r3]	@ zero_extendqisi2
	cmp	r7, #1
	bne	.L157
	ldr	r3, [r4, #172]
	ldr	r0, [r4, #32]
	str	r3, [sp, #12]
	ldr	r3, [r4, #168]
	str	r3, [sp, #8]
	ldr	r3, [r4, #184]
	str	r3, [sp, #4]
	ldr	r3, [r4, #176]
	str	r3, [sp]
	add	r0, r2, r0
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	ip, .L239+24
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L157
	ldr	r3, [r4, #8]
	cmp	r3, #239
	bgt	.L157
	ldr	r3, [r4, #100]
	ldr	r2, [r4, #52]
	orrs	r3, r3, r2
	moveq	r0, r7
	ldr	r3, [r4]
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	str	r7, [r4, #104]
	str	r3, [r4]
	str	r0, [r4, #56]
	b	.L157
.L235:
	add	r3, r0, r3, lsl #9
	ldrb	r3, [r5, r3]	@ zero_extendqisi2
	cmp	r3, #1
	mov	r8, r3
	bne	.L152
	ldr	ip, [r4, #172]
	str	ip, [sp, #12]
	ldr	ip, [r4, #168]
	str	ip, [sp, #8]
	ldr	ip, [r4, #184]
	str	ip, [sp, #4]
	ldr	ip, [r4, #176]
	mov	r3, r7
	str	ip, [sp]
	ldr	r7, .L239+24
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L231
	ldr	r3, [r4, #8]
	cmp	r3, #0
	ble	.L231
	ldr	r3, [r4]
	ldr	r2, [r4, #100]
	ldr	r1, [r4, #16]
	cmp	r2, #1
	sub	r3, r3, r1
	str	r8, [r4, #104]
	str	r3, [r4]
	beq	.L238
.L155:
	mov	r3, #0
	ldr	r2, .L239+16
	str	r3, [r4, #56]
	ldrh	lr, [r2]
	b	.L152
.L237:
	ldr	r3, .L239+16
	ldrh	r3, [r3]
	tst	r3, #512
	bne	.L164
	b	.L189
.L238:
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L155
	str	r2, [r4, #56]
.L231:
	ldr	r3, .L239+16
	ldrh	lr, [r3]
	b	.L152
.L240:
	.align	2
.L239:
	.word	oldButtons
	.word	.LANCHOR0
	.word	stage1CollisionBitmap
	.word	1431655766
	.word	buttons
	.word	1099
	.word	collision
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateOpp
	.syntax unified
	.arm
	.type	updateOpp, %function
updateOpp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L300
	ldr	r3, .L300+4
	sub	sp, sp, #12
	ldr	r9, [r4, #144]
	ldr	r8, [r4, #168]
	ldr	r10, [r4]
	ldr	fp, [r4, #24]
	mov	lr, pc
	bx	r3
	ldr	r6, [r4, #244]
	mov	r3, #0
	ldr	r7, [r4, #144]
	cmp	r6, #1
	moveq	ip, r7
	str	r3, [r4, #248]
	str	r3, [r4, #200]
	ldr	r3, [r4, #168]
	addne	ip, r7, #16
	add	r3, ip, r3
	sub	r3, r3, #1
	ldr	lr, [r4, #148]
	str	r3, [r4, #180]
	ldr	r3, [r4, #172]
	mov	r2, r0
	ldr	r0, [r4, #212]
	add	r3, lr, r3
	sub	r1, r3, #1
	cmp	r0, #0
	str	ip, [r4, #176]
	str	lr, [r4, #184]
	str	r1, [r4, #188]
	bne	.L243
	ldr	r5, .L300+8
	smull	r1, r5, r2, r5
	asr	r1, r2, #31
	rsb	r1, r1, r5, asr #5
	add	r1, r1, r1, lsl #2
	add	r1, r1, r1, lsl #2
	ldr	r5, [r4, #204]
	sub	r1, r2, r1, lsl #2
	ldr	r2, [r4, #192]
	str	r2, [sp, #4]
	orrs	r2, r2, r5
	ldr	r2, [r4, #288]
	bne	.L244
	add	r8, r8, r8, lsr #31
	add	r8, r9, r8, asr #1
	add	r9, fp, fp, lsr #31
	add	r9, r10, r9, asr #1
	sub	r8, r8, r9
	cmp	r8, #0
	rsblt	r8, r8, #0
	cmp	r8, #80
	ble	.L245
	cmp	r6, #0
	beq	.L297
	cmp	r6, #1
	bne	.L266
	cmp	r1, #69
	bgt	.L266
	ldr	r1, [r4, #160]
	add	r1, r1, r7
	str	r6, [r4, #248]
	str	r1, [r4, #144]
.L248:
	mov	r0, #1
.L266:
	mov	r1, #0
	str	r1, [r4, #216]
.L277:
	ldr	r1, .L300+12
	add	r3, ip, r3, lsl #9
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	ldreq	r3, [r4, #164]
	addeq	r3, r3, lr
	streq	r3, [r4, #148]
	strne	r3, [r4, #196]
	cmp	r0, #0
	beq	.L273
	ldr	r3, [r4, #256]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #256]
	bne	.L281
	ldr	r1, [r4, #252]
	ldr	r3, .L300+16
	add	r1, r1, #1
	smull	r0, r3, r1, r3
	sub	r3, r3, r1, asr #31
	add	r3, r3, r3, lsl #1
	sub	r1, r1, r3
	mov	r3, #10
	str	r1, [r4, #252]
	str	r3, [r4, #256]
	b	.L281
.L243:
	ldr	r0, [r4, #276]
.L254:
	ldr	r2, [r4, #216]
	ldr	r1, [r0, #12]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r4, #216]
	blt	.L267
	mov	r1, #0
	ldr	r2, .L300+12
	add	r3, ip, r3, lsl #9
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	cmp	r3, #1
	ldr	r5, [r4, #204]
	ldr	r2, [r4, #288]
	str	r1, [r4, #212]
	str	r1, [r4, #276]
	strne	r1, [r4, #196]
	beq	.L294
.L273:
	mov	r3, #0
	str	r3, [r4, #252]
.L281:
	cmp	r5, #0
	beq	.L282
	ldr	r3, [r4, #244]
	cmp	r3, #1
	movls	r3, #0
	strls	r3, [r4, #204]
.L282:
	cmp	r2, #1
	movlt	r2, #1
	sub	r2, r2, #1
	str	r2, [r4, #288]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L244:
	ldr	r6, [sp, #4]
	cmp	r6, #0
	beq	.L266
.L260:
	cmp	r1, #19
	movle	r1, #2
	strle	r1, [r4, #200]
	ble	.L266
.L259:
	mov	r1, #0
	str	r1, [r4, #192]
	b	.L266
.L267:
	ldr	r5, [r0, #8]
	ldr	r6, [r0]
	add	r5, r5, r6
	cmp	r2, r5
	blt	.L296
	ldr	r5, [r0, #4]
	sub	r1, r1, r5
	cmp	r2, r1
	ble	.L274
.L296:
	ldr	r2, .L300+12
	add	r3, ip, r3, lsl #9
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	cmp	r3, #1
	movne	r3, #0
	ldr	r5, [r4, #204]
	ldr	r2, [r4, #288]
	strne	r3, [r4, #196]
	bne	.L273
.L294:
	ldr	r3, [r4, #164]
	add	r3, r3, lr
	str	r3, [r4, #148]
	b	.L273
.L245:
	cmp	r8, #30
	bgt	.L298
	cmp	r8, #20
	bgt	.L266
	cmp	r1, #29
	bgt	.L255
	cmp	r2, #0
	bne	.L256
	mov	r0, #60
	mov	r1, #1
	str	r0, [r4, #288]
	ldr	r0, [r4, #272]
	str	r1, [r4, #212]
	str	r1, [r4, #220]
	str	r0, [r4, #276]
	str	r2, [r0, #32]
	b	.L254
.L274:
	ldr	r2, .L300+20
	sub	r1, r2, #144
	bl	spawnHitbox
	add	r3, r4, #172
	ldr	lr, [r4, #148]
	ldm	r3, {r3, ip}
	ldr	r0, [r4, #248]
	ldr	r5, [r4, #204]
	ldr	r2, [r4, #288]
	add	r3, lr, r3
	b	.L277
.L297:
	cmp	r1, #69
	bgt	.L266
	mov	r1, #1
	str	r1, [r4, #248]
	ldr	r1, [r4, #160]
	sub	r1, r7, r1
	str	r1, [r4, #144]
	b	.L248
.L298:
	cmp	r1, #39
	bgt	.L251
	ldr	r1, [r4, #160]
	cmp	r6, #0
	subeq	r1, r7, r1
	addne	r1, r1, r7
	str	r1, [r4, #144]
	mov	r1, #1
	str	r1, [r4, #248]
	b	.L248
.L251:
	cmp	r1, #49
	bgt	.L266
	cmp	r2, #0
	bne	.L266
	mov	r1, #1
	str	r1, [r4, #212]
	mov	r1, #4
	str	r1, [r4, #220]
	mov	r1, #60
	str	r1, [r4, #288]
	ldr	r1, [r4, #272]
	add	r0, r1, #56
	str	r0, [r4, #276]
	str	r2, [r1, #88]
	b	.L254
.L255:
	cmp	r1, #49
	movle	r1, #2
	strle	r1, [r4, #200]
	ble	.L259
	cmp	r1, #59
	bgt	.L261
	cmp	r2, #0
	bne	.L262
	mov	r1, #1
	str	r1, [r4, #212]
	mov	r1, #7
	str	r1, [r4, #220]
	mov	r1, #60
	ldr	r0, [r4, #272]
	str	r2, [r0, #256]
	add	r0, r0, #224
	str	r1, [r4, #288]
	str	r0, [r4, #276]
	b	.L254
.L256:
	mov	r6, #1
	str	r6, [r4, #192]
	mov	r6, #2
	str	r6, [r4, #200]
	b	.L260
.L261:
	cmp	r1, #64
	ble	.L299
	cmp	r1, #79
	bgt	.L266
.L262:
	mov	r0, #1
	ldr	r1, [r4, #160]
	cmp	r6, #0
	addeq	r7, r1, r7
	subne	r7, r7, r1
	str	r7, [r4, #144]
	str	r0, [r4, #248]
	b	.L266
.L299:
	ldr	r1, [r4, #228]
	cmp	r1, #100
	bne	.L262
	cmp	r2, #0
	bne	.L262
	mov	r1, #1
	str	r1, [r4, #212]
	mov	r1, #10
	str	r1, [r4, #220]
	mov	r1, #60
	ldr	r0, [r4, #272]
	str	r2, [r0, #312]
	add	r0, r0, #280
	str	r2, [r4, #228]
	str	r1, [r4, #288]
	str	r0, [r4, #276]
	b	.L254
.L301:
	.align	2
.L300:
	.word	.LANCHOR0
	.word	rand
	.word	1374389535
	.word	stage1CollisionBitmap
	.word	1431655766
	.word	.LANCHOR0+144
	.size	updateOpp, .-updateOpp
	.align	2
	.global	calculateAttackHitboxes
	.syntax unified
	.arm
	.type	calculateAttackHitboxes, %function
calculateAttackHitboxes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L312
	ldr	ip, [r3, #132]
	ldr	r0, [r3, #40]
	ldr	r1, [ip, #44]
	ldr	r2, [r3, #276]
	add	r0, r0, r1
	ldr	r1, [r3, #184]
	str	r0, [ip, #40]
	ldr	r0, [r2, #44]
	add	r1, r1, r0
	ldr	r0, [r3, #68]
	cmp	r0, #0
	str	r1, [r2, #40]
	beq	.L303
	ldr	r1, [r3, #100]
	cmp	r1, #1
	beq	.L310
	cmp	r1, #0
	ldreq	r1, [r3, #32]
	ldreq	r0, [ip, #52]
	subeq	r1, r1, r0
	streq	r1, [ip, #36]
.L303:
	ldr	r1, [r3, #244]
	cmp	r1, #1
	beq	.L311
	cmp	r1, #0
	ldreq	r3, [r3, #176]
	ldreq	r1, [r2, #52]
	subeq	r3, r3, r1
	streq	r3, [r2, #36]
	bx	lr
.L311:
	ldr	r3, [r3, #180]
	str	r3, [r2, #36]
	bx	lr
.L310:
	ldr	r1, [r3, #36]
	str	r1, [ip, #36]
	b	.L303
.L313:
	.align	2
.L312:
	.word	.LANCHOR0
	.size	calculateAttackHitboxes, .-calculateAttackHitboxes
	.align	2
	.global	updateHealthbars
	.syntax unified
	.arm
	.type	updateHealthbars, %function
updateHealthbars:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r2, .L338
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L338+4
	ldr	r6, .L338+8
	ldr	r5, [r2, #80]
	ldr	r4, [r2, #224]
	ldr	r0, .L338+12
	str	r1, [r6, #68]
	mov	r2, #22
	ldr	r7, .L338+16
	str	r1, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	strh	r1, [r3, #20]	@ movhi
	mov	lr, pc
	bx	r7
	cmp	r5, #0
	ble	.L316
	mov	r3, #44
	ldr	ip, .L338+20
	ldr	r0, .L338+24
	b	.L315
.L336:
	ldr	r1, .L338+28
	sub	r5, r5, #50
.L318:
	lsl	r2, r3, #1
	cmp	r5, #0
	strh	r1, [r6, r2]	@ movhi
	sub	r3, r3, #1
	beq	.L316
.L315:
	cmp	r5, #99
	movgt	r1, r0
	subgt	r5, r5, #100
	bgt	.L318
	cmp	r5, #74
	movgt	r1, ip
	subgt	r5, r5, #75
	bgt	.L318
	cmp	r5, #49
	bgt	.L336
	cmp	r5, #24
	ldrgt	r1, .L338+32
	subgt	r5, r5, #25
	bgt	.L318
.L321:
	mov	r1, #8192
	ldr	r2, .L338+8
	lsl	r3, r3, #1
	strh	r1, [r2, r3]	@ movhi
.L316:
	cmp	r4, #0
	ble	.L314
	mov	r3, #49
	ldr	lr, .L338+36
	ldr	ip, .L338+40
	ldr	r0, .L338+8
	b	.L323
.L337:
	ldr	r1, .L338+44
	sub	r4, r4, #50
.L326:
	lsl	r2, r3, #1
	cmp	r4, #0
	strh	r1, [r0, r2]	@ movhi
	add	r3, r3, #1
	beq	.L314
.L323:
	cmp	r4, #99
	movgt	r1, ip
	subgt	r4, r4, #100
	bgt	.L326
	cmp	r4, #74
	movgt	r1, lr
	subgt	r4, r4, #75
	bgt	.L326
	cmp	r4, #49
	bgt	.L337
	cmp	r4, #24
	ldrgt	r1, .L338+48
	subgt	r4, r4, #25
	bgt	.L326
.L329:
	mov	r1, #9216
	ldr	r2, .L338+8
	lsl	r3, r3, #1
	strh	r1, [r2, r3]	@ movhi
.L314:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L339:
	.align	2
.L338:
	.word	.LANCHOR0
	.word	100720708
	.word	100720640
	.word	100720738
	.word	memset
	.word	8386
	.word	8354
	.word	8418
	.word	8450
	.word	9410
	.word	9378
	.word	9442
	.word	9474
	.size	updateHealthbars, .-updateHealthbars
	.align	2
	.global	updateSupers
	.syntax unified
	.arm
	.type	updateSupers, %function
updateSupers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L356
	ldr	r2, [r1, #84]
	cmp	r2, #100
	movgt	r3, #100
	push	{r4, r5, r6, lr}
	movgt	r2, r3
	strgt	r3, [r1, #84]
	ldr	r3, [r1, #228]
	cmp	r3, #100
	movgt	r0, #100
	movgt	r3, r0
	strgt	r0, [r1, #228]
	ldr	r5, .L356+4
	ldr	r1, .L356+8
	ldr	r6, .L356+12
	ldr	r4, .L356+16
	ldr	lr, .L356+20
.L344:
	cmp	r2, #19
	movgt	ip, r5
	bgt	.L343
	cmp	r2, #9
	movgt	ip, #8384
	bgt	.L343
	cmp	r2, #4
	movgt	ip, r6
	movle	ip, #8192
.L343:
	lsl	r0, r1, #1
	add	r1, r1, #1
	cmp	r1, lr
	strh	ip, [r4, r0]	@ movhi
	sub	r2, r2, #20
	bne	.L344
	mov	r2, #572
	ldr	r4, .L356+24
	ldr	r5, .L356+28
	ldr	lr, .L356+16
	ldr	ip, .L356+32
.L346:
	cmp	r3, #19
	movgt	r0, r4
	bgt	.L345
	cmp	r3, #9
	movgt	r0, #9408
	bgt	.L345
	cmp	r3, #4
	movgt	r0, r5
	movle	r0, #9216
.L345:
	lsl	r1, r2, #1
	sub	r2, r2, #1
	cmp	r2, ip
	strh	r0, [lr, r1]	@ movhi
	sub	r3, r3, #20
	bne	.L346
	pop	{r4, r5, r6, lr}
	bx	lr
.L357:
	.align	2
.L356:
	.word	.LANCHOR0
	.word	8352
	.word	545
	.word	8416
	.word	100720640
	.word	550
	.word	9376
	.word	9440
	.word	567
	.size	updateSupers, .-updateSupers
	.align	2
	.global	updateWins
	.syntax unified
	.arm
	.type	updateWins, %function
updateWins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L365
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L363
	cmp	r3, #2
	ldreq	r3, .L365+4
	ldreq	r2, .L365+8
	strheq	r2, [r3, #214]	@ movhi
	ldr	r3, .L365+12
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L364
.L361:
	cmp	r3, #2
	ldreq	r3, .L365+4
	ldreq	r2, .L365+8
	strheq	r2, [r3, #228]	@ movhi
	bx	lr
.L363:
	ldr	r3, .L365+4
	ldr	r2, .L365+8
	strh	r2, [r3, #216]	@ movhi
	ldr	r3, .L365+12
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L361
.L364:
	ldr	r3, .L365+4
	ldr	r2, .L365+8
	strh	r2, [r3, #226]	@ movhi
	bx	lr
.L366:
	.align	2
.L365:
	.word	playerWins
	.word	100720640
	.word	8322
	.word	oppWins
	.size	updateWins, .-updateWins
	.align	2
	.global	clearWins
	.syntax unified
	.arm
	.type	clearWins, %function
clearWins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L368
	ldr	r2, .L368+4
	strh	r2, [r3, #216]	@ movhi
	strh	r2, [r3, #214]	@ movhi
	strh	r2, [r3, #226]	@ movhi
	strh	r2, [r3, #228]	@ movhi
	bx	lr
.L369:
	.align	2
.L368:
	.word	100720640
	.word	8321
	.size	clearWins, .-clearWins
	.global	attackCooldown
	.global	damagedFrames
	.global	frameCounter
	.global	hOff
	.global	DIRECTION
	.global	opp
	.global	player
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	player, %object
	.size	player, 140
player:
	.space	140
	.space	4
	.type	opp, %object
	.size	opp, 140
opp:
	.space	140
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	attackCooldown, %object
	.size	attackCooldown, 4
attackCooldown:
	.space	4
	.type	damagedFrames, %object
	.size	damagedFrames, 4
damagedFrames:
	.space	4
	.type	frameCounter, %object
	.size	frameCounter, 4
frameCounter:
	.space	4
	.type	DIRECTION, %object
	.size	DIRECTION, 1
DIRECTION:
	.space	1
	.ident	"GCC: (devkitARM release 66) 15.1.0"
