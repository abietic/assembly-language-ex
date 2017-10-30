assume cs:code
code segment
start:mov ax,cs
      mov ds,ax
      mov si,offset ishow
      mov ax,0
      mov es,ax
      mov di,200h
      mov cx,offset ishowend - offset ishow
      cld
      rep movsb
      mov word ptr es:[7ch * 4],200h
      mov word ptr es:[7ch * 4 + 2],0
      mov ax,4c00h
      int 21h

ishow:push ax
push bx
push es
push di
push cx

mov ax,0
mov al,dh
sub al,1
mov bx,160
mul bl
push ax
mov ax,0b800h
mov es,ax

mov ax,0
mov al,dl
sub al,1
mov bx,2
mul bl
pop di
add di,ax

mov ax,0
mov al,cl
mov cx,0

l:
mov cl,ds:[si]
jcxz toend
mov es:[di],cl
inc di
mov es:[di],al
inc di
inc si
jmp l

toend:
pop cx
pop di
pop es
pop bx
pop ax

      iret
ishowend:nop
code ends
end start
