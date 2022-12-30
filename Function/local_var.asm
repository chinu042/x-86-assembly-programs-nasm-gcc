	section .text
	global function
function:
	;; enter N,0	push ebp  , mov ebp,esp
	;;  sub esp,N  info about space to be allocated for
	;; local variables in a procedure
	
	
	enter 4,0
	mov edx,dword[ebp+8]
	sub edx, 9
	mov dword[ebp-4],edx
	mov eax, dword[ebp-4]
	leave
	ret
	
