section .data
	msg db "Insufficient Parameters",10,0
	msg2 db "envp [%d] = %s and argv[%d] = %s",10,0
	msg3 db "%s",10,0
	msg4 db "Sum: %d",10,0
section .text
	global main
	extern printf,atoi
main:
	push ebp
	mov ebp,esp
	mov ecx,[ebp+8]
	cmp ecx,2
	jb end

	xor edx,edx
lp:	
	push edx
	mov esi,[ebp+12]	;;argv
	mov edi,[ebp+16]	;;envp
	push dword[esi+edx*4]	;;argv[i]
	push edx		;;i
	push dword[edi+edx*4]	;;envp[i]
	push edx		;;i
	push msg2
	call printf
	add esp,20
	pop edx
	inc edx
	cmp edx,5
	jb lp

	jmp terminate

end:
	push msg
	call printf
	add esp,4

	mov esi,[ebp+12]
	mov edx,dword[esi+4]
	push edx
	call atoi
	add esp,4

	mov edx,10
	add edx,eax

terminate:
	mov esp,ebp
	pop ebp
	ret