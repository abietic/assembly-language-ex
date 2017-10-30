assume cs:code
code segment
    start:mov ax,cs
          mov ds,ax
          mov si,offset iscreen
          mov ax,0
          mov es,ax
          mov di,200h
          mov cx,offset iscreend - offset iscreen
          cld
          rep movsb
          mov word ptr es:[7ch*4],200h
          mov word ptr es:[7ch*4+2],0
          mov ax,4c00h
          int 21h

          iscreen:jmp short do                  ;cs:0028h
              subtable dw sub1,sub2,sub3,sub4   ;this is only the offset of labels in this very program
           do:push bx                           ;which is acculate by the assembler
              cmp ah,3
              ja return
              mov bx,0
              mov bl,ah
              add bx,bx
              mov bx,word ptr subtable[bx-28h+200h] ;cause the the fisrt ins of "iscreen" is cs:0028h
              sub bx,28h                            ;and "subtable" only represent a number after assembly
              add bx,200h                           ;so after loaded into 0:200h we need a real offset
              call bx                               ;mov bx,subtable[bx-28h+200h] == mov bx,cs:2[bx+200h]
       return:pop bx                                ;                                         '2'is the length of jmp
              iret
          sub1:push ax
               push cx
               push ds
               mov ax,0b800h
               mov ds,ax
               mov bx,0
               mov cx,2000
            s1:mov byte ptr [bx],0
               add bx,2
               loop s1
               pop ds
               pop cx
               pop ax
               ret
         sub2:push ax
              push cx
              push ds
              push si
              mov bl,al
              and bl,00000111b
              mov ax,0b800h
              mov ds,ax
              mov si,1
              mov cx,2000
           s2:and byte ptr [si],11111000b
              or byte ptr [si],bl
              add si,2
              loop s2
              pop si
              pop ds
              pop cx
              pop ax
              ret
         sub3:push ax
              push cx
              push ds
              push si
              mov bl,al
              and bl,01110000b
              mov ax,0b800h
              mov ds,ax
              mov si,1
              mov cx,2000
           s3:and byte ptr [si],10001111b
              or byte ptr [si],bl
              add si,2
              loop s3
              pop si
              pop ds
              pop cx
              pop ax
              ret
         sub4:push ax
              push cx
              push ds
              push si
              push di
              push es
              mov ax,0b800h
              mov ds,ax
              mov es,ax
              mov si,160
              mov di,0
              mov cx,2000 - 80
              cld
              rep movsb
              mov cx,80
              mov di,4000-160
           s4:mov byte ptr [di],0
              add di,2
              loop s4
              pop es
              pop di
              pop si
              pop ds
              pop cx
              pop ax
              ret
          iscreend:nop
code ends
end start
