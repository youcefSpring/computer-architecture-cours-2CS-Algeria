; The same addition on 16, 32 and 64 bits
section .text
global _start
_start:
    add ax, bx
    add eax, ebx
    add rax, rbx
    add r8, r9
    jmp fin
fin:
    mov rax, 60
    xor rdi, rdi
    syscall
