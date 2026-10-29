sum:
    test rsi, rsi
    jle .L4
    mov rax, rdi
    lea rcx, [rdi+rsi*8]
    mov edx, 0
.L3:
    add rdx, QWORD PTR [rax]
    add rax, 8
    cmp rax, rcx
    jne .L3
.L1:
    mov rax, rdx
    ret
.L4:
    mov edx, 0
    jmp .L1
