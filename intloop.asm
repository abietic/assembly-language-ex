assume cs:code

code segment
    start:mov ax,cs
          mov ds,ax
          mov ax,0
          mov es,ax
          mov di,200h
          mov si,offset iloop
          mov cx,offset iloopend - offset iloop
          cld
          rep movsb
          mov word ptr es:[7ch*4+2],0
          mov word ptr es:[7ch*4],200h


          mov ax,4c00h
          int 21h

        iloop:push bp
              dec cx
              jcxz e
              mov bp,sp
              add 2[bp],bx
             e:pop bp
              iret
     iloopend:nop

   code ends

   end start
