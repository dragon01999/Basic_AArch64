.section .text
.global _start

_start:
	MOVZ	X3, #42
	MOVZ	X2, #0x8
	ADD	X0, X3, X2
	ret_:
	MOVZ	X0, #0x1
	CMP	X0, #50
	B.EQ	ret_
	MOVZ	X8, #93
	SVC	#0


