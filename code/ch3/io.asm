; Read a lowercase letter and print it in uppercase
org 100h

    lea dx, ask
    mov ah, 09h       ; print the question
    int 21h
    mov ah, 01h       ; DOS: read one key -> AL (with echo)
    int 21h
    sub al, 32        ; 'a' (97) - 32 = 'A' (65)
    mov bl, al        ; keep the letter in BL
    lea dx, ans
    mov ah, 09h
    int 21h
    mov dl, bl        ; DOS function 02h prints the character in DL
    mov ah, 02h
    int 21h
    ret

ask db 'Type a letter: $'
ans db 13, 10, 'Uppercase: $'
