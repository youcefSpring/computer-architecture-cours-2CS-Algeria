; Arithmetic: ADD, SUB, INC, DEC, NEG
org 100h

    mov al, 25        ; AL = 25
    add al, 17        ; AL = 25 + 17 = 42
    sub al, 2         ; AL = 42 - 2  = 40
    inc al            ; AL = 41
    dec al            ; AL = 40
    neg al            ; AL = -40 (two's complement)
    mov bx, 1000      ; BX = 1000
    add bx, 2500      ; BX = 3500
    ret
