; My first 8086 program: print a message on the screen
org 100h

    lea dx, msg
    mov ah, 09h
    int 21h
    ret

msg db 'Salam, I am the 8086!$'
