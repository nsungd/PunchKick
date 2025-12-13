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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #0
	mov	r1, #100
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	ip, .L4
	sub	sp, sp, #28
	str	r0, [ip, #16]
	str	r1, [ip, #20]
	mov	r1, #3
	str	r1, [ip]
	str	r1, [ip, #8]
	str	r1, [ip, #4]
	str	r1, [ip, #24]
	str	r1, [ip, #80]
	str	r1, [ip, #136]
	mov	r1, #23
	str	r1, [ip, #68]
	mov	r1, #17
	mov	lr, #10
	str	r1, [ip, #108]
	mov	r1, #5
	str	lr, [ip, #44]
	str	r1, [ip, #120]
	mov	lr, #4
	mov	r1, #13
	str	lr, [ip, #48]
	str	r1, [ip, #160]
	mov	lr, #7
	mov	r1, #27
	mov	r2, #12
	mov	r3, #6
	mov	r0, #9
	str	lr, [ip, #56]
	str	lr, [ip, #60]
	str	r1, [ip, #180]
	mov	r4, #15
	mov	lr, #20
	mov	r5, #31
	mov	r6, #8
	mov	r1, #2
	str	r0, [ip, #12]
	str	r2, [ip, #52]
	str	r0, [ip, #64]
	str	r0, [ip, #104]
	str	r4, [ip, #100]
	str	r3, [ip, #112]
	str	lr, [ip, #116]
	str	r5, [ip, #124]
	str	r3, [ip, #164]
	str	r6, [ip, #156]
	str	r3, [ip, #168]
	str	r0, [ip, #176]
	str	r2, [ip, #172]
	str	r1, [ip, #192]
	str	r3, [ip, #216]
	mov	r3, #4
	str	r3, [ip, #224]
	mov	r3, #15
	str	r3, [ip, #232]
	mov	r3, #31
	str	r3, [ip, #236]
	mov	r3, #1
	str	r3, [ip, #248]
	mov	r3, #60
	mov	r0, #1
	str	r3, [ip, #292]
	mov	r1, #200
	mov	r3, #8
	str	r0, [ip, #72]
	str	r1, [ip, #76]
	str	r3, [ip, #324]
	mov	r0, #2
	mov	r3, #16
	mov	r1, #300
	str	r3, [ip, #220]
	str	r0, [ip, #128]
	str	r1, [ip, #132]
	str	r2, [ip, #228]
	str	r2, [ip, #276]
	str	r3, [ip, #272]
	mov	r2, r3
	str	r3, [ip, #268]
	mov	r0, #2
	mov	r3, #20
	mov	r1, #200
	str	r3, [ip, #280]
	str	r0, [ip, #184]
	str	r1, [ip, #188]
	str	r3, [ip, #288]
	str	r3, [ip, #284]
	str	r2, [ip, #332]
	mov	r1, #19
	mov	r2, #1
	mov	r3, #300
	str	r1, [ip, #212]
	str	r2, [ip, #240]
	str	r3, [ip, #244]
	mov	lr, ip
	mov	r1, #3
	mov	r0, #9
	mov	r2, #2
	mov	r3, #700
	add	r4, ip, #168
	str	r4, [sp, #8]
	add	r4, ip, #560
	str	r4, [sp, #12]
	add	r5, ip, #504
	add	r6, ip, #224
	add	r4, ip, #1456
	str	r5, [sp, #4]
	str	r6, [sp, #16]
	str	r4, [sp, #20]
	str	r2, [ip, #296]
	str	r3, [ip, #300]
	str	r1, [ip, #304]
	str	r0, [ip, #328]
	ldmia	lr!, {r0, r1, r2, r3}
	add	fp, ip, #336
	stmia	fp!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	fp!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	fp!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	add	r10, ip, #56
	stm	fp, {r0, r1}
	ldmia	r10!, {r0, r1, r2, r3}
	add	r9, ip, #392
	stmia	r9!, {r0, r1, r2, r3}
	ldmia	r10!, {r0, r1, r2, r3}
	stmia	r9!, {r0, r1, r2, r3}
	ldmia	r10!, {r0, r1, r2, r3}
	stmia	r9!, {r0, r1, r2, r3}
	ldm	r10, {r0, r1}
	add	r8, ip, #112
	stm	r9, {r0, r1}
	ldmia	r8!, {r0, r1, r2, r3}
	add	r7, ip, #448
	stmia	r7!, {r0, r1, r2, r3}
	ldmia	r8!, {r0, r1, r2, r3}
	stmia	r7!, {r0, r1, r2, r3}
	ldmia	r8!, {r0, r1, r2, r3}
	stmia	r7!, {r0, r1, r2, r3}
	ldm	r8, {r0, r1}
	stm	r7, {r0, r1}
	ldr	r7, [sp, #8]
	ldr	r8, [sp, #4]
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	r8!, {r0, r1, r2, r3}
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	r8!, {r0, r1, r2, r3}
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	r8!, {r0, r1, r2, r3}
	ldm	r7, {r0, r1}
	ldr	r7, [sp, #16]
	stm	r8, {r0, r1}
	ldmia	r7!, {r0, r1, r2, r3}
	ldr	r8, [sp, #12]
	stmia	r8!, {r0, r1, r2, r3}
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	r8!, {r0, r1, r2, r3}
	ldmia	r7!, {r0, r1, r2, r3}
	stmia	r8!, {r0, r1, r2, r3}
	ldm	r7, {r0, r1}
	add	r6, ip, #280
	stm	r8, {r0, r1}
	ldmia	r6!, {r0, r1, r2, r3}
	add	r5, ip, #616
	stmia	r5!, {r0, r1, r2, r3}
	mov	r3, #20
	mov	r0, #9
	str	r3, [ip, #1460]
	mov	r1, #3
	mov	r3, #36
	mov	lr, #7
	str	r0, [ip, #1464]
	str	r3, [ip, #1468]
	str	r1, [ip, #1480]
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	str	lr, [ip, #1456]
	ldmia	r6!, {r0, r1, r2, r3}
	stmia	r5!, {r0, r1, r2, r3}
	mov	r2, #2
	mov	r3, #500
	str	r2, [ip, #1472]
	str	r3, [ip, #1476]
	mov	r3, #18
	mov	r2, #16
	ldm	r6, {r0, r1}
	str	lr, [ip, #1500]
	str	r3, [ip, #1508]
	str	r2, [ip, #1504]
	add	r4, ip, #1504
	ldr	ip, [sp, #20]
	stm	r5, {r0, r1}
	ldmia	ip!, {r0, r1, r2, r3}
	add	r4, r4, #8
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldm	ip, {r0, r1}
	stm	r4, {r0, r1}
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
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
	.global	dummyMovelist
	.global	dummyPunch
	.global	changmoMovelist
	.global	changmoSuper
	.global	changmoOverhead
	.global	changmoHigh
	.global	changmoCrKick
	.global	changmoCrPunch
	.global	changmoKick
	.global	changmoPunch
	.bss
	.align	3
	.set	.LANCHOR0,. + 0
	.type	changmoPunch, %object
	.size	changmoPunch, 56
changmoPunch:
	.space	56
	.type	changmoKick, %object
	.size	changmoKick, 56
changmoKick:
	.space	56
	.type	changmoCrPunch, %object
	.size	changmoCrPunch, 56
changmoCrPunch:
	.space	56
	.type	changmoCrKick, %object
	.size	changmoCrKick, 56
changmoCrKick:
	.space	56
	.type	changmoOverhead, %object
	.size	changmoOverhead, 56
changmoOverhead:
	.space	56
	.type	changmoSuper, %object
	.size	changmoSuper, 56
changmoSuper:
	.space	56
	.type	changmoMovelist, %object
	.size	changmoMovelist, 1120
changmoMovelist:
	.space	1120
	.type	dummyPunch, %object
	.size	dummyPunch, 56
dummyPunch:
	.space	56
	.type	dummyMovelist, %object
	.size	dummyMovelist, 1120
dummyMovelist:
	.space	1120
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
	.type	changmoHigh, %object
	.size	changmoHigh, 56
changmoHigh:
	.space	56
	.ident	"GCC: (devkitARM release 66) 15.1.0"
