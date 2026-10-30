; A procedure that prints the number in AX in decimal
org 100h

    mov ax, 2026
    call print_num
    mov ax, 7
    call print_num
    ret

print_num proc
    mov bx, 10
    mov cx, 0
divide:
    mov dx, 0
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne divide
show:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop show
    mov dl, ' '
    int 21h
    ret
print_num endp
