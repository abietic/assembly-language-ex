assume cs:code
code segment
    data: db "yy/mo/dd hh:mm:ss",0
    row: db 9,8,7,4,2,0

    start:mov ax,cs
          mov ds,ax
          mov es,ax
          mov di,offset data
          mov si,offset row
          mov cx,6
       s1:mov al,[si]
          out 70h,al
          in al,71h
          mov [si],al
          inc si
          loop s1
          mov si,offset row
          mov cx,6
       s2:call convert
          call insert
          inc si
          loop s2
          mov si,offset data
          mov dh,8
          mov dl,3
          mov cl,2
          call show_str
          mov ax,4c00h
          int 21h

  convert:push cx
          mov al,[si]
          mov ah,al
          mov cl,4
          shr al,cl
          and ah,00001111b
          add ah,30h
          add al,30h
          pop cx
          ret

          insert:nop
       bk:cmp byte ptr es:[di],'/'
          je re
          cmp byte ptr es:[di],' '
          je re
          cmp byte ptr es:[di],':'
          je re
       op:mov es:[di],ax
          add di,2
          ret
       re:inc di
          jmp bk


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
