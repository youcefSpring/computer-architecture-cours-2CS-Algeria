; IF ... ELSE : print which number is bigger
org 100h

    mov al, [a]       ; AL = a
    cmp al, [b]       ; compare a with b (computes a - b)
    jg  first         ; jump if a > b (signed)
    lea dx, msg2      ; else: b is bigger or equal
    jmp show
first:
    lea dx, msg1      ; a is bigger
show:
    mov ah, 09h       ; print the chosen message
    int 21h
    ret

a    db 7
b    db 12
msg1 db 'a is bigger$'
msg2 db 'b is bigger or equal$'
