; Logic and shift instructions
org 100h

    mov al, 10110110b
    and al, 00001111b
    or  al, 10000000b
    xor al, 11111111b
    not al
    mov bl, 5
    shl bl, 1
    shl bl, 1
    shr bl, 1
    xor cx, cx
    ret
