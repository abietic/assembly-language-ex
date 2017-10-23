assume cs:code  ;change system data cause shut down pretty danger
code segment

        mov ax,0
        mov ds,ax
        mov bx,0
        mov cx,3fh

        s:mov ds:[bx],bl
        inc bx
        loop s

        mov ax,4c00h
        int 21h

code ends
end       
