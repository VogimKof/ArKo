section .text
	global _sum

_sum:
	;%idefine a [ebp + 4]
	;%idefine b [ebp + 8]
	
	push ebp
	mov ebp, esp
	
	mov eax, [ebp + 8]
	add eax, [ebp + 12]
	
	;leave ; mov esp, ebp | pop ebp
	pop ebp
	ret