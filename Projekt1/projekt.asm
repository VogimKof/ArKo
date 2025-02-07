;Napisać program, który pobierze z wejścia łańcuch znaków a na wyjściu wygeneruje z niego odwróconą piramidę wedle przykładu: dla ciągu wejściowego „abc” piramida wyglądać będzie następująco: 
;aaaaa 
; bbb 
;  c 
;Program powinien zakończyć się po naciśnięciu przez użytkownika klawisza F10. Przewidź sytuacje wyjątkowe.


section .data
    initial_message db "Nacisnij jakikolwiek przycisk aby przejsc dalej lub F10 aby zakonczyc program.", 13, 10, "$"
    prompt db "Podaj lancuch znakowy: $"
    newline db 13, 10, "$"      
    empty_error db "Blad: lancuch nie moze byc pusty! $"
    buffer db 80, 0, 80 dup(0)  ; Bufor na wczytany ciąg (maks. 80 znaków)

    len db 0                    ; Długość wprowadzonego ciągu
    indeks db 0                 ; Aktualny indeks znaku
    ile_znakow db 0             ; Liczba znaków do wydrukowania

section .text
    org 100h                    

start:

    mov ah, 09h
    lea dx, [initial_message]
    int 21h

	mov ah, 0
    int 16h 
    cmp ah, 44h
    je exit_program
	
	jmp main_loop


main_loop:

	mov ah, 09h
    lea dx, [prompt]
    int 21h

    ; Wczytanie ciągu znaków
    lea dx, [buffer]
    mov ah, 0Ah
    int 21h

    mov al, [buffer+1]          
    mov [len], al               
    cmp al, 0                   
    je handle_empty             

    
    mov al, [len]               
    mov bl, 2
    mul bl                      
    dec ax                      
    mov [ile_znakow], al        

    
    mov byte [indeks], 0

    mov ah, 09h
    lea dx, [newline]
    int 21h
	
   
    call generate_pyramid

    
    jmp start

handle_empty:
    mov ah, 09h
    lea dx, [empty_error]
    int 21h
	
	mov ah, 09h
    lea dx, [newline]
    int 21h
	
    jmp start               

exit_program:
    mov ah, 4Ch
    int 21h


generate_pyramid:
    push bx                  
    push cx
    push dx
    push si

generate_loop:
 
    mov al, [len]            
    cmp byte [indeks], al    
    jge end_generate_pyramid 

    
    movzx bx, byte [indeks]
    push bx                  
    cmp bx, 0                
    je skip_spaces           
    mov cx, bx               
    call print_spaces        

skip_spaces:
    
    lea si, [buffer+2]       
    movzx bx, byte [indeks]  
    add si, bx               
    mov dl, [si]             

    
    movzx cx, byte [ile_znakow]
    call print_chars         

    
    mov ah, 09h
    lea dx, [newline]
    int 21h

    
    pop bx                   
    mov byte [indeks], bl    
    inc byte [indeks]

    
    sub byte [ile_znakow], 2
    jmp generate_loop

end_generate_pyramid:
    pop si                   
    pop dx
    pop cx
    pop bx
    ret

print_spaces:
    mov ah, 02h              
    mov dl, ' '              
print_space_loop:
    int 21h
    loop print_space_loop
    ret


print_chars:
    mov ah, 02h              
print_char_loop:
    int 21h
    loop print_char_loop
    ret
