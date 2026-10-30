; Sum of an array of 64-bit numbers: base + index*scale addressing
section .text
global _start
_start:
    xor rax, rax
    xor rcx, rcx
again:
    add rax, [tab + rcx*8]
    inc rcx
    cmp rcx, 5
    jl  again
    call print_dec

    mov rax, 60
    xor rdi, rdi
    syscall

print_dec:
    lea rsi, [rel dbuf + 20]
    mov byte [rsi], 10
    mov rbx, 10
    mov rcx, 1
divide:
    xor rdx, rdx
    div rbx
    add dl, 48
    dec rsi
    mov [rsi], dl
    inc rcx
    test rax, rax
    jnz divide
    mov rax, 1
    mov rdi, 1
    mov rdx, rcx
    syscall
    ret

section .data
tab     dq 1000000000000, 2500, 30000000000, 7, 12345

section .bss
dbuf    resb 21
