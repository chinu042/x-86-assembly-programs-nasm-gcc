section .data
	input db"%d",0
	msg1 db "enter size of array",10,0
	msg2 db "the size of array is %d",10,0
	msg3 db "enter the array elements",10,0
	msg4 db "array elements are %d",10,0
	msg5 db "the sum of array is %d",10,0
section .bss
	n resd 1
	array resd 10
section .text
	global main
	extern printf,scanf
main:
	push msg1
	call printf
	add esp,4
	
	push n
	push input
	call scanf
	add esp,8
	
	push dword[n]
	push msg2
	call printf
	add esp,8
	
	push msg3
	call printf
	add esp,4
	
	xor ecx,ecx
scan:
	mov ebx,array
	mov eax,4
	mul ecx
	add ebx,eax
	
	pusha
	push ebx
	push input
	call scanf
	add esp,8
	popa
	
	inc ecx
	cmp ecx,dword[n]
	jl scan
	
	xor ecx,ecx
print:
	mov ebx,array
	mov eax,4
	mul ecx
	add ebx,eax
	
	pusha
	push dword[ebx]
	push msg4
	call printf
	add esp,8
	popa
	
	inc ecx
	cmp ecx,dword[n]
	jl print
	
	xor edi,edi
	xor ecx,ecx
sum:
	mov ebx,array
	mov eax,4
	mul ecx
	add ebx,eax
	
	
	add edi,dword[ebx]
	
	inc ecx
	cmp ecx,dword[n]
	jl sum 
	pusha
	push edi
	push msg5
	call printf
	add esp,8
	popa
	
	
	
	ret
	
	
	
	
