section .data
	msg db "Enter a number whose table you want to display.",10,0
	input db "%d",0
	op db "%d * %d = %d",10,0

section .bss
	n resd 1

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

	mov ecx,1
lp:
	mov esi,dword[n]
	
	mov eax,ecx
	
	mul esi

	pusha
	push eax
	push ecx
	push esi
	push op
	call printf
	add esp,16
	popa

	cmp ecx,10
	jz endof

	inc ecx
	jmp lp
endof:
	ret
