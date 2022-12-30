section .data
	msg1 db "%d"
	msg2 db "f"
	pi dq 3.14
section .rodata
	msg db "Enter a,b and c",10,0
section .bss
	a resd 1
	b resd 1
	c resd 1
	sum resq 1
	res resq 1
	finalres  resq 1
section .text
	global main
	extern printf,scanf
main:
	pusha
	push msg
	call printf
	add esp,4
	popa
	
	pusha
	push a
	push msg1
	call scanf
	add esp,8
	popa
	
	pusha
	push b 
	push msg1
	call scanf	
	add esp,8
	popa

	pusha
	push c
	push msg1
	call scanf
	add esp,8
	popa
	
	fld qword[pi]
	fild dword[a]
	fsqrt
	fadd st1
	fstp qword[sum]
	
	fild dword[a]
	fmul dword[b]
	fsub dword[c]
	fsqrt
	fstp qword[res]
	fld qword[sum]
	fsub qword[res]
	fstp qword[finalres]
	 
	fld qword[finalres]
	sub esp,8
	fstp qword[esp]
	push msg2
	call printf
	add esp,12
	
	
