section .data
	array dd 20,10,30,40,-1
	op db "second max element is %d",10,0
section .text
	global main
	extern printf
main:
	mov esi,dword[array]
	mov edi,dword[array]
	xor ecx,ecx
lp:
	mov ebx,dword[array+ecx*4]
	
	cmp ebx,-1
	jz endof

	cmp ebx,esi
	jg changeMax
	
	inc ecx
	jmp lp
changeMax:
	mov edi,esi
	mov esi,ebx
	inc ecx
	jmp lp
endof:
	pusha
	push edi
	push op
	call printf
	add esp,8
	popa

	ret
