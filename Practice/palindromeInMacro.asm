%macro isPalindrome 2

	mov esi,%1
	mov edi,%1
	
	add esi,%2
	dec esi
	dec esi

%%lp:
	cmp byte[edi],0
	jz %%yes

	mov al,byte[edi]
	cmp byte[esi],al
	jnz %%no

	dec esi
	inc edi
	jmp %%lp
%%yes:
	pusha
	push yesMsg
	call printf
	add esp,4
	popa

	jmp endof

%%no:
	pusha
	push noMsg
	call printf
	add esp,4
	popa

	jmp endof


%endmacro

section .data
	msg db "niitin",0
	len equ $-msg
	yesMsg db "string is palindrome",0
	noMsg db "string is NOT palindrome",0
section .text
	global main
	extern printf
main:
	isPalindrome msg,len
endof:
	ret
