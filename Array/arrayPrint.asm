
section .data
	Array dd 10,20,30,40,50,-1
	msg db"Elements of the array are:- %d",10,0
section .text
	global main
	extern printf
main:
	xor ecx,ecx 
lp:
	mov ebx,Array 
	mov eax,4 
	mul ecx 
	add ebx,eax 
	cmp dword[ebx],-1
	jz endof
	pusha
	push dword[ebx]
	push msg
	call printf
	add esp,8
	popa
	inc ecx
	jmp lp
endof:
	ret
