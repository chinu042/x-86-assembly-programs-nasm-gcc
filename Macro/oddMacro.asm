%macro odd 1
    
    xor edx,edx
    
    mov eax,%1
    mov ebx,2
    div ebx
    cmp edx,1
    jz lp

    push %1
    push msg2
    call printf
    add esp,8
    jmp end

lp:
    push %1
    push msg1
    call printf
    add esp,8
end:
%endmacro


section .data
    a dd 10
    msg1 db "%d Is Odd",10,0
    msg2 db "%d Is Not Odd",10,0

section .text
    global main
    extern printf

main:
    odd dword[a]
    ret