; Hello in 64-bit Linux (NASM syntax)
section .data
msg     db "Hello from 64-bit mode!", 10
len     equ $ - msg

section .text
global _start
_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg
    mov rdx, len
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
