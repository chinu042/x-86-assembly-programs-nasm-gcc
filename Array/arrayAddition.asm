section .data
	Array dd 1,2,3,4,5,6,7,-1
	msg db "The sum of array elements is:- %d",10,0
section .text
	global main
	extern printf
main:
	xor ecx,ecx
	xor esi,esi
lp:	
	mov ebx,Array
	mov eax,4
	mul ecx
	add ebx,eax
	cmp dword[ebx],-1
	jz endof
	add esi,dword[ebx]
	pusha
	popa
	inc ecx
	jmp lp
endof:
	push esi
	push msg
	call printf
	add esp,8
	
	ret
