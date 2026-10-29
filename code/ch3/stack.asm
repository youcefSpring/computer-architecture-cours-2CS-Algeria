; The stack: PUSH and POP
org 100h

    mov ax, 1111h
    mov bx, 2222h
    push ax           ; SP = SP - 2 ; [SP] = AX
    push bx           ; SP = SP - 2 ; [SP] = BX
    pop ax            ; AX = [SP]   ; SP = SP + 2  -> AX = 2222h
    pop bx            ; BX = [SP]   ; SP = SP + 2  -> BX = 1111h
    ret               ; AX and BX have been swapped
