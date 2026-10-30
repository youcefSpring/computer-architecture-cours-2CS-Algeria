; Passing parameters on the stack
org 100h

    mov ax, 30
    push ax
    mov ax, 12
    push ax
    call addtwo
    mov [res], ax
    ret

addtwo proc
    push bp
    mov bp, sp
    mov ax, [bp+4]
    add ax, [bp+6]
    pop bp
    ret 4
addtwo endp

res dw 0
