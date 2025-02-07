section .bss
    buf db 256         

section .text
    global _start

_start:
    
    mov ah, 10       
    mov dx, buf         
    int 21h            
    
    mov si, buf + 2     

    mov cl, [buf + 1]   

print_loop:
    
    cmp cl, 0
    je .done            

   
    mov al, [si]        
    mov ah, 15      
    int 10h           ;

    inc si              
    dec cl              
    jmp print_loop      

.done:
 
    mov ax,4Ch     
    int 21h         
