section .data
	result db "Returned value is %d",10,0
section .text
	global main
	extern function, printf
main:
	mov esi,23
	push esi
	call function
	add esp,4

	push eax
	push result
	call printf
	add esp,8
	
