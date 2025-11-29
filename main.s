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
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r5, .L4+24
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+28
	mov	r3, #512
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+32
	mov	lr, pc
	bx	r3
	mov	r4, #0
	mov	r1, #67108864
	ldr	lr, .L4+36
	ldr	ip, .L4+40
	str	r4, [lr]
	mov	r2, #100663296
	strh	r4, [r1]	@ movhi
	mov	r0, #3
	strh	ip, [r1]	@ movhi
	ldr	r3, .L4+44
	mov	r1, r4
	mov	lr, pc
	bx	r5
	mov	r1, r4
	mov	r0, #3
	ldr	r3, .L4+44
	ldr	r2, .L4+48
	mov	lr, pc
	bx	r5
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+52
	mov	lr, pc
	bx	r5
	ldr	r3, .L4+28
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
	ldr	lr, .L12
	strh	r1, [ip]	@ movhi
	ldr	r4, .L12+4
	strh	lr, [ip]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L12+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r1, #0
	ldr	r3, .L12+8
	ldr	r2, .L12+12
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r3, #170
	mov	r0, #3
	ldr	r1, .L12+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+20
	ldr	r0, .L12+24
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L12+28
	pop	{r4, lr}
	str	r2, [r3, #1024]
	bx	lr
.L13:
	.align	2
.L12:
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
	ldr	r2, .L28
	ldr	r3, [r2, #1028]
	add	r3, r3, #1
	cmp	r3, #29
	push	{r4, lr}
	str	r3, [r2, #1028]
	ble	.L15
	ldr	r3, .L28+4
	ldr	r0, .L28+8
	mov	lr, pc
	bx	r3
	ldr	r2, .L28
	ldr	r3, [r2, #1028]
	cmp	r3, #60
	moveq	r3, #0
	streq	r3, [r2, #1028]
.L16:
	ldr	r3, .L28+12
	ldrh	r2, [r3, #8]
	tst	r2, #8
	beq	.L17
	ldrh	r1, [r3, #10]
	tst	r1, #8
	beq	.L26
.L17:
	tst	r2, #4
	beq	.L14
	ldrh	r3, [r3, #10]
	tst	r3, #4
	beq	.L27
.L14:
	pop	{r4, lr}
	bx	lr
.L15:
	ldr	r0, .L28+16
	ldr	r3, .L28+4
	mov	lr, pc
	bx	r3
	b	.L16
.L27:
	pop	{r4, lr}
	b	goToInstructions
.L26:
	bl	goToInstructions
	ldr	r3, .L28+12
	ldrh	r2, [r3, #8]
	b	.L17
.L29:
	.align	2
.L28:
	.word	.LANCHOR0
	.word	drawFullscreenImage4
	.word	start2Bitmap
	.word	.LANCHOR0+1024
	.word	startBitmap
	.size	start, .-start
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
	mov	r3, #256
	ldr	r4, .L36
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L36+4
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L36+8
	ldr	r1, .L36+12
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L36+16
	ldr	r1, .L36+20
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L36+24
	ldr	r1, .L36+28
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L36+32
	ldr	r1, .L36+36
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L36+40
	ldr	r1, .L36+44
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r0, .L36+40
.L31:
	lsl	r1, r3, #1
	ldrh	r2, [r0, r1]
	add	r3, r3, #1
	orr	r2, r2, #4096
	cmp	r3, #4096
	strh	r2, [r0, r1]	@ movhi
	bne	.L31
	mov	r3, #67108864
	mov	ip, #0
	mov	r2, #7424
	ldr	r4, .L36+48
	ldr	r1, [r4, #1036]
	ldr	r0, .L36+52
	cmp	r1, #3
	ldr	r1, .L36+56
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #14]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	strh	r2, [r3]	@ movhi
	beq	.L35
	mov	r3, #4
	str	r3, [r4, #1024]
	pop	{r4, lr}
	bx	lr
.L35:
	ldr	r3, .L36+60
	mov	lr, pc
	bx	r3
	mov	r3, #4
	str	r3, [r4, #1024]
	pop	{r4, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	DMANow
	.word	stage2SkyBGPal
	.word	83886112
	.word	trainPal
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
	mov	r3, #256
	ldr	r4, .L42
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L42+4
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L42+8
	ldr	r1, .L42+12
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L42+16
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L42+20
	ldr	r1, .L42+24
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r0, #0
	mov	r2, #6400
	ldr	r4, .L42+28
	ldr	ip, [r4, #1036]
	ldr	r1, .L42+32
	cmp	ip, #4
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	strh	r2, [r3]	@ movhi
	beq	.L41
	mov	r3, #5
	str	r3, [r4, #1024]
	pop	{r4, lr}
	bx	lr
.L41:
	ldr	r3, .L42+36
	mov	lr, pc
	bx	r3
	mov	r3, #5
	str	r3, [r4, #1024]
	pop	{r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	DMANow
	.word	stage3TilesetPal
	.word	100679680
	.word	stage3TilesetTiles
	.word	gameTilesTiles
	.word	100704256
	.word	stage3Map
	.word	.LANCHOR0
	.word	21508
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
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r1, #6144
	mov	ip, #6
	ldrh	r2, [r3]
	ldr	r0, .L45
	orr	r2, r2, #512
	strh	r2, [r3]	@ movhi
	str	ip, [r0, #1024]
	strh	r1, [r3, #10]	@ movhi
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.size	goToPause, .-goToPause
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
	ldr	r2, .L49
	ldr	r3, .L49+4
	ldr	r4, .L49+8
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L49+12
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	ip, .L49+16
	strh	r5, [r1]	@ movhi
	mov	r2, #100663296
	strh	ip, [r1]	@ movhi
	mov	r0, #3
	mov	r1, r5
	ldr	r3, .L49+20
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r0, #3
	ldr	r3, .L49+20
	ldr	r2, .L49+24
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L49+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L49+32
	ldr	r0, .L49+36
	mov	lr, pc
	bx	r3
	mov	r3, #7
	ldr	r2, .L49+12
	pop	{r4, r5, r6, lr}
	str	r3, [r2, #1024]
	bx	lr
.L50:
	.align	2
.L49:
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
	ldr	r3, .L56
	ldrh	r2, [r3, #8]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #10]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L57:
	.align	2
.L56:
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
	ldr	r2, .L60
	ldr	r3, .L60+4
	ldr	r4, .L60+8
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L60+12
	mov	lr, pc
	bx	r4
	mov	r1, #67108864
	ldr	ip, .L60+16
	strh	r5, [r1]	@ movhi
	mov	r2, #100663296
	strh	ip, [r1]	@ movhi
	mov	r0, #3
	mov	r1, r5
	ldr	r3, .L60+20
	mov	lr, pc
	bx	r4
	mov	r1, r5
	mov	r0, #3
	ldr	r3, .L60+20
	ldr	r2, .L60+24
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L60+28
	mov	lr, pc
	bx	r4
	ldr	r3, .L60+32
	ldr	r0, .L60+36
	mov	lr, pc
	bx	r3
	mov	r3, #8
	ldr	r2, .L60+12
	pop	{r4, r5, r6, lr}
	str	r3, [r2, #1024]
	bx	lr
.L61:
	.align	2
.L60:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L73
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+36
	mov	lr, pc
	bx	r3
	ldr	r4, .L73+40
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L73+44
	mov	lr, pc
	bx	r4
	ldr	lr, .L73+44
	add	r3, lr, #1024
	ldrh	r2, [r3, #8]
	tst	r2, #8
	beq	.L63
	ldrh	r3, [r3, #10]
	tst	r3, #8
	beq	.L70
.L63:
	ldr	r3, .L73+48
	ldr	r3, [r3, #76]
	cmp	r3, #0
	ble	.L71
.L64:
	ldr	r3, .L73+52
	ldr	r3, [r3, #76]
	cmp	r3, #0
	ble	.L72
.L62:
	pop	{r4, lr}
	bx	lr
.L70:
	mov	r3, #67108864
	mov	r0, #3
	mov	r1, #6144
	mov	ip, #6
	ldrh	r2, [r3]
	orr	r2, r2, #512
	str	ip, [lr, #1024]
	strh	r2, [r3]	@ movhi
	str	r0, [lr, #1036]
	strh	r1, [r3, #10]	@ movhi
	ldr	r3, .L73+48
	ldr	r3, [r3, #76]
	cmp	r3, #0
	bgt	.L64
.L71:
	mov	r3, #3
	ldr	r2, .L73+44
	str	r3, [r2, #1036]
	bl	goToStage2
	ldr	r3, .L73+52
	ldr	r3, [r3, #76]
	cmp	r3, #0
	bgt	.L62
.L72:
	pop	{r4, lr}
	b	goToLose
.L74:
	.align	2
.L73:
	.word	drawPortraits
	.word	updateHealthbars
	.word	checkPosition
	.word	updatePlayer
	.word	updateOpp
	.word	updateCamera
	.word	calculateAttackHitboxes
	.word	drawPlayer
	.word	drawOpp
	.word	waitForVBlank
	.word	DMANow
	.word	.LANCHOR0
	.word	opp
	.word	player
	.size	stage1, .-stage1
	.align	2
	.global	stage2
	.syntax unified
	.arm
	.type	stage2, %function
stage2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L86
	ldr	r3, [r4, #1040]
	ldr	r2, .L86+4
	add	r3, r3, #4
	str	r3, [r4, #1040]
	mov	lr, pc
	bx	r2
	ldr	r3, .L86+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L86+36
	mov	lr, pc
	bx	r3
	ldr	r5, .L86+40
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	mov	r1, r4
	mov	lr, pc
	bx	r5
	add	r3, r4, #1024
	ldrh	r2, [r3, #8]
	tst	r2, #8
	beq	.L76
	ldrh	r3, [r3, #10]
	tst	r3, #8
	beq	.L83
.L76:
	ldr	r3, .L86+44
	ldr	r3, [r3, #76]
	cmp	r3, #0
	ble	.L84
.L77:
	ldr	r3, .L86+48
	ldr	r3, [r3, #76]
	cmp	r3, #0
	ble	.L85
.L75:
	pop	{r4, r5, r6, lr}
	bx	lr
.L83:
	mov	r3, #67108864
	mov	r0, #4
	mov	r1, #6144
	mov	ip, #6
	ldrh	r2, [r3]
	orr	r2, r2, #512
	str	ip, [r4, #1024]
	strh	r2, [r3]	@ movhi
	str	r0, [r4, #1036]
	strh	r1, [r3, #10]	@ movhi
	ldr	r3, .L86+44
	ldr	r3, [r3, #76]
	cmp	r3, #0
	bgt	.L77
.L84:
	mov	r2, #67108864
	mov	r1, #4
	ldrh	r3, [r2]
	str	r1, [r4, #1036]
	strh	r3, [r2]	@ movhi
	bl	goToStage3
	ldr	r3, .L86+48
	ldr	r3, [r3, #76]
	cmp	r3, #0
	bgt	.L75
.L85:
	pop	{r4, r5, r6, lr}
	b	goToLose
.L87:
	.align	2
.L86:
	.word	.LANCHOR0
	.word	updateHealthbars
	.word	checkPosition
	.word	updatePlayer
	.word	updateOpp
	.word	updateCamera
	.word	calculateAttackHitboxes
	.word	drawPlayer
	.word	drawOpp
	.word	waitForVBlank
	.word	DMANow
	.word	opp
	.word	player
	.size	stage2, .-stage2
	.align	2
	.global	stage3
	.syntax unified
	.arm
	.type	stage3, %function
stage3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L99
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L99+32
	mov	lr, pc
	bx	r3
	ldr	r4, .L99+36
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L99+40
	mov	lr, pc
	bx	r4
	ldr	lr, .L99+40
	add	r3, lr, #1024
	ldrh	r2, [r3, #8]
	tst	r2, #8
	beq	.L89
	ldrh	r3, [r3, #10]
	tst	r3, #8
	beq	.L96
.L89:
	ldr	r3, .L99+44
	ldr	r3, [r3, #76]
	cmp	r3, #0
	ble	.L97
.L90:
	ldr	r3, .L99+48
	ldr	r3, [r3, #76]
	cmp	r3, #0
	ble	.L98
.L88:
	pop	{r4, lr}
	bx	lr
.L96:
	mov	r3, #67108864
	mov	r0, #5
	mov	r1, #6144
	mov	ip, #6
	ldrh	r2, [r3]
	orr	r2, r2, #512
	str	ip, [lr, #1024]
	strh	r2, [r3]	@ movhi
	str	r0, [lr, #1036]
	strh	r1, [r3, #10]	@ movhi
	ldr	r3, .L99+44
	ldr	r3, [r3, #76]
	cmp	r3, #0
	bgt	.L90
.L97:
	bl	goToWin
	ldr	r3, .L99+48
	ldr	r3, [r3, #76]
	cmp	r3, #0
	bgt	.L88
.L98:
	pop	{r4, lr}
	b	goToLose
.L100:
	.align	2
.L99:
	.word	updateHealthbars
	.word	checkPosition
	.word	updatePlayer
	.word	updateOpp
	.word	updateCamera
	.word	calculateAttackHitboxes
	.word	drawPlayer
	.word	drawOpp
	.word	waitForVBlank
	.word	DMANow
	.word	.LANCHOR0
	.word	opp
	.word	player
	.size	stage3, .-stage3
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
	ldr	r3, .L106
	ldrh	r2, [r3, #8]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #10]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L107:
	.align	2
.L106:
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
	ldr	lr, .L110
	strh	r1, [ip]	@ movhi
	ldr	r4, .L110+4
	strh	lr, [ip]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r3, .L110+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r1, #0
	ldr	r3, .L110+8
	ldr	r2, .L110+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L111:
	.align	2
.L110:
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
	ldr	r4, .L114
	strh	lr, [ip]	@ movhi
	mov	r3, #256
	strh	lr, [ip]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L114+4
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L114+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L114+12
	ldr	r1, .L114+16
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L114+20
	ldr	r1, .L114+24
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L114+28
	ldr	r1, .L114+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L114+36
	ldr	r1, .L114+40
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L114+44
	ldr	r1, .L114+48
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L114+52
	ldr	r1, .L114+56
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L114+60
	mov	lr, pc
	bx	r3
	ldr	r3, .L114+64
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L114+68
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L115:
	.align	2
.L114:
	.word	DMANow
	.word	gameTilesPal
	.word	gameTilesTiles
	.word	100724736
	.word	cssMap
	.word	100718592
	.word	stage1Map
	.word	100704256
	.word	stage3Map
	.word	100712448
	.word	pauseMap
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	waitForVBlank
	.word	.LANCHOR0
	.size	switchMode0, .-switchMode0
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
	bl	switchMode0
	mov	r5, #67108864
	mov	ip, #6144
	ldr	r4, .L118
	strh	ip, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L118+4
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L118+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L118+12
	ldr	r1, .L118+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #7680
	mov	r2, #2
	ldr	r3, .L118+20
	strh	r1, [r5, #14]	@ movhi
	str	r2, [r3, #1024]
	pop	{r4, r5, r6, lr}
	bx	lr
.L119:
	.align	2
.L118:
	.word	DMANow
	.word	gameTilesPal
	.word	gameTilesTiles
	.word	100724736
	.word	cssMap
	.word	.LANCHOR0
	.size	goToCSS, .-goToCSS
	.align	2
	.global	goToStage1
	.syntax unified
	.arm
	.type	goToStage1, %function
goToStage1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	switchMode0
	ldr	r4, .L122
	mov	r3, #8192
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L122+4
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L122+8
	ldr	r1, .L122+12
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L122+16
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L122+20
	ldr	r1, .L122+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L122+28
	ldr	r1, .L122+32
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #3
	mov	r1, #7424
	mov	r2, #6400
	ldr	r0, .L122+36
	ldr	ip, .L122+40
	str	lr, [ip, #1024]
	strh	r0, [r3, #14]	@ movhi
	pop	{r4, lr}
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	bx	lr
.L123:
	.align	2
.L122:
	.word	DMANow
	.word	gameTilesTiles
	.word	100679680
	.word	stage1TilesTiles
	.word	stage1TilesPal
	.word	100724736
	.word	stage1Map
	.word	100722688
	.word	uiMap
	.word	24068
	.word	.LANCHOR0
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
	ldr	r3, .L132
	ldrh	r2, [r3, #8]
	tst	r2, #8
	bxeq	lr
	ldrh	r3, [r3, #10]
	tst	r3, #8
	bxne	lr
	push	{r4, lr}
	ldr	r3, .L132+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToStage1
.L133:
	.align	2
.L132:
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L152
	ldrh	r2, [r3, #8]
	tst	r2, #8
	beq	.L144
	ldrh	r1, [r3, #10]
	tst	r1, #8
	beq	.L150
.L144:
	tst	r2, #4
	bxeq	lr
	ldrh	r3, [r3, #10]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L150:
	ldr	r2, .L152+4
	push	{r4, lr}
	mov	lr, pc
	bx	r2
	bl	goToStage1
	ldr	r3, .L152
	ldrh	r2, [r3, #8]
	tst	r2, #4
	beq	.L134
	ldrh	r3, [r3, #10]
	tst	r3, #4
	beq	.L151
.L134:
	pop	{r4, lr}
	bx	lr
.L151:
	pop	{r4, lr}
	b	goToStart
.L153:
	.align	2
.L152:
	.word	.LANCHOR0+1024
	.word	initGame
	.size	instructions, .-instructions
	.align	2
	.global	pause
	.syntax unified
	.arm
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L177
	add	r3, r1, #1024
	ldrh	r2, [r3, #8]
	tst	r2, #8
	beq	.L167
	ldrh	r0, [r3, #10]
	tst	r0, #8
	bne	.L167
	ldr	r2, [r1, #1036]
	cmp	r2, #3
	push	{r4, lr}
	beq	.L174
.L156:
	cmp	r2, #4
	beq	.L175
.L157:
	cmp	r2, #5
	beq	.L158
.L173:
	ldrh	r2, [r3, #8]
	tst	r2, #4
	beq	.L154
	ldrh	r3, [r3, #10]
	tst	r3, #4
	beq	.L176
.L154:
	pop	{r4, lr}
	bx	lr
.L167:
	tst	r2, #4
	bxeq	lr
	ldrh	r3, [r3, #10]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L176:
	pop	{r4, lr}
	b	goToStart
.L174:
	mov	r0, #67108864
	ldrh	r2, [r0]
	bic	r2, r2, #512
	strh	r2, [r0]	@ movhi
	bl	goToStage1
	ldr	r1, .L177
	ldr	r2, [r1, #1036]
	add	r3, r1, #1024
	b	.L156
.L158:
	mov	r1, #67108864
	ldrh	r2, [r1]
	bic	r2, r2, #512
	strh	r2, [r1]	@ movhi
	bl	goToStage3
	ldr	r3, .L177+4
	b	.L173
.L175:
	mov	r0, #67108864
	ldrh	r2, [r0]
	bic	r2, r2, #512
	strh	r2, [r0]	@ movhi
	bl	goToStage2
	ldr	r1, .L177
	ldr	r2, [r1, #1036]
	add	r3, r1, #1024
	b	.L157
.L178:
	.align	2
.L177:
	.word	.LANCHOR0
	.word	.LANCHOR0+1024
	.size	pause, .-pause
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
	ldr	r4, .L214
	mov	fp, r4
	ldr	r3, .L214+4
	mov	lr, pc
	bx	r3
	ldr	r5, .L214+8
	ldr	r1, [fp, #1024]!
	ldr	r2, [r5]
	ldr	r9, .L214+12
	ldr	r8, .L214+16
	ldr	r6, .L214+20
	ldrh	r0, [fp, #10]
.L180:
	strh	r0, [fp, #8]	@ movhi
	ldrh	r3, [r6, #48]
	lsl	r2, r2, #16
	cmp	r1, #4
	strh	r3, [fp, #10]	@ movhi
	lsr	r0, r2, #16
	beq	.L212
.L181:
	cmp	r1, #6
	beq	.L184
	mov	r7, #67108864
.L185:
	strh	r0, [r7, #28]	@ movhi
	cmp	r1, #8
	bhi	.L203
	ldrb	r3, [r8, r1]
	add	pc, pc, r3, lsl #2
.Lrtx188:
	nop
	.section	.rodata
.L188:
	.byte	(.L195-.Lrtx188-4)/4
	.byte	(.L194-.Lrtx188-4)/4
	.byte	(.L193-.Lrtx188-4)/4
	.byte	(.L192-.Lrtx188-4)/4
	.byte	(.L203-.Lrtx188-4)/4
	.byte	(.L191-.Lrtx188-4)/4
	.byte	(.L190-.Lrtx188-4)/4
	.byte	(.L187-.Lrtx188-4)/4
	.byte	(.L187-.Lrtx188-4)/4
	.section	.text.startup
	.p2align 2
.L187:
	ldrh	r3, [fp, #8]
	tst	r3, #8
	ldrh	r3, [fp, #10]
	beq	.L201
	ands	r10, r3, #8
	beq	.L213
.L201:
	strh	r3, [fp, #8]	@ movhi
	ldrh	r3, [r6, #48]
	lsr	r0, r2, #16
.L182:
	strh	r3, [fp, #10]	@ movhi
	b	.L185
.L184:
	ldr	r3, [r4, #1036]
	cmp	r3, #4
	moveq	r2, #67108864
	movne	r3, #67108864
	ldreq	r3, [r4, #1040]
	lsleq	r3, r3, #16
	lsreq	r3, r3, #16
	strheq	r0, [r2, #24]	@ movhi
	strhne	r0, [r3, #28]	@ movhi
	strheq	r3, [r2, #28]	@ movhi
.L190:
	ldr	r3, .L214+24
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #10]
	ldr	r2, [r5]
	b	.L180
.L191:
	ldr	r3, .L214+28
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #10]
	ldr	r2, [r5]
	b	.L180
.L192:
	ldr	r3, .L214+32
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #10]
	ldr	r2, [r5]
	b	.L180
.L193:
	ldrh	r3, [fp, #8]
	tst	r3, #8
	ldrh	r3, [fp, #10]
	beq	.L197
	tst	r3, #8
	bne	.L201
	ldr	r3, .L214+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L214+40
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #10]
	ldr	r2, [r5]
	b	.L180
.L194:
	ldr	r3, .L214+44
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #10]
	ldr	r2, [r5]
	b	.L180
.L195:
	ldr	r3, .L214+48
	mov	lr, pc
	bx	r3
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #10]
	ldr	r2, [r5]
	b	.L180
.L212:
	mov	r2, #67108864
	ldr	r3, [r4, #1040]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r0, [r2, #24]	@ movhi
	strh	r3, [r2, #28]	@ movhi
	mov	lr, pc
	bx	r9
	ldr	r1, [r4, #1024]
	ldrh	r0, [fp, #10]
	ldr	r2, [r5]
	b	.L180
.L197:
	strh	r3, [fp, #8]	@ movhi
	ldrh	r3, [r6, #48]
	lsr	r0, r2, #16
	strh	r3, [fp, #10]	@ movhi
	b	.L181
.L213:
	mov	ip, #67108864
	ldr	lr, .L214+52
	str	r10, [r5]
	mov	r2, #100663296
	strh	r10, [ip]	@ movhi
	mov	r1, r10
	strh	lr, [ip]	@ movhi
	mov	r0, #3
	ldr	r3, .L214+56
	ldr	ip, .L214+60
	mov	lr, pc
	bx	ip
	mov	r0, #3
	mov	r1, r10
	ldr	r3, .L214+56
	ldr	r2, .L214+64
	ldr	ip, .L214+60
	mov	lr, pc
	bx	ip
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L214+68
	ldr	ip, .L214+60
	mov	lr, pc
	bx	ip
	ldrh	r3, [fp, #10]
	ldr	r2, [r5]
	strh	r3, [fp, #8]	@ movhi
	lsl	r2, r2, #16
	mov	r1, r10
	str	r10, [r4, #1024]
	ldrh	r3, [r6, #48]
	lsr	r0, r2, #16
	b	.L182
.L203:
	mov	ip, #67108864
	ldr	r1, .L214+20
.L186:
	ldrh	r3, [fp, #10]
	strh	r3, [fp, #8]	@ movhi
	ldrh	r3, [r1, #48]
	strh	r3, [fp, #10]	@ movhi
	strh	r0, [ip, #28]	@ movhi
	b	.L186
.L215:
	.align	2
.L214:
	.word	.LANCHOR0
	.word	initialize
	.word	hOff
	.word	stage2
	.word	.L188
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
	.global	shadowOAM
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
	.type	bgScroll, %object
	.size	bgScroll, 4
bgScroll:
	.space	4
	.ident	"GCC: (devkitARM release 66) 15.1.0"
