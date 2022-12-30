	;; This code displays binary representation of a number
section .data		
     Array dd 4,2,3,5,10
     num dd 5
     temp dd 0 
     msg1 db "%d",0
     msg2 db "  ",0
section .text
     global main
     extern printf
main:
     mov ebx,Array     
loop:
     cmp dword[num],0
     je end
     mov eax,dword[ebx]
     jmp process
next:
     push eax
     push msg1
     call printf
     add esp,8
     push msg2
     call printf
     add esp,4  
     dec dword[num]
     add ebx,4  
     jmp loop   
process:
     cmp eax,1
     je next 
     mov ecx,2
     xor edx,edx	;correction made here
     div ecx
     mov dword[temp],edx

     pusha
     push dword[temp]
     push msg1
     call printf
     add esp,8 
     popa

     jmp process
end:
     ret

          
