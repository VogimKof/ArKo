section .text
    org 100h               ; Ustawienie adresu początkowego programu w pamięci

start:
    ; Wczytaj znak z klawiatury
    mov ah, 8              ; Usługa 8: wczytanie pojedynczego znaku z klawiatury
    int 21h                ; Wywołanie przerwania DOS

    ; Jeśli wczytany znak to '$', zakończ program
    cmp al, '$'            ; Sprawdzanie, czy wczytany znak to $
    je .exit               ; Jeśli znak to $, zakończ program

    ; Wyświetl wczytany znak
    mov dl, al             ; Ustawienie rejestru DL na wczytany znak
    mov ah, 2              ; Usługa 2: wyświetlenie znaku
    int 21h                ; Wywołanie przerwania DOS

    ; Dodaj nową linię (CR + LF)
    mov dl, 13             ; Kod ASCII dla CR (Carriage Return)
    mov ah, 2              ; Usługa 2: wyświetlenie znaku
    int 21h                ; Wywołanie przerwania DOS

    mov dl, 10             ; Kod ASCII dla LF (Line Feed)
    mov ah, 2              ; Usługa 2: wyświetlenie znaku
    int 21h                ; Wywołanie przerwania DOS

    jmp start              ; Powrót do początku pętli

.exit:
    mov ah, 4Ch            ; Usługa 4Ch: zakończenie programu
    int 21h                ; Wywołanie przerwania DOS
