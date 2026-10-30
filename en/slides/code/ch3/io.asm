; Read a lowercase letter and print it in uppercase
org 100h

    lea dx, ask
    mov ah, 09h
    int 21h
    mov ah, 01h
    int 21h
    sub al, 32
    mov bl, al
    lea dx, ans
    mov ah, 09h
    int 21h
    mov dl, bl
    mov ah, 02h
    int 21h
    ret

ask db 'Type a letter: $'
ans db 13, 10, 'Uppercase: $'
