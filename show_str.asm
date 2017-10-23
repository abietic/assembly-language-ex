assume cs:code
data segment
    db 'Welcome to masm!',0
data ends

code segment
start:  mov dh,8  ;roll
        mov dl,3  ;col
        mov cl,2  ;color
        mov ax,data
        mov ds,ax ;data stored
        mov si,0
        call show_str

        mov ax,4c00h
        int 21h

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