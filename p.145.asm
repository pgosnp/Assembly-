assume cs:code,ds:data
data segment
    db 'BaSiC'
    db 'MinIX'
    data ends
code segment
    start:
        mov bx,0
        mov cx,5
        s:
            mov al,ds:[bx]
            and al,11011111B 
            mov [bx],al      
            mov al,ds:[bx+5]      
            or al,00100000B     
            mov [bx+5],al
            inc bx
            loop s
      mov ax,4c00h
      int 21h
      code ends
end start
            
             