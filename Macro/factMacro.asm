%macro fact 1
    xor ecx,ecx
    xor edx,edx
    
    mov eax,%1
    mov ecx,eax

    dec ecx
    mov ebx,ecx

lp:
    cmp ebx,1
    je towardsend

    mul ebx
    
    dec ebx
    jmp lp



towardsend:
    push eax
    push msg
    call printf
    add esp,8

end:

%endmacro

section .data
    a dd 10
    msg db "Factorial is %d",0

section .text
    global main
    extern printf

main:
    fact dword[a]
    ret