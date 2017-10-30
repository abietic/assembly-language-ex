assume cs:codesg

datasg segment
    db "Beginner's All-purpose Symbolic Instruction Code.",0
datasg ends

codesg segment

    begin:mov ax,datasg
          mov ds,ax
          mov si,0
          call letterc

          mov ax,4c00h
          int 21h

  letterc:push ax
  capital:mov al,[si]
          cmp al,0         ;if it's the end of the string
          je cend
          cmp al,97        ;if it's ascii a~z
          jb cnext
          cmp al,122
          ja cnext
          and al,01011111b
          mov [si],al
    cnext:inc si
          jmp capital
     cend:pop ax
          ret

codesg ends

end begin
