assume cs:code

code segment
    start:mov ax,cs
          mov ds,ax
          mov ax,0
          mov es,ax
          mov di,200h
          mov si,offset ijmp
          mov cx,offset ijmpend - offset ijmp
          cld
          rep movsb
          mov word ptr es:[7ch*4+2],0
          mov word ptr es:[7ch*4],200h


          mov ax,4c00h
          int 21h

        ijmp:push bp
              mov bp,sp
              add 2[bp],bx
             e:pop bp
              iret
     ijmpend:nop

   code ends

   end start
