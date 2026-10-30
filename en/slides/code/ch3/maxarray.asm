; WHILE loop: find the biggest value in an array
org 100h

    lea si, tab
    mov cx, 6
    mov al, [si]
next:
    cmp [si], al
    jbe skip
    mov al, [si]
skip:
    inc si
    loop next
    mov [max], al
    ret

tab db 14, 3, 27, 9, 31, 8
max db 0
