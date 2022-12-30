section .data
	string db "madaam"
	len equ $-string
section .bss
	revstring resd len
section .text
	global main
	extern puts
main:
	mov esi,string
	mov edi,revstring
	mov ecx, len
	add esi,len
	dec esi
lp:	mov al,byte[esi]
	mov byte[edi],al
	dec esi
	inc edi
	loop lp

	push revstring
	call puts
	add esp,4