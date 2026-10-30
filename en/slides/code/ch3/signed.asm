; Same bits, two meanings: 200 is also -56
org 100h

    mov al, 200
    cmp al, 100
    ja  bigger_u
    lea dx, no_u
    jmp test_s
bigger_u:
    lea dx, yes_u
test_s:
    mov ah, 09h
    int 21h
    mov al, 200
    cmp al, 100
    jg  bigger_s
    lea dx, no_s
    jmp fin
bigger_s:
    lea dx, yes_s
fin:
    mov ah, 09h
    int 21h
    ret

yes_u db 'unsigned: 200 > 100', 13, 10, '$'
no_u  db 'unsigned: 200 <= 100', 13, 10, '$'
yes_s db 'signed: -56 > 100$'
no_s  db 'signed: -56 <= 100$'
