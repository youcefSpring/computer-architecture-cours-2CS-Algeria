; Exercise: 5! with LOOP
org 100h

    mov ax, 1
    mov cx, 5
again:
    mul cx
    loop again
    ret
