; Arithmetic: ADD, SUB, INC, DEC, NEG
org 100h

    mov al, 25
    add al, 17
    sub al, 2
    inc al
    dec al
    neg al
    mov bx, 1000
    add bx, 2500
    ret
