assume cs:code                     ;this program will get ip to 0 everytime

data segment
        db 0,0,0
data ends

code segment

        start:mov ax,data
              mov ds,ax
              mov bx,0
              jmp word ptr [bx+1]   ;get a word from memory into ip

code ends

end start
