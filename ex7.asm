assume cs:code,ds:data,ss:table 

	data segment
		db '1975','1976','1977','1978','1979','1980','1981','1982','1983'
		db '1984','1985','1986','1987','1988','1989','1990','1991','1992'
		db '1993','1994','1995'    
		
		dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
		dd 345980,5908277,803530,1183000,1843000,2759000,3753000,4649000,5937000   
		
		dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
		dw 11542,14430,15257,17800
		data ends
	table segment
		db 21 dup ('year summ ne ?? ')
		table ends
	code segment	
		start:
		mov ax,data
		mov ds,ax 
		
		mov ax,table
		mov ss,ax		
		mov bp,0   
		
		mov bx,0   		
		mov si,0
		mov di,0   
		
		mov cx,21
		s:
		mov ax,[bx]
		mov [bp],ax
		mov ax,[bx+2]   
		mov [bp+2],ax
		mov byte ptr[bp+4],' '
		
		mov ax,[si+84]
		mov dx,[si+84+2]
		mov [bp+5],ax		
		mov [bp+7],dx	
		mov byte ptr[bp+9],' '
		
		mov ax,[di+168]
		mov [bp+0aH],ax
		mov byte ptr[bp+0ch],' '
		mov byte ptr[bp+0fh],' '
		
		div word ptr[di+168]
		mov [bp+0dH],ax
						
		add bp,10h
		add bx,4h
		add si,4h
		add di,2h
		
		loop s
		
		
		
		
		mov 4c00h
		int 21h
		code ends
	end start	