.section .data
n:	.word 0 
stat:	.asciz "Enter the size: "
stat_ln = . - stat
brick:	.asciz "\n***"
brick_ln = . - brick

.section .text
.global _start
_start:
	mov	x8, #64
	mov	x0, #1
	ldr	x1, =stat
	mov	x2, #stat_ln
	svc #0
	mov	x8, #63
	mov	x0, #0
	ldr	x1, =n
	mov	x2, #1
	svc #0
	mov	w10, #0
	ldr	x11, =n
	ldr	w12, [x11]
	sub	w12, w12, #48
	cmp	w12, #9
	b.gt	_exit
	print_sq_:
			mov	x8, #64
			mov	x0, #1
			ldr	x1, =brick
			mov	x2, #brick_ln
		        svc #0	
			add	x10, x10, #1
	cmp	w10, w12
	b.lt	print_sq_
	_exit:
		mov	x8, #93
		svc #0	
