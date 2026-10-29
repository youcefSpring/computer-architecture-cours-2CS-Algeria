; Sum of an array of 64-bit numbers: base + index*scale addressing
section .text
global _start
_start:
    xor rax, rax                ; sum = 0
    xor rcx, rcx                ; i = 0
again:
    add rax, [tab + rcx*8]      ; sum += tab[i]   (8 bytes per element)
    inc rcx                     ; i++
    cmp rcx, 5
    jl  again                   ; while i < 5
    call print_dec              ; print the sum

    mov rax, 60
    xor rdi, rdi
    syscall

print_dec:                      ; print RAX in decimal
    lea rsi, [rel dbuf + 20]    ; fill the buffer from the end
    mov byte [rsi], 10          ; new line
    mov rbx, 10
    mov rcx, 1                  ; length (the new line)
divide:
    xor rdx, rdx
    div rbx                     ; RAX = RAX / 10, RDX = digit
    add dl, 48                  ; digit -> ASCII ('0' = 48)
    dec rsi
    mov [rsi], dl
    inc rcx
    test rax, rax
    jnz divide
    mov rax, 1                  ; write(1, rsi, rcx)
    mov rdi, 1
    mov rdx, rcx
    syscall
    ret

section .data
tab     dq 1000000000000, 2500, 30000000000, 7, 12345

section .bss
dbuf    resb 21
