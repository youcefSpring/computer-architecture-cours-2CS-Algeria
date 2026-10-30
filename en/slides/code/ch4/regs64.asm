; RAX, EAX, AX, AL: what happens to the other bits?
section .text
global _start
_start:
    mov rax, 0x1122334455667788
    call print_hex

    mov rax, 0x1122334455667788
    mov eax, 0xAABBCCDD
    call print_hex

    mov rax, 0x1122334455667788
    mov ax, 0x1234
    call print_hex

    mov rax, 0x1122334455667788
    mov al, 0xFF
    call print_hex

    mov rax, 60
    xor rdi, rdi
    syscall

print_hex:
    mov rcx, 16
    lea rdi, [rel buf]
next_digit:
    rol rax, 4
    mov rdx, rax
    and rdx, 0xF
    mov dl, [digits + rdx]
    mov [rdi], dl
    inc rdi
    dec rcx
    jnz next_digit
    mov byte [rdi], 10
    mov rax, 1
    mov rdi, 1
    lea rsi, [rel buf]
    mov rdx, 17
    syscall
    ret

section .data
digits  db "0123456789ABCDEF"

section .bss
buf     resb 17
