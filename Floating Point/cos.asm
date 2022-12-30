section .data
	msg1 db "Output is %f",10,0
        a dq 90.00
section .bss
	sum resq 1
	mm resb 1
section .text
	global main
	extern printf
main:

	fld qword[a]

	fcos
	sub esp,8
	fstp qword[esp]
	push msg1
	call printf
	add esp,12
