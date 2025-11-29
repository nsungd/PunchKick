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
	ldr	r3, .L4
	ldr	r1, .L4+4
	push	{r10, fp}
	mov	r2, #1
	mov	r0, #32
	mov	r10, #160
	mov	fp, #96
	str	r1, [r3, #76]
	str	r1, [r3, #212]
	mov	r1, #10
	mov	ip, #16
	stm	r3, {r10-fp}
	str	r2, [r3, #16]
	mov	r10, #0
	mov	fp, #1
	str	r2, [r3, #20]
	str	r0, [r3, #28]
	str	r2, [r3, #96]
	str	r2, [r3, #112]
	str	r2, [r3, #128]
	str	r2, [r3, #152]
	str	r2, [r3, #156]
	str	r0, [r3, #164]
	mov	r2, #0
	mov	r0, #224
	str	r1, [r3, #108]
	mov	r1, #96
	str	r10, [r3, #248]
	str	fp, [r3, #252]
	str	r0, [r3, #136]
	str	r1, [r3, #140]
	str	ip, [r3, #24]
	str	ip, [r3, #160]
	str	r2, [r3, #64]
	str	r2, [r3, #120]
	str	r2, [r3, #116]
	str	r2, [r3, #104]
	str	r2, [r3, #232]
	pop	{r10, fp}
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.word	1100
	.size	initGame, .-initGame
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
	ldr	r3, .L9
	ldr	r1, [r3]
	ldr	r2, [r3, #136]
	cmp	r1, r2
	bge	.L7
	mov	r1, #1
	mov	r2, #0
	str	r1, [r3, #96]
	str	r2, [r3, #232]
	bx	lr
.L7:
	movgt	r1, #0
	movgt	r2, #1
	strgt	r1, [r3, #96]
	strgt	r2, [r3, #232]
	bx	lr
.L10:
	.align	2
.L9:
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
	push	{r4, r5, lr}
	mov	r1, #0
	mov	r4, #16384
	mov	lr, #288
	ldr	r3, .L13
	ldr	r5, .L13+4
	add	r2, r3, #1016
	ldr	ip, .L13+8
	add	r0, r3, #1008
	strh	r1, [r2]	@ movhi
	strh	r4, [r2, #2]	@ movhi
	add	r2, r3, #1020
	add	r3, r3, #1012
	strh	r5, [r0, #2]	@ movhi
	strh	lr, [r2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	ip, [r3]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	shadowOAM
	.word	16608
	.word	290
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
	ldr	r3, .L39
	push	{r4, lr}
	ldr	r2, [r3, #116]
	ldr	r4, .L39+4
	lsl	r0, r2, #3
	add	r1, r4, r2, lsl #3
	ldr	r2, [r3, #8]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	ip, r2, lsl #17
	mvn	ip, ip, lsr #17
	ldr	lr, [r3, #96]
	cmp	lr, #0
	orreq	r2, r2, #36864
	strh	ip, [r1, #2]	@ movhi
	strheq	r2, [r1, #2]	@ movhi
	ldr	r1, [r3, #48]
	ldrb	lr, [r3, #4]	@ zero_extendqisi2
	cmp	r1, #0
	strh	lr, [r4, r0]	@ movhi
	beq	.L17
	mov	r2, #12
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
.L18:
	ldr	r2, [r3, #92]
	cmp	r2, #0
	ble	.L26
.L38:
	add	r2, r2, #1
	cmp	r2, #3
	mov	r0, #31
	movgt	r2, #0
	ldr	r1, .L39+8
	pop	{r4, lr}
	strh	r0, [r1, #6]	@ movhi
	str	r2, [r3, #92]
	bx	lr
.L17:
	ldr	ip, [r3, #64]
	cmp	ip, #0
	beq	.L19
	ldr	r2, [r3, #120]
	cmp	r2, #0
	beq	.L19
	ldr	ip, [r3, #72]
	cmp	ip, #1
	beq	.L37
	cmp	ip, #4
	bne	.L18
	ldr	ip, [r3, #68]
	ldr	r1, [r2, #8]
	cmp	ip, r1
	ble	.L24
	ldr	r2, [r2]
	add	r1, r1, r2
	cmp	ip, r1
	bgt	.L24
	mov	r2, #24
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L18
.L19:
	ldr	r1, [r3, #100]
	cmp	r1, #0
	ldrne	r2, [r3, #104]
	lslne	r2, r2, #2
	andne	r2, r2, #1020
	addeq	r2, r4, r0
	addne	r0, r4, r0
	strhne	r2, [r0, #4]	@ movhi
	strheq	r1, [r2, #4]	@ movhi
	ldr	r2, [r3, #92]
	cmp	r2, #0
	bgt	.L38
.L26:
	ldr	r3, .L39+8
	ldr	r2, .L39+12
	pop	{r4, lr}
	strh	r2, [r3, #6]	@ movhi
	bx	lr
.L37:
	ldr	lr, [r3, #68]
	ldr	ip, [r2, #8]
	cmp	lr, ip
	ble	.L22
	ldr	r2, [r2]
	add	ip, ip, r2
	cmp	lr, ip
	movle	r2, #16
	addle	r0, r4, r0
	strhle	r2, [r0, #4]	@ movhi
	ble	.L18
.L22:
	add	r0, r4, r0
	strh	r1, [r0, #4]	@ movhi
	b	.L18
.L24:
	mov	r2, #20
	add	r0, r4, r0
	strh	r2, [r0, #4]	@ movhi
	b	.L18
.L40:
	.align	2
.L39:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	83886592
	.word	10878
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
	ldr	r3, .L54
	ldr	r0, .L54+4
	ldr	r2, [r3, #252]
	push	{r4, lr}
	add	r1, r0, r2, lsl #3
	lsl	lr, r2, #3
	ldr	r2, [r3, #144]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	ip, r2, lsl #17
	mvn	ip, ip, lsr #17
	ldr	r4, [r3, #232]
	cmp	r4, #0
	orreq	r2, r2, #36864
	strh	ip, [r1, #2]	@ movhi
	strheq	r2, [r1, #2]	@ movhi
	ldr	r2, [r3, #200]
	ldrb	r4, [r3, #140]	@ zero_extendqisi2
	cmp	r2, #0
	strh	r4, [r0, lr]	@ movhi
	beq	.L43
	ldr	r2, [r3, #208]
	cmp	r2, #1
	beq	.L52
.L44:
	ldr	r2, [r3, #228]
	cmp	r2, #0
	ble	.L47
.L53:
	add	r2, r2, #1
	cmp	r2, #3
	mov	r0, #31
	movgt	r2, #0
	ldr	r1, .L54+8
	pop	{r4, lr}
	strh	r0, [r1, #16]	@ movhi
	str	r2, [r3, #228]
	bx	lr
.L43:
	mov	r2, #128
	add	r0, r0, lr
	strh	r2, [r0, #4]	@ movhi
	ldr	r2, [r3, #228]
	cmp	r2, #0
	bgt	.L53
.L47:
	ldr	r3, .L54+8
	ldr	r2, .L54+12
	pop	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	bx	lr
.L52:
	ldr	ip, [r3, #256]
	ldr	r1, [r3, #204]
	ldr	r2, [ip, #8]
	cmp	r1, r2
	ble	.L46
	ldr	ip, [ip]
	add	r2, r2, ip
	cmp	r1, r2
	movle	r2, #136
	addle	lr, r0, lr
	strhle	r2, [lr, #4]	@ movhi
	ble	.L44
.L46:
	mov	r2, #132
	add	lr, r0, lr
	strh	r2, [lr, #4]	@ movhi
	b	.L44
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	shadowOAM
	.word	83886592
	.word	28440
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
	ldr	r2, .L57
	ldr	r1, [r2, #136]
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
	str	r3, [r2, #264]
	str	r0, [r2, #8]
	str	r1, [r2, #144]
	bx	lr
.L58:
	.align	2
.L57:
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
	push	{r4, r5, r6, lr}
	ldr	r2, [r1, #28]
	ldr	r3, [r1, #24]
	sub	sp, sp, #16
	str	r2, [sp, #12]
	str	r3, [sp, #8]
	ldr	r2, [r1, #40]
	ldr	r3, [r1, #32]
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r4, r0
	ldr	r3, [r0, #44]
	ldr	r2, [r0, #48]
	add	r0, r0, #36
	mov	r5, r1
	ldr	r6, .L68
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L59
	ldr	r3, [r4, #32]
	cmp	r3, #0
	bne	.L59
	ldr	r2, [r5, #52]
	ldr	r3, [r4, #24]
	cmp	r2, r3
	beq	.L61
	subs	r2, r2, #0
	movne	r2, #1
	cmp	r3, #3
	movne	r2, #0
	cmp	r2, #0
	bne	.L61
	mov	ip, #1
	ldr	r1, [r4, #20]
	ldr	r3, [r5, #76]
	sub	r3, r3, r1
	str	r3, [r5, #76]
	ldr	r3, .L68+4
	ldr	r1, [r3]
	str	ip, [r5, #92]
	ldr	r0, .L68+8
	ldr	r3, .L68+12
	str	ip, [r4, #32]
	sub	r1, r1, #25
	mov	lr, pc
	bx	r3
.L63:
	str	r4, [r5, #124]
.L59:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	mov	r3, #1
	str	r3, [r5, #56]
	str	r3, [r4, #32]
	b	.L63
.L69:
	.align	2
.L68:
	.word	collision
	.word	hit_length
	.word	hit_data
	.word	playSoundB
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
	mov	r3, #0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L146
	ldr	r2, [r4, #96]
	ldr	r0, [r4]
	cmp	r2, #1
	ldr	r2, [r4, #24]
	addne	r0, r0, #16
	sub	sp, sp, #20
	str	r3, [r4, #100]
	str	r3, [r4, #52]
	add	r3, r2, r0
	sub	r3, r3, #1
	ldr	r1, [r4, #4]
	str	r3, [r4, #36]
	ldr	r3, [r4, #28]
	ldr	r6, [r4, #64]
	add	ip, r1, r3
	sub	r7, ip, #1
	cmp	r6, #0
	str	r0, [r4, #32]
	str	r1, [r4, #40]
	str	r7, [r4, #44]
	beq	.L131
	ldr	r5, .L146+4
.L85:
	ldr	r3, [r4, #56]
	cmp	r3, #0
	beq	.L139
.L87:
	ldr	r3, [r4, #96]
	cmp	r3, #1
	movls	r3, #0
	strls	r3, [r4, #56]
	ldr	r3, [r4, #100]
	cmp	r3, #0
	streq	r3, [r4, #104]
	beq	.L102
.L91:
	ldr	r3, [r4, #108]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #108]
	bne	.L102
	ldr	r2, [r4, #104]
	ldr	r3, .L146+8
	add	r2, r2, #1
	smull	r1, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	sub	r2, r2, r3
	mov	r3, #10
	str	r2, [r4, #104]
	str	r3, [r4, #108]
.L102:
	cmp	r6, #0
	bne	.L98
.L96:
	mov	r3, #0
	str	r3, [r4, #68]
.L104:
	add	r2, r4, #28
	ldm	r2, {r2, r3}
	ldr	r1, [r4, #4]
	add	r2, r1, r2
	add	r3, r3, r2, lsl #9
	ldrb	r3, [r5, r3]	@ zero_extendqisi2
	cmp	r3, #1
	ldreq	r3, [r4, #20]
	addeq	r3, r3, r1
	streq	r3, [r4, #4]
.L70:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L139:
	ldr	r3, [r4, #100]
	cmp	r3, #0
	streq	r3, [r4, #104]
	bne	.L140
.L98:
	ldr	r0, [r4, #120]
	ldr	r3, [r4, #68]
	ldr	r2, [r0, #12]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #68]
	blt	.L103
	mov	r3, #0
	str	r3, [r4, #64]
	str	r3, [r4, #120]
	b	.L104
.L131:
	ldr	lr, [r4, #56]
	ldr	r5, [r4, #48]
	orrs	r5, lr, r5
	beq	.L132
	ldr	r5, .L146+4
.L73:
	cmp	lr, #0
	bne	.L87
	ldr	r3, .L146+12
	ldrh	r2, [r3]
	and	r3, r2, #128
	rsbs	r1, r3, #1
	movcc	r1, #0
	cmp	r3, #0
	str	r1, [r4, #48]
	ldr	r3, [r4, #100]
	bne	.L88
	ldr	r1, [r4, #96]
	cmp	r1, #1
	beq	.L141
	cmp	r1, #0
	bne	.L88
	tst	r2, #16
	bne	.L93
	mov	r2, #2
	cmp	r3, #0
	str	r2, [r4, #52]
	beq	.L95
.L94:
	ldr	r3, [r4, #108]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #108]
	bne	.L96
	mov	r1, #10
	ldr	r2, [r4, #104]
	ldr	r3, .L146+8
	add	r2, r2, #1
	smull	r0, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	sub	r2, r2, r3
	str	r2, [r4, #104]
	str	r1, [r4, #108]
	b	.L96
.L103:
	ldr	r1, [r0, #8]
	ldr	ip, [r0]
	add	r1, r1, ip
	cmp	r3, r1
	blt	.L104
	ldr	r1, [r0, #4]
	sub	r2, r2, r1
	cmp	r3, r2
	bgt	.L104
	ldr	r1, .L146+16
	bl	spawnHitbox
	b	.L104
.L132:
	ldr	lr, .L146+20
	ldrh	lr, [lr]
	tst	lr, #64
	ldr	lr, .L146+12
	ldrh	lr, [lr]
	beq	.L137
	tst	lr, #64
	beq	.L134
.L137:
	ldr	r5, .L146+4
.L74:
	tst	lr, #32
	bne	.L75
	ldr	ip, [r4, #16]
	sub	r0, r0, ip
	add	ip, r0, r1, lsl #9
	ldrb	ip, [r5, ip]	@ zero_extendqisi2
	cmp	ip, #1
	beq	.L142
.L75:
	tst	lr, #16
	bne	.L80
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #36]
	ldr	r1, [r4, #40]
	add	r3, r2, r3
	add	r0, r3, r1, lsl #9
	ldrb	r0, [r5, r0]	@ zero_extendqisi2
	cmp	r0, #1
	beq	.L143
.L80:
	ldr	r3, .L146+20
	ldrh	r3, [r3]
	tst	r3, #1
	and	r3, r3, #2
	beq	.L83
	ldr	r2, .L146+12
	ldrh	r2, [r2]
	ands	r1, r2, #1
	bne	.L83
	mov	r6, #1
	cmp	r3, #0
	ldr	r3, .L146+24
	str	r6, [r4, #64]
	str	r1, [r3, #32]
	str	r3, [r4, #120]
	str	r6, [r4, #72]
	beq	.L85
	tst	r2, #2
	bne	.L85
.L107:
	mov	r3, #1
	mov	r1, #4
	mov	r0, #0
	ldr	r2, .L146+28
	mov	r6, r3
	str	r2, [r4, #120]
	str	r0, [r2, #32]
	str	r3, [r4, #64]
	str	r1, [r4, #72]
	b	.L85
.L90:
	str	lr, [r4, #52]
.L88:
	cmp	r3, #0
	bne	.L94
.L95:
	mov	r3, #0
	str	r3, [r4, #104]
	b	.L96
.L140:
	ldr	r3, [r4, #108]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #108]
	bne	.L98
	mov	r1, #10
	ldr	r2, [r4, #104]
	ldr	r3, .L146+8
	add	r2, r2, #1
	smull	r0, r3, r2, r3
	sub	r3, r3, r2, asr #31
	add	r3, r3, r3, lsl #1
	sub	r2, r2, r3
	str	r2, [r4, #104]
	str	r1, [r4, #108]
	b	.L98
.L83:
	cmp	r3, #0
	bne	.L144
.L86:
	ldr	r3, [r4, #64]
	cmp	r3, #0
	ldr	lr, [r4, #56]
	beq	.L73
	mov	r6, r3
	b	.L85
.L134:
	ldr	r5, .L146+4
	add	ip, r0, ip, lsl #9
	ldrb	ip, [r5, ip]	@ zero_extendqisi2
	cmp	ip, #0
	subeq	ip, r1, #60
	streq	ip, [r4, #4]
	b	.L74
.L93:
	cmp	r3, #0
	str	lr, [r4, #52]
	bne	.L94
	b	.L95
.L143:
	ldr	r0, [r4, #44]
	add	r3, r3, r0, lsl #9
	ldrb	r7, [r5, r3]	@ zero_extendqisi2
	cmp	r7, #1
	bne	.L80
	ldr	r3, [r4, #164]
	ldr	r0, [r4, #32]
	str	r3, [sp, #12]
	ldr	r3, [r4, #160]
	str	r3, [sp, #8]
	ldr	r3, [r4, #176]
	str	r3, [sp, #4]
	ldr	r3, [r4, #168]
	str	r3, [sp]
	add	r0, r2, r0
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldr	ip, .L146+32
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L80
	ldr	r3, [r4, #8]
	cmp	r3, #239
	bgt	.L80
	ldr	r3, [r4, #96]
	cmp	r3, #0
	moveq	r0, r7
	ldr	r3, [r4]
	ldr	r2, [r4, #16]
	add	r3, r3, r2
	str	r7, [r4, #100]
	str	r0, [r4, #52]
	str	r3, [r4]
	b	.L80
.L142:
	add	r7, r0, r7, lsl #9
	ldrb	r7, [r5, r7]	@ zero_extendqisi2
	cmp	r7, #1
	bne	.L75
	ldr	ip, [r4, #164]
	str	ip, [sp, #12]
	ldr	ip, [r4, #160]
	str	ip, [sp, #8]
	ldr	ip, [r4, #176]
	str	ip, [sp, #4]
	ldr	ip, [r4, #168]
	str	ip, [sp]
	ldr	ip, .L146+32
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L138
	ldr	r3, [r4, #8]
	cmp	r3, #0
	ble	.L138
	ldr	r3, [r4]
	ldr	r2, [r4, #16]
	sub	r3, r3, r2
	str	r3, [r4]
	ldr	r3, [r4, #96]
	cmp	r3, #1
	str	r7, [r4, #100]
	strne	r0, [r4, #52]
	beq	.L145
.L138:
	ldr	r3, .L146+12
	ldrh	lr, [r3]
	b	.L75
.L141:
	tst	r2, #32
	bne	.L90
	mov	r2, #2
	cmp	r3, #0
	str	r2, [r4, #52]
	streq	lr, [r4, #104]
	beq	.L96
	mov	r6, lr
	b	.L91
.L144:
	ldr	r3, .L146+12
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L86
	b	.L107
.L145:
	str	r3, [r4, #52]
	ldr	r3, .L146+12
	ldrh	lr, [r3]
	b	.L75
.L147:
	.align	2
.L146:
	.word	.LANCHOR0
	.word	stage1CollisionBitmap
	.word	1431655766
	.word	buttons
	.word	.LANCHOR0+136
	.word	oldButtons
	.word	changmoPunch
	.word	changmoKick
	.word	collision
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateOpp
	.syntax unified
	.arm
	.type	updateOpp, %function
updateOpp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L161
	ldr	r2, [r3, #232]
	ldr	r0, [r3, #136]
	add	r1, r3, #160
	cmp	r2, #1
	ldm	r1, {r1, r2}
	addne	r0, r0, #16
	add	r1, r0, r1
	ldr	ip, [r3, #140]
	sub	r1, r1, #1
	str	r1, [r3, #172]
	ldr	r1, [r3, #200]
	add	r2, ip, r2
	sub	r2, r2, #1
	cmp	r1, #0
	str	r0, [r3, #168]
	str	ip, [r3, #176]
	str	r2, [r3, #180]
	bne	.L150
	ldr	r2, [r3, #268]
	add	r2, r2, #1
	cmp	r2, #179
	str	r2, [r3, #268]
	ble	.L151
	mov	ip, #1
	ldr	r2, .L161+4
	str	r1, [r3, #268]
	mov	r0, r2
	str	r2, [r3, #256]
	str	r1, [r2, #32]
	str	ip, [r3, #200]
	str	ip, [r3, #208]
	b	.L152
.L151:
	str	r1, [r3, #204]
	bx	lr
.L150:
	ldr	r0, [r3, #256]
.L152:
	ldr	r2, [r3, #204]
	ldr	r1, [r0, #12]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #204]
	blt	.L160
	mov	r2, #0
	str	r2, [r3, #200]
	str	r2, [r3, #256]
	bx	lr
.L160:
	ldr	r3, [r0, #8]
	ldr	ip, [r0]
	add	r3, r3, ip
	cmp	r2, r3
	bxlt	lr
	ldr	r3, [r0, #4]
	sub	r1, r1, r3
	cmp	r2, r1
	bxgt	lr
	ldr	r1, .L161
	b	spawnHitbox
.L162:
	.align	2
.L161:
	.word	.LANCHOR0
	.word	dummyPunch
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
	ldr	r3, .L171
	ldr	r2, [r3, #40]
	ldr	ip, .L171+4
	str	lr, [sp, #-4]!
	ldr	r0, .L171+8
	add	lr, r2, #10
	ldr	r1, [r3, #96]
	str	lr, [ip, #40]
	add	ip, r2, #15
	str	ip, [r0, #40]
	ldr	r0, .L171+12
	add	r2, r2, #7
	cmp	r1, #1
	str	r2, [r0, #40]
	beq	.L169
	cmp	r1, #0
	ldreq	r1, [r3, #120]
	ldreq	r2, [r3, #32]
	ldreq	r0, [r1, #48]
	subeq	r2, r2, r0
	streq	r2, [r1, #36]
	ldr	r2, [r3, #232]
	cmp	r2, #1
	beq	.L170
.L166:
	cmp	r2, #0
	ldreq	r2, [r3, #256]
	ldreq	r3, [r3, #168]
	ldreq	r1, [r2, #48]
	subeq	r3, r3, r1
	streq	r3, [r2, #36]
	ldr	lr, [sp], #4
	bx	lr
.L169:
	ldr	r2, [r3, #120]
	ldr	r1, [r3, #36]
	str	r1, [r2, #36]
	ldr	r2, [r3, #232]
	cmp	r2, #1
	bne	.L166
.L170:
	ldr	r2, [r3, #256]
	ldr	r3, [r3, #172]
	ldr	lr, [sp], #4
	str	r3, [r2, #36]
	bx	lr
.L172:
	.align	2
.L171:
	.word	.LANCHOR0
	.word	changmoPunch
	.word	changmoKick
	.word	dummyPunch
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
	ldr	r2, .L197
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L197+4
	ldr	r6, .L197+8
	ldr	r5, [r2, #76]
	ldr	r4, [r2, #212]
	ldr	r0, .L197+12
	str	r1, [r6, #68]
	mov	r2, #22
	ldr	r7, .L197+16
	str	r1, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	strh	r1, [r3, #20]	@ movhi
	mov	lr, pc
	bx	r7
	cmp	r5, #0
	ble	.L175
	mov	r3, #44
	b	.L174
.L195:
	ldr	r1, .L197+20
	sub	r5, r5, #25
.L177:
	lsl	r2, r3, #1
	cmp	r5, #0
	strh	r1, [r6, r2]	@ movhi
	sub	r3, r3, #1
	beq	.L175
.L174:
	cmp	r5, #99
	movgt	r1, #162
	subgt	r5, r5, #100
	bgt	.L177
	cmp	r5, #74
	movgt	r1, #194
	subgt	r5, r5, #75
	bgt	.L177
	cmp	r5, #49
	movgt	r1, #226
	subgt	r5, r5, #50
	bgt	.L177
	cmp	r5, #24
	bgt	.L195
	mov	r1, #0
	ldr	r2, .L197+8
	lsl	r3, r3, #1
	strh	r1, [r2, r3]	@ movhi
.L175:
	cmp	r4, #0
	ble	.L173
	mov	r3, #49
	ldr	lr, .L197+24
	ldr	ip, .L197+28
	ldr	r0, .L197+8
	b	.L182
.L196:
	ldr	r1, .L197+32
	sub	r4, r4, #50
.L185:
	lsl	r2, r3, #1
	cmp	r4, #0
	strh	r1, [r0, r2]	@ movhi
	add	r3, r3, #1
	beq	.L173
.L182:
	cmp	r4, #99
	movgt	r1, ip
	subgt	r4, r4, #100
	bgt	.L185
	cmp	r4, #74
	movgt	r1, lr
	subgt	r4, r4, #75
	bgt	.L185
	cmp	r4, #49
	bgt	.L196
	cmp	r4, #24
	ldrgt	r1, .L197+36
	subgt	r4, r4, #25
	bgt	.L185
.L188:
	mov	r1, #1024
	ldr	r2, .L197+8
	lsl	r3, r3, #1
	strh	r1, [r2, r3]	@ movhi
.L173:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L198:
	.align	2
.L197:
	.word	.LANCHOR0
	.word	100722756
	.word	100722688
	.word	100722786
	.word	memset
	.word	258
	.word	1218
	.word	1186
	.word	1250
	.word	1282
	.size	updateHealthbars, .-updateHealthbars
	.global	damagedFrames
	.global	frameCounter
	.global	hOff
	.global	stage
	.global	DIRECTION
	.global	opp
	.global	player
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	player, %object
	.size	player, 128
player:
	.space	128
	.type	stage, %object
	.size	stage, 4
stage:
	.space	4
	.space	4
	.type	opp, %object
	.size	opp, 128
opp:
	.space	128
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	frameCounter, %object
	.size	frameCounter, 4
frameCounter:
	.space	4
	.type	damagedFrames, %object
	.size	damagedFrames, 4
damagedFrames:
	.space	4
	.type	DIRECTION, %object
	.size	DIRECTION, 1
DIRECTION:
	.space	1
	.ident	"GCC: (devkitARM release 66) 15.1.0"
