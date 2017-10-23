assume cs:code
data segment
    db 10 dup(0)
data ends

code segment
    start:mov ax,4240h
          mov dx,000fh
          mov bx,data
          mov si,0
          call ndtoc

          mov ds,bx
          mov si,0

          mov dh,8
          mov dl,3
          mov cl,2
          call show_str

          mov ax,4c00h
          int 21h

   ndtoc:push di
         push es

         mov di,10
         mov es,bx
     cal:mov cx,10
         call divdw
         add cx,48
         push cx
         inc si
         cmp dx,0
         jne cal
         cmp ax,0
         jne cal

         xor di,di
       s:pop cx
         mov es:[di],cl
         dec si
         inc di
         cmp si,0
         jne s


         pop es
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


         divdw:
         push si
         push di


         push ax     ;save dividend lower

         mov ax,dx   ;do cal H/N
         xor dx,dx
         div cx
         mov si,ax   ;get&save Quotient int(H/N)
         mov di,dx   ;get&save Remainder rem(H/N)

         mov dx,di   ;no need to do cal (rem(H/N) * 65536)
         pop ax      ;because 65536 == 2^16 which can be present as left shift 16 bit in 8086 is the higher register DX
         div cx      ;done cal (rem(H/N) * 65536 + L) / N
         mov cx,dx   ;get the Remainder
         mov dx,si   ;put the int(H/N)





         pop di
         pop si
         ret






code ends
end start
