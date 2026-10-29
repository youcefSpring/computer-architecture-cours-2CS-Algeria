; Install our own interrupt handler for INT 60h
org 100h

    mov ax, 0
    mov es, ax            ; ES = 0 : the interrupt vector table
    lea ax, handler
    mov es:[60h*4], ax    ; offset of the handler
    mov es:[60h*4+2], cs  ; segment of the handler
    mov bl, 'A'
    int 60h               ; call our interrupt
    int 60h               ; call it again
    ret

handler:                  ; prints BL, then BL = next letter
    mov dl, bl
    mov ah, 02h
    int 21h
    inc bl
    iret                  ; return from interrupt (restores IP, CS, FLAGS)
