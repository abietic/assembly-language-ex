assume cs:code,ds:data,es:table,ss:stack

data segment
        db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
        db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
        db '1993','1994','1995'

        dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
        dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000

        dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
        dw 11542,14430,15257,17800

data ends

table segment
        db 21 dup ('year summ ne ?? ')
table ends

stack segment
        dw 0,0,0,0,0,0,0,0
stack ends

code segment
        start:mov ax,data   ;give adress to ds es ss sp
              mov ds,ax

              mov ax,table
              mov es,ax

              mov ax,stack
              mov ss,ax
              mov sp,16

              mov cx,21    ;set a loop count 21 times for the filling

              mov bx,0     ;adress for years and over-all income

              mov si,0     ;adress for table

              mov di,0a8h  ;adress for the num of employees

            s:push cx            ;loop s in here
              mov cx,2           ;restore the count of cx

            r:mov ax,[bx]        ;loop r is inside loop s
              mov es:[si],ax
              mov ax,54h[bx]
              mov es:5[si],ax
              add bx,2
              add si,2
              loop r

            sub si,4              ;get back the table adress

            mov ax,[di]           ;deal with num of employees
            mov es:0ah[si],ax
            add di,2

            mov ax,es:5[si]       ;do the divide
            mov dx,es:7[si]
            div word ptr es:0ah[si]
            mov es:0dh[si],ax


            add si,10h            ;next table adress
            pop cx                ;get back the real cx
            loop s

            mov ax,4c00h
            int 21h

code ends
end start
