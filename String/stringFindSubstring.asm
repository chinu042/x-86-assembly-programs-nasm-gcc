section .data
    mainstring db "This is a complete string",0
    substring db "is a",0
    output1 db "Substring not found.",10,0
    output2 db "Substring found.",10,0

section .text
    global main
    extern printf

main:
    mov esi,mainstring
    mov edi,substring

lp:
    xor eax,eax
    mov al,byte[esi]
    cmp byte[edi],al
    jz compare
    cmp byte[esi],0
    jz unsuccessful
    inc esi
    jmp lp

compare:
    inc esi
    inc edi

    cmp byte[esi],0
    jz unsuccessful

    cmp byte[edi],0
    jz successful

    mov al,byte[esi]
    cmp al,byte[edi]
    jnz lp
    jmp compare

successful:
    push output2
    call printf
    add esp,4
    jmp endof

unsuccessful:
    push output1
    call printf
    add esp,4

endof:
    ret
    
    
    
    
    
