section .data
	r dq 2.1	
	b dq 2.6         	
	two dd 2
	msg db " Result is %f",10,0
section .bss
	result resq 1

section .text
	global main
	extern printf

main:
	fldpi 					
	fld qword[r]
	fmul qword[r]
	fmul st1
	fild dword[two]
	fmul st1
	ret
