; The same program in 32-bit Linux (NASM syntax)
section .data
msg     db "Hello from 32-bit mode!", 10
len     equ $ - msg

section .text
global _start
_start:
    mov eax, 4          ; system call 4 = write (32-bit numbers differ!)
    mov ebx, 1          ; stdout
    mov ecx, msg        ; address of the text
    mov edx, len        ; number of bytes
    int 0x80            ; 32-bit way to call Linux

    mov eax, 1          ; system call 1 = exit
    mov ebx, 0
    int 0x80
