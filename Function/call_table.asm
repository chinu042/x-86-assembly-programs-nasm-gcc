section .text
	global main
	extern function
main:
	mov eax,12
	push eax
	call function
	add esp,4
