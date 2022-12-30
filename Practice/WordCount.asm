;; ASSEMBLY CODE TO SHOW COUNT OF WORDS IN STRING.

section .data
	string db "This is a very big text string containing words and this statement is",0
	msg db "String contains %d words",10,0
	
section .text
	global main
	extern printf
main:
	xor ecx,ecx			;; make counter register ecx zero.
	mov al,' '			;; store space (' ') in al.
	mov esi, string			;; store complete string in esi.
trial:
	cmp byte[esi],0    		;; compair byte[esi] with zero.
	jz terminate			;; if byte[esi] is zero which means string is end and jump to lable terminate.
	cmp al,byte[esi]		;; compair byte[esi] with al means compair it with space(' ').
	jz inccount			;; if space is found there then jump to lable inccount.
	inc esi				;; to count next word increment esi.
	jmp trial			;; loop will continue untill end of string.
inccount:
	inc ecx				;; in above expression we found space and hence to count word previous to that space increment ecx.
	inc esi 			;; to count next word increment esi.			
	jmp trial			;; loop will continue untill end of string.
terminate:			;; lable to print count of words.
	inc ecx
	push ecx
	push msg
	call printf
	add esp,8
	
