section .text
global _count_chars

_count_chars:
; Arguments:
; str: [esp + 4]
%idefine my_str [esp + 4]
mov ecx, [esp + 4]
mov eax, 0

process_loop:
cmp byte[ecx], 0
jz done

inc eax
inc ecx
jmp process_loop

done:
ret