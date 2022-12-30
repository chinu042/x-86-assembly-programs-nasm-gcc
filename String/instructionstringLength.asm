section .data
    string db "This is my string",0
    output db "String length is %d",10,0

section .text
    global main
    extern printf

main:
    mov edi,string
    mov esi,edi
    xor eax,eax
    mov al,0
    repnz scasb 
    sub edi,esi

    push edi
    push output
    call printf
    add esp,8

    ret