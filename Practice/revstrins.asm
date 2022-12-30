section .data
	str1 db "sagar dahatonde",10,0
	len equ $-str1

section .bss
	str2 resb 100

section .text
	global main

main:
	mov esi,str1
	mov edi,str2
	mov ecx,len
	dec ecx
	add esi,ecx
	mov ecx,len

lp:	std
	lodsb
	cld
	stosb
	loop lp

	mov eax,4
	mov ebx,1
	mov ecx,str2
	mov edx,len
	int 80h