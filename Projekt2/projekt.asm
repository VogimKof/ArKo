section .text
   global _x_cube_root
   
   %idefine x [ebp + 8]

_x_cube_root:
	push ebp
	mov ebp, esp

    mov ecx, 2500

    finit
    fld1 

    jmp x_cube_root_loop

x_cube_root_loop: ; st0 += [(ln(x)*(1/3))^n]/n!
    
    cmp ecx, 0
    je end_return

    call mianownik 
    call licznik 

    fdivp 

    faddp

    dec ecx
    jmp x_cube_root_loop

mianownik:
    push ecx 
    fld1

    call mianownik_loop 

    pop ecx
    ret

mianownik_loop:
    cmp ecx, 0
    jle return

    fld dword [const]
    fmulp
    call ln
    fmulp

    dec ecx
    jmp mianownik_loop

ln:
    fldln2
    fld dword x
    fyl2x
    ret 

licznik:
    push ecx

    fld1

    call licznik_loop 

    pop ecx
    ret

licznik_loop:
    cmp ecx, 1
    jle return

    push ecx
    fild dword [esp]
    pop ecx

    fmulp

    dec ecx
    jmp licznik_loop

return:
    ret

end_return:
    leave
    ret

section .data
	const dd 0.3333333333333;