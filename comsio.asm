assume cs:code
code segment
    in al,71h
    mov bl,al
    mov al,0
    out 71h,al
    mov ax,4c00h
    int 21h

code ends
end
