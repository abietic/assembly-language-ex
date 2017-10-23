assume cs:codesg
codesg segment

        mov ax,0
        mov ds,ax
        mov ds:[26h],ax  ;changed system data cause system shut down

        mov ax,4c00h
        int 21h

codesg ends
end
