assume cs:code
data segment
    db 10 dup(0)
data ends

code segment
    start:mov ax,12666
          mov bx,data
          mov si,0
          call dtoc

          mov ds,bx
          mov si,0

          mov dh,8
          mov dl,3
          mov cl,2
          call show_str

          mov ax,4c00h
          int 21h

    dtoc:push di
         push dx
         push es

         mov di,10
         mov es,bx
     cal:xor dx,dx
         div di
         add dl,48
         push dx
         inc si
         cmp ax,0
         jne cal

         xor di,di
       s:pop dx
         mov es:[di],dl
         dec si
         inc di
         cmp si,0
         jne s


         pop es
         pop dx
         pop di

         ret

         show_str:
         push ax
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
         ret





code ends
end start
