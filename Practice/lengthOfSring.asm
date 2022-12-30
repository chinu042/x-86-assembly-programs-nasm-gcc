;Compute length of string passed as a parameter to the macro.
%macro length 1

	xor ecx,ecx

lp:
    cmp byte[esi],0
    jz endof

    inc ecx
    inc esi
    jmp lp

endof:
    push ecx
    push msg1
    call printf
    add esp,8
    ret

%endmacro	


section .data
	str1 db 'sagar dahatonde',0
	msg1 db 'String Length = %d',10,0

section .text
	global main
	extern printf

main :
	mov esi,str1
	length esi