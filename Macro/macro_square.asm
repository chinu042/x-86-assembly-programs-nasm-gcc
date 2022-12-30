%macro square 2

        xor ecx,ecx 
	mov eax,%1
	mul eax

	mov ecx,eax

	mov eax,%2
	mul eax

	sub ecx,eax
	
        push ecx
	push msg
	call printf
	add esp,8

end:


%endmacro

section .data

	a dd 5
	b dd 4
	msg db "Square(a)-Square(b)=%d",0

section .text
	
	global main
	extern printf

main:
	square dword[a],dword[b]
	ret
