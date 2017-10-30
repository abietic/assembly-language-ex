assume cs:code

code segment
    start:mov ax,cs
          mov ds,ax
          mov ax,0
          mov es,ax
          mov di,200h
          mov si,offset do0
          mov cx,offset do0end - offset do0
          cld
          rep movsb
          mov word ptr es:[7ch*4+2],0
          mov word ptr es:[7ch*4],200h

          ;int 7ch    ;the setting is over you can call int 7ch in orther program

          mov ax,4c00h
          int 21h

      do0:jmp short do0start
          db "Div Overflow!!!"  ;15

 do0start:mov ax,0b800h
          mov es,ax
          mov di,12*160+36*2
          mov ax,0
          mov ds,ax
          mov si,202h
          mov cx,15
        s:mov al,[si]
          mov es:[di],al
          inc si
          add di,2
          loop s

          mov ax,4c00h
          int 21h
   do0end:nop

   code ends

   end start
