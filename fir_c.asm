assume cs:code

data segment                            ;search nums' val between (32,128)
    db 32,20,60,128,250,40,5,0,4,9
    db 7,28,128,47,66,98,230,240,129,3
    db 12 dup (32)
data ends

code segment
    start:mov ax,data
          mov ds,ax

          mov bx,0
          mov dx,0
          mov cx,32
        s:mov al,[bx]
          cmp al,32
          jna s0        ;if not above 32 not valid
          cmp al,128
          jnb s0        ;if not below 128 not valid
          inc dx
       s0:inc bx
          loop s

          mov ax,4c00h
          int 21h
code ends
end start
