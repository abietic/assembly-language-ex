assume cs:code

code segment
    start:mov ax,cs
          mov ds,ax
          mov ax,0
          mov es,ax
          mov di,200h
          mov si,offset capital
          mov cx,offset capitalend - offset capital
          cld
          rep movsb
          mov word ptr es:[7ch*4+2],0
          mov word ptr es:[7ch*4],200h

          mov ax,3456
          int 7ch
          add ax,ax
          adc dx,dx

          mov ax,4c00h
          int 21h

      capital:push ax
            s:mov al,[si]
              cmp al,0
              je toend
              and al,11011111b
              mov [si],al
              inc si
              jmp s
        toend:pop ax
              iret
   capitalend:nop

   code ends

   end start
