section .text
	global _silnia
	

_silnia:
    ; Sprawdzamy, czy argument (w eax) jest 0 lub 1 (silnia(0) = 1, silnia(1) = 1)
    cmp eax, 1
    jbe .return_one         ; Jeśli eax <= 1, zwróć 1

    ; Zapisz eax na stosie, aby zachować oryginalny argument
    push eax

    ; Zmniejsz eax o 1 (n-1) i wywołaj rekurencyjnie silnia(n-1)
    dec eax
    call _silnia            ; Wywołaj rekurencyjnie silnia(n-1)

    ; Po powrocie z rekurencji, w eax mamy wynik silnia(n-1), pomnożymy to przez n
    pop ebx                 ; Przywróć oryginalny argument z stosu do rejestru ebx
    imul eax, ebx           ; eax = eax * ebx (silnia(n) = n * silnia(n-1))

    ret                     ; Zwróć wynik (silnia(n))

.return_one:
    mov eax, 1              ; Jeśli eax <= 1, wynik = 1
    ret