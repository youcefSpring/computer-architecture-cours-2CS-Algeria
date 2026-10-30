; IF ... ELSE : print which number is bigger
org 100h

    mov al, [a]
    cmp al, [b]
    jg  first
    lea dx, msg2
    jmp show
first:
    lea dx, msg1
show:
    mov ah, 09h
    int 21h
    ret

a    db 7
b    db 12
msg1 db 'a is bigger$'
msg2 db 'b is bigger or equal$'
