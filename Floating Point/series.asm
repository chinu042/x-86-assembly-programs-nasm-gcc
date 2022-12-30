section .data
    n dd 4
    msg db "Addition is %f",10,0
section .bss
   	sum resq 1
	i resb 1

section .text
   global main
	extern printf
main:   fldz
	fstp qword[sum];make it sum =0
        mov eax,4
p:
        mov dword[i],eax
	fild dword[i]
	fld1
	fdiv st1
	fadd qword[sum]
	fchs
	fstp qword[sum]
	dec eax
	cmp eax,0
	jnz p
	fld qword[sum]
	sub esp,8
	fstp qword[esp]
	push msg
	call printf
	add esp,12
	
