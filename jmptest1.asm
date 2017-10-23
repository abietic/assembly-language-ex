assume cs:code
code segment
        
        start:mov ax,0
              mov bx,0
              jmp short s   ;the real commond is eb03 which means
              add ax,1      ;add ip,03h
            s:inc ax        ;so the jmp short can move from -128 to 127
                            ;another one jmp near ptr also only add a
code ends                   ;distance to ip only wider range -23768
                            ;to 23767
end start
