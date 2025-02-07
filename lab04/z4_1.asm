section .txt
	org 100h
	
start:
	mov al, [a]  ; przypisanie liczby a do al
	mov bl, [b] ; przypisanie liczby b do bl
	
	div bl 		; podzielenie liczby przez 100
	
	mov result, [al]
	mov al, [ah]
	
	mov ah, 2
	mov dx, result
	int 21h
	
	
	xor bl, bl
	mov bl, 10
	
	div bl
	
	mov result, [al]
	mov al, [ah]
	
	mov ah, 2
	mov dx, result
	int 21h
	
	
	mov ah, 2
	mov dx, ah
	int 21h
	

	
	
section .data
	a db 123
	b db 100
	result db 0