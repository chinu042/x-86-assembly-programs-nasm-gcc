section .data
	palin db "String is palindrome",0
	notpalin db "String is not palindrome",0
	string db "ncn"
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
	
reverse:	
	mov al,byte[esi]
	mov byte[edi],al
	dec esi
	inc edi
	loop reverse

	push string
	call puts
	add esp,4
	push revstring
	call puts
	add esp,4
	
	mov esi, string
	mov edi,revstring
	mov ecx, len
	
palindrome:
	xor eax,eax
	mov al, byte[esi]
	cmp al,byte[edi]
	jnz notpalindrome
	inc esi
	inc edi
	dec ecx
	jnz palindrome
	push palin
	call puts
	add esp,4
	jmp endof
	
notpalindrome:
	push notpalin
	call puts
	add esp,4
endof:	ret
