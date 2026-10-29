org 100h              ; .COM program starts at offset 100h

    mov ax, 5         ; immediate : the value 5 is inside the instruction
    mov bx, ax        ; register  : copy register AX into BX
    mov cx, [val]     ; direct    : read memory at the address of val
    lea si, val       ; SI = address of val
    mov dx, [si]      ; indirect  : read memory at the address in SI
    mov di, 4         ; DI = 4 (two words further)
    mov ax, [tab+di]  ; indexed   : read tab + 4 = third element
    ret               ; end of program

val dw 1234h          ; a word in memory
tab dw 10, 20, 30     ; an array of 3 words
