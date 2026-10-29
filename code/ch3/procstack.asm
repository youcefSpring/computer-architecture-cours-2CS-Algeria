; Passing parameters on the stack
org 100h

    mov ax, 30
    push ax           ; 2nd parameter
    mov ax, 12
    push ax           ; 1st parameter
    call addtwo       ; result in AX
    mov [res], ax     ; res = 42
    ret

addtwo proc
    push bp           ; save BP
    mov bp, sp        ; BP = top of the stack
    mov ax, [bp+4]    ; 1st parameter (12)
    add ax, [bp+6]    ; + 2nd parameter (30)
    pop bp            ; restore BP
    ret 4             ; return and remove the 2 parameters
addtwo endp

res dw 0
