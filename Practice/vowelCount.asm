section .data
	msg db "I love you too..!",10,0
	op db "number of vowels are %d",10,0
section .text
	global main
	extern printf
main:
	mov esi,msg
	xor ecx,ecx
lp:
	cmp byte[esi],0
	jz endof

	cmp byte[esi],'A'
	jz incCount


	cmp byte[esi],'E'
	jz incCount


	cmp byte[esi],'I'
	jz incCount


	cmp byte[esi],'O'
	jz incCount


	cmp byte[esi],'U'
	jz incCount


	cmp byte[esi],'a'
	jz incCount

	cmp byte[esi],'e'
	jz incCount

	cmp byte[esi],'i'
	jz incCount

	cmp byte[esi],'o'
	jz incCount

	cmp byte[esi],'u'
	jz incCount

	inc esi
	jmp lp
incCount:
	inc ecx
	inc esi
	jmp lp

endof:
	pusha
	push ecx
	push op
	call printf
	add esp,8
	popa
	
	ret
