;; ASSEMBLY PROGRAM FOR THE ADDITION OF FIRST n NUMBERS , n WILL BE DECLARED AT RUN TIME.


section .data
	msg1 db "%d",0
	msg db "Sum from 1 to %d is %d",10,0
section .bss
	mynum resd 1				;; reserve 1 byte for variable mynum.
	sum resd 1				;; reserve 1 byte for variable sum.
section .text
	global main
	extern printf,scanf
main:	
	push mynum				
	push msg1
	call scanf				;; call scanf to read the variable mynum frm user at run time.
	add esp,8
	
	mov ecx, dword[mynum]			;; move first integer from variable mynum to ecx.
	mov dword[sum],0			;; intialize variable sum with 0.
lp:	add dword[sum],ecx			;; add integer from ecx to variable sum.
	loop lp					;; to add all the integers from ecx it will start looping untill ecx get 0.
	
final:
	push dword[sum]
	push dword[mynum]
	push msg				
	call printf				;; to print final addition call printf
	add esp,12
