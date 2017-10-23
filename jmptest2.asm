assume cs:code

code segment

        start:mov ax,0
              mov bx,0
              jmp far ptr s    ;this if quite different from jmp short and
              db 256 dup (0)   ;jmp near ptr which give only distance
            s:add ax,1         ;jmp far ptr is giving true adress cs:ip
              inc ax

code ends

end start

