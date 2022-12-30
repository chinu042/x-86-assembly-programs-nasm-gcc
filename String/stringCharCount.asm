section .data
    string db "This is a string containing very words.",0
    output db "This given string containg %d char",10,0

section .text
    global main
    extern printf

main:
    xor ecx,ecx
    mov al,' '
    mov esi, string

lp:
    cmp byte[esi],0
    jz endof
    cmp al,byte[esi]
    jz inccount
    inc esi
    jmp lp 

inccount:
    inc ecx
    inc esi
    jmp lp
     
endof:
    inc ecx
    push ecx
    push output
    call printf
    add esp,8

    ret