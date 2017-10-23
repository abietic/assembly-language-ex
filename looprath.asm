assume cs:code
code segment

        start:mov ax,2000h
              mov ds,ax
              mov bx,0
            s:mov cl,[bx]
              mov ch,0
              inc cx    ;cause loop will first -1 then judge 0
              inc bx
              loop s
           ok:dec bx    ;the opposite inc
              mov dx,bx
              mov ax,4c00h
              int 21h

code ends

end start
