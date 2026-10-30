; The stack: PUSH and POP
org 100h

    mov ax, 1111h
    mov bx, 2222h
    push ax
    push bx
    pop ax
    pop bx
    ret
