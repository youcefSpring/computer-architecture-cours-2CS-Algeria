; Data transfer: MOV, XCHG, LEA
org 100h

    mov ax, 1234h
    mov bl, ah
    mov bh, al
    xchg ax, bx
    lea si, num
    mov cx, [si]
    mov [res], ax
    ret

num dw 0ABCDh
res dw 0
