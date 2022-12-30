section .data
	msg db "Hello 64 Bit!!", 10, 0
	msgLen equ $-msg

section .text
	global main
	extern printf

main:
	mov rax, 4
	mov rbx, 1
	mov rcx, msg
	mov rdx, msgLen
	int 80h

	; push rdi
	xor rax, rax
	mov rdi, msg
	call printf
	; pop rdi

	xor rax, rax
	ret
