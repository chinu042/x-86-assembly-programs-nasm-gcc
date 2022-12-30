section .text
	global main
	extern fibo
main:
	mov eax,10
	push eax
	call fibo
	add esp,4
