; Repetition with REP: copy a string with one instruction
org 100h

    lea si, src       ; SI = source
    lea di, dst       ; DI = destination
    mov cx, 6         ; number of bytes to copy
    cld               ; direction = forward (SI and DI increase)
    rep movsb         ; repeat CX times: [DI] = [SI], SI++, DI++
    lea dx, dst
    mov ah, 09h       ; print the copy
    int 21h
    ret

src db 'Hello$'
dst db 6 dup(0)
