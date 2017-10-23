assume cs:code  ;copy the code before "mov ax,4c00h"
code segment    ;to 00200h

        mov ax,cs
        mov ds,ax
        mov ax,0020h
        mov es,ax
        mov bx,0
        mov cx,23

        s:mov al,ds:[bx]
          mov es:[bx],al
          inc bx
          loop s

        mov ax,4c00h
        int 21h

code ends
end
