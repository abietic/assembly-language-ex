assume cs:code        ;this program like test3 is get ip to 0
                      ;by using data segment
data segment
        dd 12345678h
data ends

code segment

        start:mov ax,data
              mov ds,ax
              mov bx,0
              mov word ptr [bx],offset start
              mov [bx+2],cs
              jmp dword ptr ds:[0]

code ends

end start
