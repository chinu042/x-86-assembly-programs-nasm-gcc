section .data
	msg db "Enter size of array ",0
	input db "%d",0
	msg2 db "Enter number you want to find",10,0
	msg3 db "Occured %d time",10,0
	
section .bss
	array resd 10
	n resd 1
	num resd 1
	
section .text
	global main
	extern printf,scanf
main:
	
	push msg
	call printf
	add esp,4

	push n
	push input
	call scanf
	add esp,8

	xor ecx,ecx
scan:
	mov ebx,array
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

	pusha
	push msg2
	call printf
	add esp,4
	popa
	
	pusha
	push num
	push input
	call scanf
	add esp,8
	popa

	xor ecx,ecx
	xor esi,esi
	mov edi,dword[num]
while:
	mov ebx,array
	mov eax,4
	mul ecx
	add ebx,eax
	
	cmp dword[ebx],edi
	jnz noIncrement
	inc esi
	
noIncrement:
	inc ecx
	cmp ecx,dword[n]
	jl while	

endof:	
	pusha
	push esi
	push msg3
	call printf
	add esp,8
	popa

	ret
