section .data
	msg db"%d ",10,0 
section .text
	global function
	extern printf

function:
	enter 16,0 
	mov ecx, 10
	mov dword[ebp-4] , 1
	
lp:	mov eax, dword[ebp-4]
	mov ebx, dword[ebp+8]
	mul ebx
	
	pusha
	push eax
	push msg
	call printf
	add esp, 8
	popa
	
	inc dword[ebp-4]
	loop lp
	leave
	
	ret
	
	
