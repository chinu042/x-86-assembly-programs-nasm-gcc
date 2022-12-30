;;ASSEMBLY CODE FOR ADDITION OF FIRST 10 NUMBERS

section .data
	mynum dd 10
	msg db "Sum from 1 to %d is %d",10,0
section .bss
	sum resd 1				;; reserve 1 byte for variable sum.
section .text				
	global main
	extern printf
main:	
	mov ecx, dword[mynum]			;; integer from mynum variable will move to ecx.
	mov dword[sum],0			;; variable sum will be iniatialized with 0.
lp:	cmp ecx,0				;; this will check wether the integer in ecx is zero or not.
	jz final				;; if it is zero it will jump to lable final.
	add dword[sum],ecx			;; number in ecx will be added to variable sum.
	dec ecx					;; ecx will decremented by 1 (ecx--).
	jmp lp					;; if ecx is not zero it will again jump to lable lp.
final:
	push dword[sum]
	push dword[mynum]
	push msg
	call printf
	add esp,12
