; Multiplication and division
org 100h

    mov al, 12
    mov bl, 11
    mul bl

    mov ax, 300
    mov cx, 500
    mul cx

    mov ax, 47
    mov bl, 5
    div bl
    ret
