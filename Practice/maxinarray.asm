;; Assembly program to maximum of array elements	
	section .data
	Array dd 10,400,30,40,-1
	msg db "maximum number is %d",10,0
	section .text
	global main
	extern printf
main:
	xor ecx,ecx 		;;make ecx 0
	mov esi,-2
lp:	
	mov ebx,Array 		;;Put address of array in ebx
	mov eax,4 		;;size
	mul ecx 		;;(index*size)
	add ebx,eax 		;;base + mulResult
	cmp dword[ebx],-1
	jz endof
	cmp dword[ebx],esi	;; if(dword[ebx] < esi)
	jng lp1			;;Jump if not greater (If dword is small, then this line is skipped)
	mov esi,dword[ebx]	;; if dword is not greater then program will directly jump to inc ecx else it run this 
				;;line and then go inc ecx
lp1:
	inc ecx
	jmp lp
endof:	
	push esi
	push msg 
	call printf
	add esp,8

	ret
