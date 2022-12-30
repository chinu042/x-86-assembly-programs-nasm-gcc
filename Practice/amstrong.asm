section .data
	num dd 153
	msg1 db "number is amstrong number",10,0
	msg2 db "number is not amstrong number",10,0
section .text
	global main
	extern printf
main:
	mov ecx,dword[num]
	xor esi,esi
lp:
	cmp ecx,0
	jz endof
	
	mov eax,ecx
	mov ebx,10
	xor edx,edx	;;edx must stay 0 during div
	
	div ebx		;;eax = eax/10
	mov ecx,eax	;;ecx = 15, edx = 3

	mov edi,edx
	mov eax,edi	;;eax = 3
	mul edi		;;eax = 3*3
	mul edi		;;eax = 3*3*3

	add esi,eax

	jmp lp
endof:
	mov ecx,dword[num]
	cmp ecx,esi
	jz printMsg1
	;;if not equal print msg2 and end

	pusha
	push msg2
	call printf
	add esp,4
	popa

	ret
printMsg1:
	pusha
	push msg1
	call printf
	add esp,4
	popa
	ret
