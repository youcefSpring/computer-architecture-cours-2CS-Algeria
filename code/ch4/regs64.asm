; RAX, EAX, AX, AL: what happens to the other bits?
section .text
global _start
_start:
    mov rax, 0x1122334455667788
    call print_hex          ; the full 64-bit value

    mov rax, 0x1122334455667788
    mov eax, 0xAABBCCDD     ; write 32 bits: the high half becomes 0!
    call print_hex

    mov rax, 0x1122334455667788
    mov ax, 0x1234          ; write 16 bits: the rest is kept
    call print_hex

    mov rax, 0x1122334455667788
    mov al, 0xFF            ; write 8 bits: the rest is kept
    call print_hex

    mov rax, 60             ; exit
    xor rdi, rdi
    syscall

print_hex:                  ; print RAX as 16 hex digits
    mov rcx, 16             ; 16 digits of 4 bits
    lea rdi, [rel buf]
next_digit:
    rol rax, 4              ; bring the next 4 bits to the right
    mov rdx, rax
    and rdx, 0xF            ; keep only these 4 bits
    mov dl, [digits + rdx]  ; 0..15 -> '0'..'F'
    mov [rdi], dl
    inc rdi
    dec rcx
    jnz next_digit
    mov byte [rdi], 10      ; new line
    mov rax, 1              ; write(1, buf, 17)
    mov rdi, 1
    lea rsi, [rel buf]
    mov rdx, 17
    syscall
    ret

section .data
digits  db "0123456789ABCDEF"

section .bss
buf     resb 17
