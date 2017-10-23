assume cs:code
code segment
start:
mov dx,000fh  ;dividend upper
mov ax,4240h  ;dividend lower
mov cx,0ah    ;divisor
call divdw

mov ax,4c00h
int 21h

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
