; Logic and shift instructions
org 100h

    mov al, 10110110b ; AL = B6h
    and al, 00001111b ; keep only the 4 low bits  -> 06h
    or  al, 10000000b ; set bit 7 to 1            -> 86h
    xor al, 11111111b ; invert all the bits       -> 79h
    not al            ; invert again              -> 86h
    mov bl, 5
    shl bl, 1         ; shift left  = multiply by 2 -> 10
    shl bl, 1         ;                              -> 20
    shr bl, 1         ; shift right = divide by 2   -> 10
    xor cx, cx        ; quick way to put CX = 0
    ret
