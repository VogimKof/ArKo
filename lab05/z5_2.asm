section .data
    original_string db 'abcdeabcdeabcdeabcde', 0   ; Zdefiniowany ciąg znaków
    string_length  equ 20   

section .text
    org 100h                                       
start:
    mov si, 0                                     ; SI wskazuje na początek ciągu (adres pierwszego znaku)
    mov cx, string_length                        ; Długość ciągu (20 znaków)

loop_start:
    mov al, [original_string + si]               ; Wczytaj znak z ciągu (z adresu SI)
    cmp al, 'a'                                   ; Sprawdź, czy znak to 'c'
    je skip_char                                  ; Jeśli tak, przeskocz do następnego znaku

    cmp al, 'b'                                   ; Sprawdź, czy znak to 'e'
    je skip_char                                  ; Jeśli tak, przeskocz do następnego znaku

    ; Jeśli znak nie jest 'c' ani 'e', wypisz go
    mov dl, al                                    ; Ustaw DL na wczytany znak
    mov ah, 2                                      ; Usługa 2: wypisz znak
    int 21h                                       ; Wywołanie przerwania DOS (wypisz znak)

skip_char:
    inc si                                         ; Przejdź do następnego znaku
    loop loop_start                                ; Powtórz pętlę dla wszystkich 20 znaków

    ; Zakończenie programu
    mov ah, 4Ch                                    ; Usługa 4Ch: zakończenie programu
    int 21h                                        ; Wywołanie przerwania DOS (zakończenie programu)
