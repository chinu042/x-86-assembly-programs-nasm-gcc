;;  This code displays a square shape made up with *
section .data
	star db "*",0
	space db " ",0
	next db "",10,0
%macro printchar 2
       mov esi,%2
%%abc:
	cmp esi,0
	jz %%end
	mov eax,4
	mov edx,1
	mov ecx,%1
	mov edi,1
	int 0x80
	dec esi
	jmp %%abc
%%end:
%endmacro
section .text
	global main
main:	pusha
	printchar space,5
	printchar star,18
	printchar next,1
	popa
	mov ecx,10
abc:	cmp ecx,0
	je end
	pusha
	printchar space,5
	printchar star,1
	printchar space,16
	printchar star,1
	printchar next,1
	popa
	dec ecx
	jmp abc
end:	pusha
	printchar space,5
	printchar star,18
	printchar next,1
	popa
	ret
	

