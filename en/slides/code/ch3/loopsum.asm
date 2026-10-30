; FOR loop with LOOP: sum = 1 + 2 + ... + 10
org 100h

    mov ax, 0
    mov cx, 10
again:
    add ax, cx
    loop again
    mov [sum], ax
    ret

sum dw 0
