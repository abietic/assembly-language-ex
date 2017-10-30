assume cs:code

code segment
    start:mov ax,cs
          mov ds,ax
          mov ax,0
          mov es,ax
          mov di,200h
          mov si,offset sqr
          mov cx,offset sqrend - offset sqr
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

      sqr:mul ax
          iret
   sqrend:nop

   code ends

   end start
