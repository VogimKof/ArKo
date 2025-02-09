; To jest procedura, ktora wypelnia tablicę wartościami typu integer o 1 większymi
section .text use32

global	_tablica

_tablica:
	;Tu standardowo tworzymy ramka stosu
	push	ebp
	mov	ebp, esp
	;[ebp+8] pokazuje adres przekazany do procedury (wskaźnik)
	mov eax, [ebp+8] ; tu kopiujemy wartość spod adresu przechowywanego w [ebp+8]
	;xor edi, edi
	xor edx, edx
	mov ecx, 4
petla:
	mov ebx, [eax+edx]
	inc ebx
	; Tu robimy adresowanie rejestrowe z indeksowaiem
	mov [eax+edx], ebx
	add edx, 4
	loop petla
	
	;[eax] to wartość przechowywana pod adresem [ebp+8]. 
	;Operacja zwiększa o 1 wartość argumentu przekazanego przez wska�nik
	;add [eax],ebx
	leave
	
	ret