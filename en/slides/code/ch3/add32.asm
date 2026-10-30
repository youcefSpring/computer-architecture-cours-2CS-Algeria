; Add two 32-bit numbers with a 16-bit processor
; 0001FFFFh + 00000001h = 00020000h
org 100h

    mov ax, 0FFFFh
    mov dx, 0001h
    add ax, 0001h
    adc dx, 0000h
    ret
