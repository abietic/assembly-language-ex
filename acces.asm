assume cs:code,es:data    ;if you want use label in some segment
data segment              ;you must use "assume" to let the assembler know
    a db 1,2,3,4,5,6,7,8
    b dw 0
data ends
code segment
    start:mov ax,data     ;but you still need to initiate the register
          mov es,ax
          mov si,0
          mov cx,8
          sub ax,ax
        s:mov al,a[si]
          add b,ax        ;label without ':' can present not only address but also type
          inc si          ;add b,ax == add es:[8],ax
          loop s

          mov ax,4c00h
          int 21h
code ends
end start
