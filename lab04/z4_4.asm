section .txt
	org 100h
	
start:
    mov al, [number]          ; Załaduj liczbę do AL
    mov bl, 1                 ; Zainicjalizuj wynik na 1

	loop factorial_loop
	
	add al, '0'
	
	
	mov ax, 4Ch
	int 21h

factorial_loop:
    mul bl                    ; Mnożenie AL przez BL (aktualny wynik)
    dec al                    ; Zmniejsz AL (zmniejsz licznik)
    jnz factorial_loop        ; Powtarzaj, dopóki AL nie będzie zerow

	
	
	
section .data
	num db 5
	result db 1