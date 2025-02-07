section .txt
	org 100h
	
_start:
    
    mov al, [num]     
    mov cx, 3 
	mov bl, [b]
	
	loop my_loop
	
	mov ax, 4Ch
	int 21h
	
	
my_loop:
	
	
	div bl 
	
	mov result, [ah]
	mov al, [al]
	
	mov ah, 2
	mov dx, result
	int 21h
	
	DEC cx 
	
	cmp cx, 0
	je cx
	

		
	
	
section .data
	num db 123
	b db 10
	result db 0