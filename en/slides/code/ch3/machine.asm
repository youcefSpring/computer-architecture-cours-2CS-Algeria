; Small program to study its machine code
org 100h

    mov ax, 1234h
    mov bx, ax
    add al, 5
    mov [bx], al
    inc cx
    jmp fin
    nop
fin:
    ret
