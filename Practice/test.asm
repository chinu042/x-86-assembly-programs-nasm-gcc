	section .data
	msg db"hello world" ,10,0
	section .text
	global main
	extern printf
main:
	push msg
	call printf
	add esp,4
	ret
	
