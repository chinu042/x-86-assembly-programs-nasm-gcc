;;;  LODS  : lodsb = al   lodsw = ax and lodsd = eax   lodsb Loads value from memory represented by esi to al , esi ++
;;; 	STOS : stosb = al stosw = ax and stosd = eax stosb stores value from al to memory address resepresented by edi ; edi++


section .data
	source db "Source String",0
	len equ $-source
	msg db " Length is %d",10,0
	
section .bss
	destination resb len
	
section .text
	global main
	extern printf , puts
main:
	mov esi, source
	mov edi, destination
	mov ecx, len
	
	pusha
	push ecx
	push msg
	call printf
	add esp,8
	popa
	
	dec ecx
	add esi,ecx
	dec esi
	
lp:
	xor eax,eax
	std
	lodsb
	cld
	stosb
	
	pusha
	push destination
	call puts
	add esp,4
	popa
	loop lp
	
