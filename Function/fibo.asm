section .data
	msg db " %d ",10,0
	
section .text
	global fibo
	extern printf
fibo:	
	enter 12,0		; 3 local variables 3*4
	mov ecx, dword[ebp+8]
	mov dword[ebp-4],0
	
	pusha
	push dword[ebp-4]
	push msg
	call printf
	add esp,8
	popa
	
	dec ecx
	mov dword[ebp-8],1
	
	pusha
	push dword[ebp-8]
	push msg
	call printf
	add esp,8
	popa
	
	dec ecx	
lp:	mov eax,dword[ebp-4]
	add eax, dword[ebp-8]
	mov dword[ebp-12],eax
	
	pusha
	push eax
	push msg
	call printf
	add esp,8
	popa
	
	mov esi,dword[ebp-8]
	mov dword[ebp-4],esi
	mov dword[ebp-8],eax
	loop lp
	leave
	
	ret
