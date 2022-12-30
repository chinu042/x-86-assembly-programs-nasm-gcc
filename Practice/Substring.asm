section .data
    msg db "Dummy Text",0
    ; msg2 db "Mummy",0
    ; msg2 db "Dumimy",0
    msg2 db "Dummy",0
    msg3 db "Substring found",10,0
    msg4 db "Substring not found",10,0

section .text
    global main
    extern puts

main:
    mov esi,msg
    mov edi,msg2

substring:
    mov al,byte[esi]
    cmp byte[edi],al
    jz compare

    cmp byte[esi],0
    jz notfound

    inc esi
    jmp substring

compare:
    inc esi
    inc edi

    cmp byte[esi],0
    jz notfound

    cmp byte[edi],0
    jz found

    mov al,byte[esi]
    cmp byte[edi],al
  
    jz compare
    jnz notfound

found:
    push msg3 
    call puts
    add esp,4
    jmp terminate

notfound:
    push msg4
    call puts
    add esp,4
    
terminate:
    ret
