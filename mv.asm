assume cs:code;to move 12 byte from ffff:0 to 0020:0
code segment  ;use loop and a extra segment register 

        mov cx,12
        mov bx,0
        mov ax,0ffffh
        mov ds,ax
        mov ax,0020h
        mov es,ax
 
        s:mov al,ds:[bx]

        mov es:[bx],al

        inc bx
        loop s

        mov ax,4c00h
        int 21h

code ends
end        
