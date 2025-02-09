section .text use32

global	_wskaznik

_wskaznik:
	;Tu standardowo tworzymy ramkę stosu
	push	ebp
	mov	ebp, esp
	;Wskaźnik jest argumentem przekazanym przez stos. 
	;[ebp] pokazuje starą zawartość ebp
	;[ebp+4] pokazuje adres powrotu
	;[ebp+8] pokazuje adres przekazany do procedury (wskaźnik)
	mov eax, [ebp+8] ; tu kopiujemy wartość spod adresu przechowywanego w [ebp+8]
	mov ebx, 4
	;[eax] to wartośćprzechowywana pod adresem [ebp+8]. 
	;Operacja zwiększa o 1 wartość argumentu przekazanego przez wskaźnik
	add [eax],ebx
	leave
	
	ret