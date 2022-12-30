%macro prime 1
    mov eax,%1
    xor edx,edx
    mov ebx,2
    div ebx
    cmp edx,1
    je lp

    push %1
    push msg2
    call printf
    add esp,8
    jmp lp1

lp:
    push %1
    push msg1
    call printf
    add esp,8
lp1:
end:
%endmacro


section .data
    a dd 45
    msg1 db "%d is a Prime no",10,0
    msg2 db "%d is not a Prime no",10,0

section .text
    global main
    extern printf

main:
    prime dword[a]
    ret