; A procedure that prints the number in AX in decimal
org 100h

    mov ax, 2026
    call print_num    ; print 2026
    mov ax, 7
    call print_num    ; print 7
    ret

print_num proc        ; input: AX = number to print
    mov bx, 10        ; we divide by 10
    mov cx, 0         ; CX = number of digits
divide:
    mov dx, 0         ; DX:AX / BX needs DX = 0
    div bx            ; AX = AX / 10 , DX = last digit
    push dx           ; keep the digit on the stack
    inc cx
    cmp ax, 0
    jne divide        ; continue while AX <> 0
show:
    pop dx            ; digits come back in the right order
    add dl, '0'       ; digit -> ASCII character
    mov ah, 02h
    int 21h
    loop show
    mov dl, ' '       ; a space after the number
    int 21h
    ret
print_num endp
