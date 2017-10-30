assume cs:code
code segment
    start:mov ax,0
          mov es,ax
          mov di,200h
          mov ax,cs
          mov ds,ax
          mov si,offset cscreen
          push es:[9*4]
          pop ds:[si+2]
          push es:[9*4+2]
          pop ds:[si+4]
          mov cx,offset cscreend - offset cscreen
          cld
          rep movsb
          mov word ptr es:[9*4],200h
          mov word ptr es:[9*4+2],0
          mov ax,4c00h
          int 21h

  cscreen:jmp short doscreen
          dw 2 dup (0)
 doscreen:push ax
          push es
          push cx
          push bx
          pushf
          in al,60h
          call dword ptr cs:[202h]
          cmp al,3bh
          jne toend
          mov cx,2000
          mov ax,0b800h
          mov es,ax
          mov bx,1
        s:inc byte ptr es:[bx]
          add bx,2
          loop s
    toend:pop bx
          pop cx
          pop es
          pop ax
          iret
 cscreend:nop
code ends
end start
