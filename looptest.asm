assume cs:code
code segment

        mov cx,0
        mov ax,0ah
        s:add ax,ax
        loop s  ;the loop will first do the sub then check if cx is 0

        mov ax,4c00h
        int 21h

code ends
end
