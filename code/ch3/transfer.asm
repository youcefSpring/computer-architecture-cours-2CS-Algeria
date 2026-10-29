; Data transfer: MOV, XCHG, LEA
org 100h

    mov ax, 1234h     ; AX = 1234h (immediate)
    mov bl, ah        ; BL = high byte of AX = 12h
    mov bh, al        ; BH = low byte of AX  = 34h
    xchg ax, bx       ; swap AX and BX
    lea si, num       ; SI = address of num
    mov cx, [si]      ; CX = the word stored at num
    mov [res], ax     ; store AX in memory (variable res)
    ret

num dw 0ABCDh
res dw 0
