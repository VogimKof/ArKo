section .bss
    buf db 256          ; bufor na wprowadzony tekst
    len db 0            ; zmienna na długość tekstu

section .text
    global _start

_start:
    
    mov ah, 0x0A        
    mov dx, buf         
    int 21h            

    
    mov al, [buf + 1]   
    mov [len], al       

    
    mov cx, [len]       
    mov si, buf + 2    

print_loop:
    
    cmp cx, 0
    je .done            

    mov ah,9       
    mov dx, si          
    int 21h           

    dec cx              
    jmp print_loop     
.done:
    
    mov ax, 0x4C00      
    int 0x21            