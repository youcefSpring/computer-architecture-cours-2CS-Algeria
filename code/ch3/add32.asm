; Add two 32-bit numbers with a 16-bit processor
; 0001FFFFh + 00000001h = 00020000h
org 100h

    mov ax, 0FFFFh    ; low word of the 1st number
    mov dx, 0001h     ; high word of the 1st number
    add ax, 0001h     ; low words: FFFF + 1 = 0000, carry CF = 1
    adc dx, 0000h     ; high words: 0001 + 0 + CF = 0002
    ret               ; result DX:AX = 0002:0000
