;;Compute sum of 1 to N. Read N from the user using scanf statement. 

section .data
    msg db "Enter number",10,0
    input db "%d",0
    op db "Addition is %d",10,0

section .bss
     N resd 1

     
section .text
    global main
    extern printf,scanf

main:
    push msg 
    call printf
    add esp,4

    push N
    push input
    call scanf
    add esp,8

    mov ecx,dword[N]
    xor edi,edi
lp:
    cmp ecx,0
    jz endof

    add edi,ecx

    dec ecx
    jmp lp

endof:
    push edi
    ;push input
    push op
    call printf
    add esp,8

    ret
