; Exercise: 5! with LOOP
org 100h

    mov ax, 1         ; result = 1
    mov cx, 5         ; multiply by 5, 4, 3, 2, 1
again:
    mul cx            ; DX:AX = AX * CX
    loop again
    ret               ; AX = 120
