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
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+16
	ldr	r1, [r3]
	mov	r2, #1
	ldr	r0, .L4+20
	sub	r1, r1, #100
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	ldr	r5, .L4+36
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+40
	mov	r3, #512
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	mov	r4, #0
	mov	r1, #67108864
	ldr	lr, .L4+48
	ldr	ip, .L4+52
	str	r4, [lr]
	mov	r2, #100663296
	strh	r4, [r1]	@ movhi
	mov	r0, #3
	strh	ip, [r1]	@ movhi
	ldr	r3, .L4+56
	mov	r1, r4
	mov	lr, pc
	bx	r5
	mov	r1, r4
	mov	r0, #3
	ldr	r3, .L4+56
	ldr	r2, .L4+60
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+64
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+40
	str	r4, [r3, #1024]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	mgba_open
	.word	initSound
	.word	setupSounds
	.word	setupSoundInterrupts
	.word	LightningPandemonium_length
	.word	LightningPandemonium_data
	.word	playSoundA
	.word	hideSprites
	.word	waitForVBlank
	.word	DMANow
	.word	.LANCHOR0
	.word	initAttacks
	.word	hOff
	.word	1028
	.word	16796416
	.word	100704256
	.word	startPal
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r1, #67108864
	mov	r4, #0
	ldr	lr, .L8
	ldr	ip, .L8+4
	str	r4, [lr]
	ldr	r5, .L8+8
	strh	r4, [r1]	@ movhi
	mov	r2, #100663296
	strh	ip, [r1]	@ movhi
	mov	r0, #3
	mov	r1, r4
	ldr	r3, .L8+12
	mov	lr, pc
	bx	r5
	mov	r1, r4
	mov	r0, #3
	ldr	r3, .L8+12
	ldr	r2, .L8+16
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+20
	mov	lr, pc
	bx	r5
	ldr	r3, .L8+24
	str	r4, [r3, #1024]
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	hOff
	.word	1028
	.word	DMANow
	.word	16796416
	.word	100704256
	.word	startPal
	.word	.LANCHOR0
	.size	goToStart, .-goToStart
	.align	2
	.global	goToCSS
	.syntax unified
	.arm
	.type	goToCSS, %function
goToCSS:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #0
	mov	r5, #67108864
	ldr	r4, .L12
	strh	ip, [r5]	@ movhi
	mov	r0, #3
	strh	ip, [r5]	@ movhi
	ldr	r2, .L12+4
	ldr	r1, .L12+8
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+16
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r4
	mov	ip, #6144
	mov	r3, #256
	strh	ip, [r5]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L12+24
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L12+28
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+32
	mov	r0, #3
	ldr	r1, .L12+36
	mov	lr, pc
	bx	r4
	mov	r2, #7680
	mov	r3, #2
	strh	r2, [r5, #14]	@ movhi
	ldr	r2, .L12+20
	pop	{r4, r5, r6, lr}
	str	r3, [r2, #1024]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	100712448
	.word	pauseMap
	.word	hideSprites
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	gameTilesPal
	.word	gameTilesTiles
	.word	100724736
	.word	cssMap
	.size	goToCSS, .-goToCSS
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #67108864
	mov	r1, #0
	push	{r4, lr}
	ldr	lr, .L16
	strh	r1, [ip]	@ movhi
	ldr	r4, .L16+4
	strh	lr, [ip]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L16+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r1, #0
	ldr	r3, .L16+8
	ldr	r2, .L16+12
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r3, #170
	mov	r0, #3
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+20
	ldr	r0, .L16+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L16+28
	pop	{r4, lr}
	str	r2, [r3, #1024]
	str	r2, [r3, #1028]
	bx	lr
.L17:
	.align	2
.L16:
	.word	1028
	.word	DMANow
	.word	16796416
	.word	100704256
	.word	instructionsPal
	.word	drawFullscreenImage4
	.word	instructionsBitmap
	.word	.LANCHOR0
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	start
	.syntax unified
	.arm
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L32
	ldr	r3, [r2, #1032]
	add	r3, r3, #1
	cmp	r3, #29
	push	{r4, lr}
	str	r3, [r2, #1032]
	ble	.L19
	ldr	r3, .L32+4
	ldr	r0, .L32+8
	mov	lr, pc
	bx	r3
	ldr	r2, .L32
	ldr	r3, [r2, #1032]
	cmp	r3, #60
	moveq	r3, #0
	streq	r3, [r2, #1032]
.L20:
	ldr	r3, .L32+12
	ldrh	r2, [r3, #12]
	tst	r2, #8
	beq	.L21
	ldrh	r1, [r3, #14]
	tst	r1, #8
	beq	.L30
.L21:
	tst	r2, #4
	beq	.L18
	ldrh	r3, [r3, #14]
	tst	r3, #4
	beq	.L31
.L18:
	pop	{r4, lr}
	bx	lr
.L19:
	ldr	r0, .L32+16
	ldr	r3, .L32+4
	mov	lr, pc
	bx	r3
	b	.L20
.L31:
	pop	{r4, lr}
	b	goToInstructions
.L30:
	bl	goToInstructions
	ldr	r3, .L32+12
	ldrh	r2, [r3, #12]
	b	.L21
.L33:
	.align	2
.L32:
	.word	.LANCHOR0
	.word	drawFullscreenImage4
	.word	start2Bitmap
	.word	.LANCHOR0+1024
	.word	startBitmap
	.size	start, .-start
	.align	2
	.global	goToStage1
	.syntax unified
	.arm
	.type	goToStage1, %function
goToStage1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #67108864
	mov	r4, #0
	mov	r5, #3
	ldr	r6, .L38
	mov	r0, #3
	ldr	r2, .L38+4
	ldr	r1, .L38+8
	mov	r3, #1024
	strh	r4, [r7]	@ movhi
	strh	r4, [r7]	@ movhi
	mov	lr, pc
	bx	r6
	ldr	r3, .L38+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+16
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L38+20
	mov	lr, pc
	bx	r6
	ldr	r3, .L38+24
	mov	r2, #100663296
	mov	r0, r5
	str	r5, [r3, #116]
	ldr	r1, .L38+28
	mov	r3, #8192
	mov	lr, pc
	bx	r6
	mov	r3, #8192
	mov	r0, r5
	ldr	r2, .L38+32
	ldr	r1, .L38+36
	mov	lr, pc
	bx	r6
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, r5
	ldr	r1, .L38+40
	mov	lr, pc
	bx	r6
	mov	r3, #16
	mov	r0, r5
	ldr	r2, .L38+44
	ldr	r1, .L38+48
	mov	lr, pc
	bx	r6
	mov	r3, #2048
	mov	r0, r5
	ldr	r2, .L38+52
	ldr	r1, .L38+56
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, r5
	ldr	r2, .L38+60
	ldr	r1, .L38+64
	mov	lr, pc
	bx	r6
	ldr	r2, .L38+68
	ldr	r3, .L38+20
	mov	r1, #7168
	str	r5, [r3, #1024]
	strh	r2, [r7, #14]	@ movhi
	mov	r2, #6400
	mov	r3, r4
	strh	r1, [r7, #8]	@ movhi
	ldr	r0, .L38+60
	strh	r2, [r7]	@ movhi
.L35:
	lsl	r1, r3, #1
	ldrh	r2, [r0, r1]
	add	r3, r3, #1
	orr	r2, r2, #8192
	cmp	r3, #2048
	strh	r2, [r0, r1]	@ movhi
	bne	.L35
	ldr	r3, .L38+72
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	DMANow
	.word	100712448
	.word	pauseMap
	.word	hideSprites
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	opp
	.word	gameTilesTiles
	.word	100679680
	.word	stage1TilesTiles
	.word	stage1TilesPal
	.word	83886144
	.word	gameTilesPal
	.word	100724736
	.word	stage1Map
	.word	100720640
	.word	uiMap
	.word	24068
	.word	changeCharacters
	.size	goToStage1, .-goToStage1
	.align	2
	.global	css
	.syntax unified
	.arm
	.type	css, %function
css:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L48
	ldrh	r2, [r3, #12]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #14]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L48+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStage1
.L49:
	.align	2
.L48:
	.word	.LANCHOR0+1024
	.word	initGame
	.size	css, .-css
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	ldr	r2, .L83
	ldrh	r3, [r2, #12]
	tst	r3, #8
	sub	sp, sp, #12
	beq	.L51
	ldrh	r1, [r2, #14]
	tst	r1, #8
	beq	.L80
.L51:
	tst	r3, #4
	beq	.L52
	ldrh	r1, [r2, #14]
	tst	r1, #4
	beq	.L81
.L52:
	tst	r3, #32
	beq	.L53
	ldrh	r0, [r2, #14]
	tst	r0, #32
	ldr	r1, .L83+4
	beq	.L82
.L53:
	tst	r3, #16
	beq	.L50
	ldrh	r3, [r2, #14]
	tst	r3, #16
	ldr	r1, .L83+4
	bne	.L50
	ldr	r3, [r1, #1028]
	ldr	r2, .L83+8
	sub	r3, r3, #1
	cmp	r3, #3
	bhi	.L50
	ldrb	r3, [r2, r3]
	add	pc, pc, r3, lsl #2
.Lrtx61:
	nop
	.section	.rodata
.L61:
	.byte	(.L64-.Lrtx61-4)/4
	.byte	(.L63-.Lrtx61-4)/4
	.byte	(.L62-.Lrtx61-4)/4
	.byte	(.L60-.Lrtx61-4)/4
	.text
	.p2align 2
.L62:
	ldr	r3, .L83+12
	ldr	r0, .L83+16
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r3
	mov	r3, #4
	ldr	r1, [sp, #4]
	str	r3, [r1, #1028]
.L50:
	add	sp, sp, #12
	@ sp needed
	ldr	lr, [sp], #4
	bx	lr
.L82:
	ldr	r0, [r1, #1028]
	ldr	ip, .L83+20
	sub	r0, r0, #2
	cmp	r0, #3
	bhi	.L53
	ldrb	r0, [ip, r0]
	add	pc, pc, r0, lsl #2
.Lrtx55:
	nop
	.section	.rodata
.L55:
	.byte	(.L58-.Lrtx55-4)/4
	.byte	(.L57-.Lrtx55-4)/4
	.byte	(.L56-.Lrtx55-4)/4
	.byte	(.L54-.Lrtx55-4)/4
	.text
	.p2align 2
.L81:
	bl	goToStart
	ldr	r2, .L83
	ldrh	r3, [r2, #12]
	b	.L52
.L80:
	ldr	r3, .L83+24
	mov	lr, pc
	bx	r3
	bl	goToStage1
	ldr	r2, .L83
	ldrh	r3, [r2, #12]
	b	.L51
.L54:
	ldr	r0, .L83+16
	ldr	r3, .L83+12
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r3
	mov	r0, #4
	ldr	r2, .L83
	ldr	r1, [sp, #4]
	ldrh	r3, [r2, #12]
	str	r0, [r1, #1028]
	b	.L53
.L64:
	ldr	r3, .L83+12
	ldr	r0, .L83+28
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r3
	mov	r3, #2
	ldr	r1, [sp, #4]
	str	r3, [r1, #1028]
	b	.L50
.L63:
	ldr	r3, .L83+12
	ldr	r0, .L83+32
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r3
	mov	r3, #3
	ldr	r1, [sp, #4]
	str	r3, [r1, #1028]
	b	.L50
.L56:
	ldr	r0, .L83+32
	ldr	r3, .L83+12
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r2, .L83
	ldr	r1, [sp, #4]
	ldrh	r3, [r2, #12]
	str	r0, [r1, #1028]
	b	.L53
.L57:
	ldr	r0, .L83+28
	ldr	r3, .L83+12
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r3
	mov	r0, #2
	ldr	r2, .L83
	ldr	r1, [sp, #4]
	ldrh	r3, [r2, #12]
	str	r0, [r1, #1028]
	b	.L53
.L58:
	ldr	r0, .L83+36
	ldr	r3, .L83+12
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r3
	mov	r0, #1
	ldr	r2, .L83
	ldr	r1, [sp, #4]
	ldrh	r3, [r2, #12]
	str	r0, [r1, #1028]
	b	.L53
.L60:
	ldr	r3, .L83+12
	ldr	r0, .L83+40
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r3
	mov	r3, #5
	ldr	r1, [sp, #4]
	str	r3, [r1, #1028]
	b	.L50
.L84:
	.align	2
.L83:
	.word	.LANCHOR0+1024
	.word	.LANCHOR0
	.word	.L61
	.word	drawFullscreenImage4
	.word	instructions4Bitmap
	.word	.L55
	.word	initGame
	.word	instructions2Bitmap
	.word	instructions3Bitmap
	.word	instructionsBitmap
	.word	instructions5Bitmap
	.size	instructions, .-instructions
	.align	2
	.global	goToStage2
	.syntax unified
	.arm
	.type	goToStage2, %function
goToStage2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #2
	ldr	ip, .L91
	ldr	r4, .L91+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L91+8
	str	lr, [ip, #116]
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L91+12
	ldr	r1, .L91+16
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L91+20
	ldr	r1, .L91+24
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L91+28
	ldr	r1, .L91+32
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L91+36
	ldr	r1, .L91+40
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L91+44
	ldr	r1, .L91+48
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L91+52
	ldr	r1, .L91+56
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r0, .L91+52
.L86:
	lsl	r1, r3, #1
	ldrh	r2, [r0, r1]
	add	r3, r3, #1
	orr	r2, r2, #4096
	cmp	r3, #4096
	strh	r2, [r0, r1]	@ movhi
	bne	.L86
	mov	r3, #67108864
	mov	ip, #0
	mov	r2, #7424
	ldr	r4, .L91+60
	ldr	r1, [r4, #1040]
	ldr	r0, .L91+64
	cmp	r1, #3
	ldr	r1, .L91+68
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #14]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r2, [r3]	@ movhi
	beq	.L90
.L87:
	mov	r2, #4
	ldr	r3, .L91+72
	str	r2, [r4, #1024]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L90:
	ldr	r3, .L91+76
	mov	lr, pc
	bx	r3
	b	.L87
.L92:
	.align	2
.L91:
	.word	opp
	.word	DMANow
	.word	stage2SkyBGPal
	.word	83886112
	.word	trainPal
	.word	83886144
	.word	gameTilesPal
	.word	100679680
	.word	stage2SkyBGTiles
	.word	100724736
	.word	stage2FullBackgroundMap
	.word	100696064
	.word	trainTiles
	.word	100704256
	.word	stage2TrainMap
	.word	.LANCHOR0
	.word	24068
	.word	5128
	.word	changeCharacters
	.word	initGame
	.size	goToStage2, .-goToStage2
	.align	2
	.global	goToStage3
	.syntax unified
	.arm
	.type	goToStage3, %function
goToStage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #4
	ldr	ip, .L99
	ldr	r4, .L99+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L99+8
	str	lr, [ip, #116]
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L99+12
	ldr	r1, .L99+16
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L99+20
	ldr	r1, .L99+24
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L99+28
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L99+32
	ldr	r1, .L99+36
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r0, .L99+40
.L94:
	lsl	r1, r3, #1
	ldrh	r2, [r0, r1]
	add	r3, r3, #1
	orr	r2, r2, #8192
	cmp	r3, #2048
	strh	r2, [r0, r1]	@ movhi
	bne	.L94
	mov	r3, #67108864
	mov	r0, #0
	mov	r2, #6400
	ldr	r4, .L99+44
	ldr	ip, [r4, #1040]
	ldr	r1, .L99+48
	cmp	ip, #4
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	strh	r2, [r3]	@ movhi
	beq	.L98
.L95:
	mov	r2, #5
	ldr	r3, .L99+52
	str	r2, [r4, #1024]
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L98:
	ldr	r3, .L99+56
	mov	lr, pc
	bx	r3
	b	.L95
.L100:
	.align	2
.L99:
	.word	opp
	.word	DMANow
	.word	stage3TilesetPal
	.word	100679680
	.word	stage3TilesetTiles
	.word	83886144
	.word	gameTilesPal
	.word	gameTilesTiles
	.word	100704256
	.word	stage3Map
	.word	100720640
	.word	.LANCHOR0
	.word	21508
	.word	changeCharacters
	.word	initGame
	.size	goToStage3, .-goToStage3
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	push	{r4, lr}
	mov	ip, #6144
	mov	r4, #6
	mov	r3, #0
	ldrh	r1, [r2]
	ldr	lr, .L105
	orr	r1, r1, #512
	str	r4, [lr, #1024]
	ldr	r0, .L105+4
	strh	r1, [r2]	@ movhi
	strh	ip, [r2, #10]	@ movhi
.L102:
	lsl	r1, r3, #1
	ldrh	r2, [r0, r1]
	add	r3, r3, #1
	orr	r2, r2, #8192
	cmp	r3, #2048
	strh	r2, [r0, r1]	@ movhi
	bne	.L102
	pop	{r4, lr}
	bx	lr
.L106:
	.align	2
.L105:
	.word	.LANCHOR0
	.word	100712448
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L130
	add	r3, r1, #1024
	ldrh	r2, [r3, #12]
	tst	r2, #8
	beq	.L120
	ldrh	r0, [r3, #14]
	tst	r0, #8
	bne	.L120
	ldr	r2, [r1, #1040]
	cmp	r2, #3
	push	{r4, lr}
	beq	.L127
.L109:
	cmp	r2, #4
	beq	.L128
.L110:
	cmp	r2, #5
	beq	.L111
.L126:
	ldrh	r2, [r3, #12]
	tst	r2, #4
	beq	.L107
	ldrh	r3, [r3, #14]
	tst	r3, #4
	beq	.L129
.L107:
	pop	{r4, lr}
	bx	lr
.L120:
	tst	r2, #4
	bxeq	lr
	ldrh	r3, [r3, #14]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L129:
	pop	{r4, lr}
	b	goToStart
.L127:
	mov	r0, #67108864
	ldrh	r2, [r0]
	bic	r2, r2, #512
	strh	r2, [r0]	@ movhi
	bl	goToStage1
	ldr	r1, .L130
	ldr	r2, [r1, #1040]
	add	r3, r1, #1024
	b	.L109
.L111:
	mov	r1, #67108864
	ldrh	r2, [r1]
	bic	r2, r2, #512
	strh	r2, [r1]	@ movhi
	bl	goToStage3
	ldr	r3, .L130+4
	b	.L126
.L128:
	mov	r0, #67108864
	ldrh	r2, [r0]
	bic	r2, r2, #512
	strh	r2, [r0]	@ movhi
	bl	goToStage2
	ldr	r1, .L130
	ldr	r2, [r1, #1040]
	add	r3, r1, #1024
	b	.L110
.L131:
	.align	2
.L130:
	.word	.LANCHOR0
	.word	.LANCHOR0+1024
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	r2, .L134
	ldr	r3, .L134+4
	ldr	r4, .L134+8
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L134+12
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	ip, .L134+16
	strh	r5, [r1]	@ movhi
	mov	r2, #100663296
	strh	ip, [r1]	@ movhi
	mov	r0, #3
	mov	r1, r5
	ldr	r3, .L134+20
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r0, #3
	ldr	r3, .L134+20
	ldr	r2, .L134+24
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L134+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L134+32
	ldr	r0, .L134+36
	mov	lr, pc
	bx	r3
	mov	r3, #7
	ldr	r2, .L134+12
	pop	{r4, r5, r6, lr}
	str	r3, [r2, #1024]
	bx	lr
.L135:
	.align	2
.L134:
	.word	hOff
	.word	hideSprites
	.word	DMANow
	.word	.LANCHOR0
	.word	1028
	.word	16796416
	.word	100704256
	.word	winPal
	.word	drawFullscreenImage4
	.word	winBitmap
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L141
	ldrh	r2, [r3, #12]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #14]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L142:
	.align	2
.L141:
	.word	.LANCHOR0+1024
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	r2, .L145
	ldr	r3, .L145+4
	ldr	r4, .L145+8
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L145+12
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	ip, .L145+16
	strh	r5, [r1]	@ movhi
	mov	r2, #100663296
	strh	ip, [r1]	@ movhi
	mov	r0, #3
	mov	r1, r5
	ldr	r3, .L145+20
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r0, #3
	ldr	r3, .L145+20
	ldr	r2, .L145+24
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L145+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L145+32
	ldr	r0, .L145+36
	mov	lr, pc
	bx	r3
	mov	r3, #8
	ldr	r2, .L145+12
	pop	{r4, r5, r6, lr}
	str	r3, [r2, #1024]
	bx	lr
.L146:
	.align	2
.L145:
	.word	hOff
	.word	hideSprites
	.word	DMANow
	.word	.LANCHOR0
	.word	1028
	.word	16796416
	.word	100704256
	.word	losePal
	.word	drawFullscreenImage4
	.word	loseBitmap
	.size	goToLose, .-goToLose
	.align	2
	.global	stage1
	.syntax unified
	.arm
	.type	stage1, %function
stage1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L166
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r3, .L166+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L166+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L166+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L166+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L166+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L166+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L166+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L166+32
	mov	lr, pc
	bx	r3
	ldr	r4, .L166+36
	ldr	r3, .L166+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L166+44
	mov	lr, pc
	bx	r3
	ldr	r5, .L166+48
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r4
	mov	r0, #3
	mov	lr, pc
	bx	r5
	add	r3, r4, #1024
	ldrh	r2, [r3, #12]
	tst	r2, #8
	beq	.L148
	ldrh	r3, [r3, #14]
	ands	r3, r3, #8
	beq	.L164
.L148:
	ldr	r5, .L166+52
	ldr	r2, [r5, #80]
	cmp	r2, #0
	ble	.L150
.L163:
	ldr	r2, .L166+56
.L151:
	ldr	r1, [r2, #80]
	cmp	r1, #0
	ble	.L165
.L147:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L165:
	ldr	r1, [r4, #1048]
	ldr	r0, .L166+60
	add	r1, r1, #1
	str	r2, [sp, #4]
	str	r1, [r4, #1048]
	mov	lr, pc
	bx	r0
	ldr	r1, .L166+64
	mov	lr, pc
	bx	r1
	ldr	r1, [r4, #1048]
	cmp	r1, #1
	ble	.L147
	mov	r1, #0
	ldr	r2, [sp, #4]
	ldr	r0, .L166+68
	str	r1, [r4, #1044]
	str	r1, [r4, #1048]
	str	r1, [r2, #84]
	str	r1, [r5, #84]
	mov	lr, pc
	bx	r0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToLose
.L150:
	ldr	r2, [r4, #1044]
	ldr	r1, .L166+60
	add	r2, r2, #1
	str	r2, [r4, #1044]
	mov	lr, pc
	bx	r1
	ldr	r2, .L166+64
	mov	lr, pc
	bx	r2
	ldr	r2, [r4, #1044]
	cmp	r2, #1
	ble	.L163
	mov	r1, #0
	ldr	r2, .L166+56
	ldr	r0, .L166+68
	str	r1, [r2, #84]
	str	r2, [sp, #4]
	str	r1, [r4, #1044]
	str	r1, [r4, #1048]
	str	r1, [r5, #84]
	mov	lr, pc
	bx	r0
	mov	r1, #3
	str	r1, [r4, #1040]
	bl	goToStage2
	ldr	r2, [sp, #4]
	b	.L151
.L164:
	mov	r2, #67108864
	mov	r1, #6
	mov	ip, #3
	mov	r0, #6144
	str	r1, [r4, #1024]
	ldrh	r1, [r2]
	orr	r1, r1, #512
	str	ip, [r4, #1040]
	strh	r1, [r2]	@ movhi
	ldr	ip, .L166+72
	strh	r0, [r2, #10]	@ movhi
.L149:
	lsl	r0, r3, #1
	ldrh	r2, [ip, r0]
	add	r3, r3, #1
	orr	r2, r2, #8192
	cmp	r3, #2048
	strh	r2, [ip, r0]	@ movhi
	bne	.L149
	b	.L148
.L167:
	.align	2
.L166:
	.word	drawPortraits
	.word	updateHealthbars
	.word	checkPosition
	.word	updatePlayer
	.word	updateOpp
	.word	updateCamera
	.word	updateSupers
	.word	calculateAttackHitboxes
	.word	drawPlayer
	.word	.LANCHOR0
	.word	drawOpp
	.word	waitForVBlank
	.word	DMANow
	.word	opp
	.word	player
	.word	updateWins
	.word	initGame
	.word	clearWins
	.word	100712448
	.size	stage1, .-stage1
	.align	2
	.global	stage2
	.syntax unified
	.arm
	.type	stage2, %function
stage2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L187
	ldr	r3, [r4, #1052]
	sub	sp, sp, #12
	ldr	r2, .L187+4
	add	r3, r3, #4
	str	r3, [r4, #1052]
	mov	lr, pc
	bx	r2
	ldr	r3, .L187+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L187+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L187+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L187+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L187+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L187+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L187+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L187+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L187+40
	mov	lr, pc
	bx	r3
	ldr	r5, .L187+44
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	r1, r4
	mov	lr, pc
	bx	r5
	add	r3, r4, #1024
	ldrh	r2, [r3, #12]
	tst	r2, #8
	beq	.L169
	ldrh	r3, [r3, #14]
	ands	r3, r3, #8
	beq	.L185
.L169:
	ldr	r5, .L187+48
	ldr	r2, [r5, #80]
	cmp	r2, #0
	ble	.L171
.L184:
	ldr	r2, .L187+52
.L172:
	ldr	r1, [r2, #80]
	cmp	r1, #0
	ble	.L186
.L168:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L186:
	ldr	r1, [r4, #1048]
	ldr	r0, .L187+56
	add	r1, r1, #1
	str	r2, [sp, #4]
	str	r1, [r4, #1048]
	mov	lr, pc
	bx	r0
	ldr	r1, .L187+60
	mov	lr, pc
	bx	r1
	ldr	r1, [r4, #1048]
	cmp	r1, #1
	ble	.L168
	mov	r1, #0
	ldr	r2, [sp, #4]
	ldr	r0, .L187+64
	str	r1, [r4, #1044]
	str	r1, [r4, #1048]
	str	r1, [r2, #84]
	str	r1, [r5, #84]
	mov	lr, pc
	bx	r0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToLose
.L171:
	ldr	r2, [r4, #1044]
	ldr	r1, .L187+56
	add	r2, r2, #1
	str	r2, [r4, #1044]
	mov	lr, pc
	bx	r1
	ldr	r2, .L187+60
	mov	lr, pc
	bx	r2
	ldr	r2, [r4, #1044]
	cmp	r2, #1
	ble	.L184
	mov	r1, #0
	ldr	r2, .L187+52
	ldr	r0, .L187+64
	str	r1, [r2, #84]
	str	r2, [sp, #4]
	str	r1, [r4, #1044]
	str	r1, [r4, #1048]
	str	r1, [r5, #84]
	mov	lr, pc
	bx	r0
	mov	r0, #67108864
	mov	r1, #4
	str	r1, [r4, #1040]
	ldrh	r1, [r0]
	strh	r1, [r0]	@ movhi
	bl	goToStage3
	ldr	r2, [sp, #4]
	b	.L172
.L185:
	mov	r2, #67108864
	mov	r1, #6
	mov	ip, #4
	mov	r0, #6144
	str	r1, [r4, #1024]
	ldrh	r1, [r2]
	orr	r1, r1, #512
	str	ip, [r4, #1040]
	strh	r1, [r2]	@ movhi
	ldr	ip, .L187+68
	strh	r0, [r2, #10]	@ movhi
.L170:
	lsl	r0, r3, #1
	ldrh	r2, [ip, r0]
	add	r3, r3, #1
	orr	r2, r2, #8192
	cmp	r3, #2048
	strh	r2, [ip, r0]	@ movhi
	bne	.L170
	b	.L169
.L188:
	.align	2
.L187:
	.word	.LANCHOR0
	.word	updateHealthbars
	.word	checkPosition
	.word	updatePlayer
	.word	updateOpp
	.word	updateCamera
	.word	updateSupers
	.word	calculateAttackHitboxes
	.word	drawPlayer
	.word	drawOpp
	.word	waitForVBlank
	.word	DMANow
	.word	opp
	.word	player
	.word	updateWins
	.word	initGame
	.word	clearWins
	.word	100712448
	.size	stage2, .-stage2
	.align	2
	.global	stage3
	.syntax unified
	.arm
	.type	stage3, %function
stage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, .L208
	sub	sp, sp, #12
	mov	lr, pc
	bx	r3
	ldr	r3, .L208+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L208+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L208+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L208+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L208+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L208+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L208+28
	mov	lr, pc
	bx	r3
	ldr	r4, .L208+32
	ldr	r3, .L208+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L208+40
	mov	lr, pc
	bx	r3
	ldr	r5, .L208+44
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r4
	mov	r0, #3
	mov	lr, pc
	bx	r5
	add	r3, r4, #1024
	ldrh	r2, [r3, #12]
	tst	r2, #8
	beq	.L190
	ldrh	r3, [r3, #14]
	ands	r3, r3, #8
	beq	.L206
.L190:
	ldr	r5, .L208+48
	ldr	r2, [r5, #80]
	cmp	r2, #0
	ble	.L192
.L205:
	ldr	r2, .L208+52
.L193:
	ldr	r1, [r2, #80]
	cmp	r1, #0
	ble	.L207
.L189:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L207:
	ldr	r1, [r4, #1048]
	ldr	r0, .L208+56
	add	r1, r1, #1
	str	r2, [sp, #4]
	str	r1, [r4, #1048]
	mov	lr, pc
	bx	r0
	ldr	r1, .L208+60
	mov	lr, pc
	bx	r1
	ldr	r1, [r4, #1048]
	cmp	r1, #1
	ble	.L189
	mov	r1, #0
	ldr	r2, [sp, #4]
	ldr	r0, .L208+64
	str	r1, [r4, #1044]
	str	r1, [r4, #1048]
	str	r1, [r2, #84]
	str	r1, [r5, #84]
	mov	lr, pc
	bx	r0
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	b	goToLose
.L192:
	ldr	r2, [r4, #1044]
	ldr	r1, .L208+56
	add	r2, r2, #1
	str	r2, [r4, #1044]
	mov	lr, pc
	bx	r1
	ldr	r2, .L208+60
	mov	lr, pc
	bx	r2
	ldr	r2, [r4, #1044]
	cmp	r2, #1
	ble	.L205
	mov	r1, #0
	ldr	r2, .L208+52
	ldr	r0, .L208+64
	str	r1, [r2, #84]
	str	r2, [sp, #4]
	str	r1, [r4, #1044]
	str	r1, [r4, #1048]
	str	r1, [r5, #84]
	mov	lr, pc
	bx	r0
	mov	r1, #5
	str	r1, [r4, #1040]
	bl	goToWin
	ldr	r2, [sp, #4]
	b	.L193
.L206:
	mov	r2, #67108864
	mov	r1, #6
	mov	ip, #5
	mov	r0, #6144
	str	r1, [r4, #1024]
	ldrh	r1, [r2]
	orr	r1, r1, #512
	str	ip, [r4, #1040]
	strh	r1, [r2]	@ movhi
	ldr	ip, .L208+68
	strh	r0, [r2, #10]	@ movhi
.L191:
	lsl	r0, r3, #1
	ldrh	r2, [ip, r0]
	add	r3, r3, #1
	orr	r2, r2, #8192
	cmp	r3, #2048
	strh	r2, [ip, r0]	@ movhi
	bne	.L191
	b	.L190
.L209:
	.align	2
.L208:
	.word	updateHealthbars
	.word	checkPosition
	.word	updatePlayer
	.word	updateOpp
	.word	updateCamera
	.word	updateSupers
	.word	calculateAttackHitboxes
	.word	drawPlayer
	.word	.LANCHOR0
	.word	drawOpp
	.word	waitForVBlank
	.word	DMANow
	.word	opp
	.word	player
	.word	updateWins
	.word	initGame
	.word	clearWins
	.word	100712448
	.size	stage3, .-stage3
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r4, .L245
	mov	fp, r4
	ldr	r3, .L245+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L245+8
	ldr	r1, [fp, #1024]!
	ldr	r2, [r5]
	ldr	r9, .L245+12
	ldr	r8, .L245+16
	ldr	r6, .L245+20
	ldrh	r0, [fp, #14]
.L211:
	strh	r0, [fp, #12]	@ movhi
	ldrh	r3, [r6, #48]
	lsl	r2, r2, #16
	cmp	r1, #4
	strh	r3, [fp, #14]	@ movhi
	lsr	r0, r2, #16
	beq	.L243
.L212:
	cmp	r1, #6
	beq	.L215
	mov	r7, #67108864
.L216:
	strh	r0, [r7, #28]	@ movhi
	cmp	r1, #8
	bhi	.L234
	ldrb	r3, [r8, r1]
	add	pc, pc, r3, lsl #2
.Lrtx219:
	nop
	.section	.rodata
.L219:
	.byte	(.L226-.Lrtx219-4)/4
	.byte	(.L225-.Lrtx219-4)/4
	.byte	(.L224-.Lrtx219-4)/4
	.byte	(.L223-.Lrtx219-4)/4
	.byte	(.L234-.Lrtx219-4)/4
	.byte	(.L222-.Lrtx219-4)/4
	.byte	(.L221-.Lrtx219-4)/4
	.byte	(.L218-.Lrtx219-4)/4
	.byte	(.L218-.Lrtx219-4)/4
	.section	.text.startup
	.p2align 2
.L218:
	ldrh	r3, [fp, #12]
	tst	r3, #8
	ldrh	r3, [fp, #14]
	beq	.L232
	ands	r10, r3, #8
	beq	.L244
.L232:
	strh	r3, [fp, #12]	@ movhi
	ldrh	r3, [r6, #48]
	lsr	r0, r2, #16
.L213:
	strh	r3, [fp, #14]	@ movhi
	b	.L216
.L215:
	ldr	r3, [r4, #1040]
	cmp	r3, #4
	moveq	r2, #67108864
	movne	r3, #67108864
	ldreq	r3, [r4, #1052]
	lsleq	r3, r3, #16
	lsreq	r3, r3, #16
	strheq	r0, [r2, #24]	@ movhi
	strhne	r0, [r3, #28]	@ movhi
	strheq	r3, [r2, #28]	@ movhi
.L221:
	ldr	r3, .L245+24
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #14]
	ldr	r2, [r5]
	b	.L211
.L222:
	ldr	r3, .L245+28
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #14]
	ldr	r2, [r5]
	b	.L211
.L223:
	ldr	r3, .L245+32
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #14]
	ldr	r2, [r5]
	b	.L211
.L224:
	ldrh	r3, [fp, #12]
	tst	r3, #8
	ldrh	r3, [fp, #14]
	beq	.L228
	tst	r3, #8
	bne	.L232
	ldr	r3, .L245+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L245+40
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #14]
	ldr	r2, [r5]
	b	.L211
.L225:
	ldr	r3, .L245+44
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #14]
	ldr	r2, [r5]
	b	.L211
.L226:
	ldr	r3, .L245+48
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #14]
	ldr	r2, [r5]
	b	.L211
.L243:
	mov	r2, #67108864
	ldr	r3, [r4, #1052]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r0, [r2, #24]	@ movhi
	strh	r3, [r2, #28]	@ movhi
	mov	lr, pc
	bx	r9
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #14]
	ldr	r2, [r5]
	b	.L211
.L228:
	strh	r3, [fp, #12]	@ movhi
	ldrh	r3, [r6, #48]
	lsr	r0, r2, #16
	strh	r3, [fp, #14]	@ movhi
	b	.L212
.L244:
	mov	ip, #67108864
	ldr	lr, .L245+52
	str	r10, [r5]
	mov	r2, #100663296
	strh	r10, [ip]	@ movhi
	mov	r1, r10
	strh	lr, [ip]	@ movhi
	mov	r0, #3
	ldr	r3, .L245+56
	ldr	ip, .L245+60
	mov	lr, pc
	bx	ip
	mov	r0, #3
	mov	r1, r10
	ldr	r3, .L245+56
	ldr	r2, .L245+64
	ldr	ip, .L245+60
	mov	lr, pc
	bx	ip
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L245+68
	ldr	ip, .L245+60
	mov	lr, pc
	bx	ip
	ldrh	r3, [fp, #14]
	ldr	r2, [r5]
	strh	r3, [fp, #12]	@ movhi
	lsl	r2, r2, #16
	mov	r1, r10
	str	r10, [r4, #1024]
	ldrh	r3, [r6, #48]
	lsr	r0, r2, #16
	b	.L213
.L234:
	mov	ip, #67108864
	ldr	r1, .L245+20
.L217:
	ldrh	r3, [fp, #14]
	strh	r3, [fp, #12]	@ movhi
	ldrh	r3, [r1, #48]
	strh	r3, [fp, #14]	@ movhi
	strh	r0, [ip, #28]	@ movhi
	b	.L217
.L246:
	.align	2
.L245:
	.word	.LANCHOR0
	.word	initialize
	.word	hOff
	.word	stage2
	.word	.L219
	.word	67109120
	.word	pause
	.word	stage3
	.word	stage1
	.word	initGame
	.word	goToStage1
	.word	instructions
	.word	start
	.word	1028
	.word	16796416
	.word	DMANow
	.word	100704256
	.word	startPal
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L252
	ldrh	r2, [r3, #12]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #14]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L253:
	.align	2
.L252:
	.word	.LANCHOR0+1024
	.size	lose, .-lose
	.align	2
	.global	switchMode4
	.syntax unified
	.arm
	.type	switchMode4, %function
switchMode4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #67108864
	mov	r1, #0
	push	{r4, lr}
	ldr	lr, .L256
	strh	r1, [ip]	@ movhi
	ldr	r4, .L256+4
	strh	lr, [ip]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L256+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r1, #0
	ldr	r3, .L256+8
	ldr	r2, .L256+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L257:
	.align	2
.L256:
	.word	1028
	.word	DMANow
	.word	16796416
	.word	100704256
	.size	switchMode4, .-switchMode4
	.align	2
	.global	switchMode0
	.syntax unified
	.arm
	.type	switchMode0, %function
switchMode0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	ip, #67108864
	mov	lr, #0
	mov	r0, #3
	strh	lr, [ip]	@ movhi
	ldr	r2, .L260
	strh	lr, [ip]	@ movhi
	ldr	r1, .L260+4
	ldr	r4, .L260+8
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L260+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L260+16
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L260+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L261:
	.align	2
.L260:
	.word	100712448
	.word	pauseMap
	.word	DMANow
	.word	hideSprites
	.word	waitForVBlank
	.word	.LANCHOR0
	.size	switchMode0, .-switchMode0
	.global	shadowOAM
	.global	instructPage
	.global	oppWins
	.global	playerWins
	.global	bgScroll
	.global	prevState
	.global	startFrames
	.global	oldButtons
	.global	buttons
	.global	state
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	shadowOAM, %object
	.size	shadowOAM, 1024
shadowOAM:
	.space	1024
	.type	state, %object
	.size	state, 4
state:
	.space	4
	.type	instructPage, %object
	.size	instructPage, 4
instructPage:
	.space	4
	.type	startFrames, %object
	.size	startFrames, 4
startFrames:
	.space	4
	.type	oldButtons, %object
	.size	oldButtons, 2
oldButtons:
	.space	2
	.type	buttons, %object
	.size	buttons, 2
buttons:
	.space	2
	.type	prevState, %object
	.size	prevState, 4
prevState:
	.space	4
	.type	playerWins, %object
	.size	playerWins, 4
playerWins:
	.space	4
	.type	oppWins, %object
	.size	oppWins, 4
oppWins:
	.space	4
	.type	bgScroll, %object
	.size	bgScroll, 4
bgScroll:
	.space	4
	.ident	"GCC: (devkitARM release 66) 15.1.0"
