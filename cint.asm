assume cs:code
stack segment
    db 128 dup (0)
stack ends
data segment
    dw 2 dup (0)
data ends
code segment
    start:mov ax,stack
          mov ss,ax
          mov sp,128
          mov ax,data
          mov ds,ax
          mov ax,0
          mov es,ax

          push es:[9*4]
          pop ds:[0]
          push es:[9*4+2]
          pop ds:[2]
          cli
          mov es:[9*4+2],cs
          mov word ptr es:[9*4],offset nint
          sti

          mov ax,0b800h
          mov es,ax
          mov ah,'a'
        s:mov es:[160*12+40*2],ah
          call delay
          inc ah
          cmp ah,'z'
          jna s

          mov ax,0
          mov es,ax
          cli
          push ds:[0]
          pop es:[9*4]
          push ds:[2]
          pop es:[9*4+2]
          sti

          mov ax,4c00h
          int 21h

    delay:push ax
          push dx
          mov dx,1000h
          mov ax,0
       s1:sub ax,1
          sbb dx,0
          cmp ax,0
          jne s1
          cmp dx,0
          jne s1
          pop dx
          pop ax
          ret

     nint:push ax
          push es

          pushf
          in al,60h
          call dword ptr ds:[0]

          cmp al,1
          jne nintend

          mov ax,0b800h
          mov es,ax
          inc byte ptr es:[160*12+40*2+1]

  nintend:pop es
          pop ax
          iret


code ends
end start
