section .data
	string db "Source String",0
	len equ $-string
	msg db " Length is %d",10,0
	
section .bss
	output resb len
	
section .text
	global main
	extern printf,puts
main:
	mov esi, string
	mov edi, output
	mov ecx, len
	
	pusha
	push ecx
	push msg
	call printf
	add esp,8
	popa
	
	dec ecx
	add esi,ecx
	dec esi
	
lp:
	xor eax,eax
	std
	lodsb
	cld
	stosb
	
	pusha
	push output
	call puts
	add esp,4
	popa
	loop lp
	
    ret
