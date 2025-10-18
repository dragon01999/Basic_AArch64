.section .data
str: .ascii "Hello, World!\n"
str_len = . - str
bg: .ascii "\033[42m"
bg_len = . - bg
.section .text
.global _start
_start:
        MOV     X6, #0
        MOV     X3, #0x9
        print_:
		MOV X8, #64
                MOV X0, #1
                LDR X1, =bg
                MOV X2, #bg_len
                SVC #0
                MOV X8, #64
                MOV X0, #1
                LDR X1, =str
		MOV X2, #str_len
		SVC #0
                ADD X6, X6, #1
        CMP     X6, X3
        BLT print_
        MOV X8, #93
        SVC #0

