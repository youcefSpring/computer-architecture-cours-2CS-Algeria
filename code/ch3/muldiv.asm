; Multiplication and division
org 100h

    mov al, 12        ; first number
    mov bl, 11        ; second number
    mul bl            ; AX = AL * BL = 132

    mov ax, 300       ; AX = 300
    mov cx, 500
    mul cx            ; DX:AX = AX * CX = 150000

    mov ax, 47        ; dividend
    mov bl, 5         ; divisor
    div bl            ; AL = 47 / 5 = 9 , AH = remainder = 2
    ret
