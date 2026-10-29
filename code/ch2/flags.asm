org 100h

    mov al, 200       ; AL = 200
    add al, 100       ; 300 does not fit in 8 bits -> carry
    mov al, 100       ; AL = 100
    add al, 50        ; 150: too big for a signed byte -> overflow
    mov al, 5
    sub al, 5         ; result 0 -> zero flag
    mov al, 3
    sub al, 7         ; negative result -> sign flag and borrow
    ret
