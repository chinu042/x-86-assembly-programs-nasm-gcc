section .data
	msg db "enter the number",10,0
	msg1 db "the addition of factorials of each digits is %d",10,0
	msg2 db "the number is STRONG",10,0
	msg3 db "the number is NOT STRONG",10,0
	input db "%d",0

section .bss
	n resd 1
	divn resd 1
	remn resd 1
	
	addi resd 1

section .text
	global main
	extern printf,scanf
main:
	xor esi,esi
	push msg  
	call printf
	add esp,4

	push n
	push input
	call scanf
	add esp,8



    mov eax,dword[n]   

    
lp: mov edx, 0             

	mov ebx, 10            

	div ebx       
	
	mov dword[remn],edx     
	mov dword[divn],eax			

	mov ecx,dword[remn]      

	mov eax,1
fact:mul ecx
	dec ecx
	cmp ecx,0
	jg fact

	
	add dword[addi],eax			;addi=   120 +

updateno:
	
	mov eax,dword[divn]			;eax=14
	inc esi						;esi=1
	cmp esi,3                   ;
	jz endof
	jmp lp


endof:
	
;;check for strong or not
	mov ebx,dword[n]
	cmp ebx,dword[addi]
	jz strong
	
	jmp notstrong

	
strong:
	push msg2
	call printf
	add esp,4
	ret
	
notstrong:
	pusha
	push msg3
	call printf
	add esp,4
	popa
	ret