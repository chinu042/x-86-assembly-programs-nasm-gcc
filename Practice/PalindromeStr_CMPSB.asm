;;; CMPS :CMPSB CMPSW CMPSD

section .data
	source db "madam",0
	len equ $-source
	msg db " Length is %d",10,0
	msg1 db "String is Palindrome",10,0
	msg2 db "String is not Palindrome",10,0
section .bss
	destination resb len
section .text
	global main
	extern printf , puts
main:
	mov esi, source
	mov edi, destination
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
lp:	xor eax,eax
	std
	lodsb
	cld
	stosb
	pusha
	push destination
	call puts
	add esp,4
	popa
	loop lp
	
	mov esi, source
	mov edi, destination
	mov ecx,len
lp2:	cmpsb
	jnz lp3
	dec ecx
	cmp ecx,0
	jz end1
	jmp lp2
lp3:	 push msg2
	call puts
	add esp,4
	jmp lp4
end1:
	push msg1
	call puts
	add esp,4
lp4:	ret
	
