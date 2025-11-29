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
	.file	"attacks.c"
	.text
	.align	2
	.global	initAttacks
	.syntax unified
	.arm
	.type	initAttacks, %function
initAttacks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #1
	mov	r1, #200
	ldr	r3, .L4
	push	{fp, lr}
	mov	r2, #3
	mov	fp, #0
	mov	ip, #100
	str	r0, [r3, #72]
	str	r1, [r3, #76]
	mov	r1, #12
	mov	r0, #17
	str	fp, [r3, #16]
	str	ip, [r3, #20]
	str	r2, [r3]
	mov	fp, #2
	mov	ip, #200
	str	r2, [r3, #8]
	str	r2, [r3, #4]
	str	r2, [r3, #24]
	str	r2, [r3, #80]
	str	r2, [r3, #136]
	str	r0, [r3, #104]
	mov	r2, #9
	mov	r0, #18
	str	r1, [r3, #48]
	mov	r1, #4
	mov	lr, #20
	str	fp, [r3, #128]
	str	ip, [r3, #132]
	str	r0, [r3, #160]
	mov	ip, #16
	mov	r0, #23
	str	r1, [r3, #44]
	str	r2, [r3, #12]
	mov	r1, #7
	str	r2, [r3, #64]
	str	r2, [r3, #100]
	str	r2, [r3, #120]
	mov	r2, #36
	str	lr, [r3, #116]
	str	ip, [r3, #156]
	str	r1, [r3, #56]
	str	r1, [r3, #60]
	str	r1, [r3, #112]
	str	r0, [r3, #68]
	str	r2, [r3, #124]
	pop	{fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	.LANCHOR0
	.size	initAttacks, .-initAttacks
	.global	BUTTON
	.global	CHARACTER
	.global	TYPE
	.global	POWER
	.global	dummyPunch
	.global	changmoSuper
	.global	changmoSp
	.global	changmoHigh
	.global	changmoCrKick
	.global	changmoCrPunch
	.global	changmoKick
	.global	changmoPunch
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	changmoPunch, %object
	.size	changmoPunch, 52
changmoPunch:
	.space	52
	.space	4
	.type	changmoKick, %object
	.size	changmoKick, 52
changmoKick:
	.space	52
	.space	4
	.type	dummyPunch, %object
	.size	dummyPunch, 52
dummyPunch:
	.space	52
	.type	BUTTON, %object
	.size	BUTTON, 1
BUTTON:
	.space	1
	.type	CHARACTER, %object
	.size	CHARACTER, 1
CHARACTER:
	.space	1
	.type	TYPE, %object
	.size	TYPE, 1
TYPE:
	.space	1
	.type	POWER, %object
	.size	POWER, 1
POWER:
	.space	1
	.type	changmoSuper, %object
	.size	changmoSuper, 52
changmoSuper:
	.space	52
	.type	changmoSp, %object
	.size	changmoSp, 52
changmoSp:
	.space	52
	.type	changmoHigh, %object
	.size	changmoHigh, 52
changmoHigh:
	.space	52
	.type	changmoCrKick, %object
	.size	changmoCrKick, 52
changmoCrKick:
	.space	52
	.type	changmoCrPunch, %object
	.size	changmoCrPunch, 52
changmoCrPunch:
	.space	52
	.ident	"GCC: (devkitARM release 66) 15.1.0"
