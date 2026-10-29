; My first 8086 program: print a message on the screen
org 100h              ; .COM program: code starts at offset 100h

    lea dx, msg       ; DX = address of the message
    mov ah, 09h       ; DOS function 09h = print a string ending with '$'
    int 21h           ; call DOS
    ret               ; end of the program, back to DOS

msg db 'Salam, I am the 8086!$'
