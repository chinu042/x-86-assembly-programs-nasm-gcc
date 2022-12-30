section .data
	msg1 db "Enter how many elements: ",0
	input db "%d",0
	msg2 db "minimum element is %d",10,0

section .bss
	Array resd 10
	n resd 1

section .text
	global main
	extern printf,scanf

main:
	push msg1
	call printf
	add esp,4

	push n
	push input
	call scanf
	add esp,8
	
	xor ecx,ecx
scan:
	mov ebx,Array
	mov eax,4
	mul ecx
	add ebx,eax
	
	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa


	inc ecx
	cmp ecx,dword[n]
	jl scan

	xor ecx,ecx
	mov esi,dword[Array]

while:
	mov ebx,Array
	mov eax,4
	mul ecx
	add ebx,eax
	
	cmp dword[ebx],esi
	jnl notFound
	mov esi,dword[ebx]

notFound:
	inc ecx
	cmp ecx,dword[n]
	jl while	

endof:	
	pusha
	push esi
	push msg2
	call printf
	add esp,8
	popa

	ret
