; Hello in 64-bit Linux (NASM syntax)
section .data
msg     db "Hello from 64-bit mode!", 10   ; text + new line
len     equ $ - msg                         ; length computed by NASM

section .text
global _start
_start:
    mov rax, 1          ; system call 1 = write
    mov rdi, 1          ; file 1 = the screen (stdout)
    mov rsi, msg        ; address of the text
    mov rdx, len        ; number of bytes
    syscall             ; ask Linux to do it

    mov rax, 60         ; system call 60 = exit
    mov rdi, 0          ; exit code 0 = success
    syscall
