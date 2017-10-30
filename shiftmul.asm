assume cs:code
code segment
    mov ax,20
    call mul20

    mov bx,ax
    mov ax,4c00h
    int 21h

    mul20:push bx
          push cx
          mov cl,3
          mov bx,ax
          shl ax,cl  ;if step >1 use cx
          shl bx,1
          add ax,bx
          pop cx
          pop bx
          ret
code ends
end
