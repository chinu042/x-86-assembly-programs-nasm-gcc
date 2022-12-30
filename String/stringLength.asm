section .data
    string db "This is my string",0
    output db "Length of string is %d",10,0

section .text
    global main
    extern printf

main:
    mov esi,string
    xor ecx,ecx

checkBack:
    cmp byte[esi],0
    jz endof
    inc ecx
    inc esi
    jmp checkBack

endof:
    push ecx
    push output
    call printf
    add esp,8

    ret