; FOR loop with LOOP: sum = 1 + 2 + ... + 10
org 100h

    mov ax, 0         ; sum = 0
    mov cx, 10        ; CX = number of turns (and current value)
again:
    add ax, cx        ; sum = sum + CX
    loop again        ; CX = CX - 1 ; if CX <> 0 jump to again
    mov [sum], ax     ; sum = 55
    ret

sum dw 0
