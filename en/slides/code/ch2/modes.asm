org 100h

    mov ax, 5
    mov bx, ax
    mov cx, [val]
    lea si, val
    mov dx, [si]
    mov di, 4
    mov ax, [tab+di]
    ret

val dw 1234h
tab dw 10, 20, 30
