; Repetition with REP: copy a string with one instruction
org 100h

    lea si, src
    lea di, dst
    mov cx, 6
    cld
    rep movsb
    lea dx, dst
    mov ah, 09h
    int 21h
    ret

src db 'Hello$'
dst db 6 dup(0)
