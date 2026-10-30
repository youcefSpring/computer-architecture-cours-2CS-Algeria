; Install our own interrupt handler for INT 60h
org 100h

    mov ax, 0
    mov es, ax
    lea ax, handler
    mov es:[60h*4], ax
    mov es:[60h*4+2], cs
    mov bl, 'A'
    int 60h
    int 60h
    ret

handler:
    mov dl, bl
    mov ah, 02h
    int 21h
    inc bl
    iret
