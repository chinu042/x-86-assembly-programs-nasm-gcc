section .data
	arr dd 10,20,30,-1
	arr2 dd 10,20,30,-1
	msg db "%d",10,0

section .bss
	arr3 resd 3

section .text
	global main
	extern printf
	
main:
	xor ecx,ecx
	
add:	
	mov ebx,arr
	mov esi,arr2
	mov edi,arr3
	
	mov eax,4
	mul ecx
	
	add ebx,eax
	add esi,eax
	add edi,eax
	
	xor edx,edx
	
	mov edx,dword[ebx]
	
	cmp edx,-1
	jz printadd
	
	add edx,dword[esi]
	mov dword[edi],edx
	
	inc ecx
	jmp add
	
printadd:

	xor ecx,ecx
	
printadd2:	
	mov edi,arr3
	mov eax,4
	mul ecx
	add edi,eax
	
	pusha
	push dword[edi]
	push msg
	call printf
	add esp,8
	popa
	 
	inc ecx
	cmp ecx, 3
	jnz printadd2
		
ter:	ret
