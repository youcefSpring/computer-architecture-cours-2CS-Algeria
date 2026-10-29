; The same addition on 16, 32 and 64 bits
section .text
global _start
_start:
    add ax, bx          ; 16 bits
    add eax, ebx        ; 32 bits
    add rax, rbx        ; 64 bits
    add r8, r9          ; new 64-bit registers
    jmp fin             ; a short jump
fin:
    mov rax, 60
    xor rdi, rdi
    syscall
