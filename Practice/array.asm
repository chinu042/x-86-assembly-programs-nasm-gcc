	section.data
	Array dd 10,20,30,40,-1
	msg db "Addition of given numbers is %d",10,0
	section .text
	gloval main extern printf
main:
	mov eax,4     		;base
lp:	mov ebx,Array           ;index
	xor ecx,ecx             ;size
	mov eax,4               ;index*size 
	mul ecx                 ;base+mulresult
	add ebx,eax
	add esi,dword[ebx]
	cmp dword[ebx],-1
	jz endof
	push dword[ebx]
	push msg
	call printf
	add esp,8
	inc ecx
	jmp lp
	
endof:
	push esi
	push msg
	call printf
	add esp,
