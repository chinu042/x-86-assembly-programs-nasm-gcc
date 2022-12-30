section .data
	msg db "sum is %d",10,0
	num dd 153
section .text
	global main	
	extern printf
main:
	mov edi,dword[num]
	xor esi,esi
lp1:
	mov ecx,edi
	mov eax,1
lp:
	mul ecx		;;eax = eax*ecx
	cmp ecx,1
	jz endof
	dec ecx
	jmp lp
endof:
	add esi,eax
	dec edi
	cmp edi,0
	jz endof2
	
	jmp lp1
endof2:
	pusha
	push esi
	push msg
	call printf
	add esp,8
	popa
	ret
