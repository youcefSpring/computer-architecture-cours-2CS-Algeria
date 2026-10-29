; WHILE loop: find the biggest value in an array
org 100h

    lea si, tab       ; SI points to the first element
    mov cx, 6         ; 6 elements
    mov al, [si]      ; max = first element
next:
    cmp [si], al      ; compare current element with max
    jbe skip          ; if element <= max, keep max
    mov al, [si]      ; else max = element
skip:
    inc si            ; go to the next element
    loop next
    mov [max], al
    ret

tab db 14, 3, 27, 9, 31, 8
max db 0
