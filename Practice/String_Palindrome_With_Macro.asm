%macro palin 2
	
	mov ecx,%2
	mov edi,%1
	mov al,0
	repnz scasb
      
	mov ecx,%2
	dec ecx
	add edi,dword[ecx]
	mov esi,%1

%%back:   
	mov al,byte[esi]
	cmp al,byte[edi]
	jnz %%next
	inc esi
	dec edi
	dec ecx
	cmp ecx,0
	jz %%print
	jmp %%back
%%print:
	push msg1
	call puts
	add esp,4
	jmp %%end

%%next:
	push msg2
	call puts
	add esp,4
%%end:
	ret

%endmacro

section .data
	msg1 db 'It is a Palimdrom',0
	msg2 db 'It Is not Palimdrom String',0
	str1 db 'mansi',0
	len1 equ $-str1
	str2 db 'madam',0
	len equ $-str2

	
section .text
	global main
	extern puts,printf

main :
	mov eax,str2
	mov ebx,len
	palin eax,ebx
