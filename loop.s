.section .data
str: .ascii "Hello, World!\n"
str_len = . - str
bg: .ascii "\033[42m"
bg_len = . - bg
.section .text
.global _start
_start:
        mov     x6, #0
        mov     x3, #0x9
        print_:
		mov x8, #64
                mov x0, #1
                ldr x1, =bg
                mov x2, #bg_len
                svc #0
                mov x8, #64
                mov x0, #1
                ldr x1, =str
		mov x2, #str_len
		svc #0
                add x6, x6, #1
        cmp     x6, x3
        blt print_
        mov x8, #93
        svc #0

