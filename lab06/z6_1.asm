section .data
    buf db 20, 0, 20 dup(0)  ; Bufor na wprowadzone dane: maksymalna długość 20, początkowa długość 0
    len db 0                 ; Zmienna na długość tekstu (zapisywana przez int 21h, funkcja 0Ah)

section .text
    org 100h                

start:
    ; Wczytanie tekstu od użytkownika
    mov ah, 0Ah             
    lea dx, [buf]           ; Adres bufora, w którym będzie przechowywany tekst
    int 21h                 ; Wywołanie przerwania 21h
	
	
    ; Wczytany tekst jest teraz w buforze, a długość tekstu jest w buforze na pozycji 2
    mov cl, [buf+1]         ; Zmienna cl zawiera długość wprowadzonego tekstu (buf[1])
    mov [len], cl           ; Zapisz długość wprowadzonego tekstu do zmiennej 'len'

    ; Teraz wypisz tekst od tyłu, korzystając ze stosu
    lea si, [buf+2]         ; SI wskazuje na początek tekstu (po 2 pierwszych bajtach: max i długość)
    
reverse_loop:
    mov al, [si]            ; Pobierz znak z bufora
    cmp al, 0               ; Sprawdź, czy to znak null (koniec ciągu)
    je reverse_done         ; Jeśli to koniec, zakończ

    push ax                 ; Przechowaj znak na stosie
    inc si                  ; Przejdź do następnego znaku
    jmp reverse_loop        ; Powtarzaj pętlę

reverse_done:
    ; Teraz wypisz tekst od tyłu
    pop ax                  ; Pobierz znak ze stosu
    cmp al, 0               ; Jeśli stos jest pusty, zakończ
    je end_program 
    mov dl, al              ; Przenieś znak do DL, żeby go wypisać
    mov ah, 02h             ; Funkcja 02h przerwania 21h (wypisanie znaku)
    int 21h                 ; Wywołanie przerwania 21h
    jmp reverse_done        ; Powtarzaj, aż stos będzie pusty

end_program:
    ; Zakończenie programu
    mov ah, 4Ch             ; Funkcja 4Ch przerwania 21h (wyjście z programu)
    int 21h                 ; Wywołanie przerwania 21h
