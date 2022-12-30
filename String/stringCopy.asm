section .data
    string db "This is my string",10,0
    len equ $-string

section .bss
    output resb len

section .text
    global main
    extern printf

main:
    mov esi,string
    mov edi,output
    mov ecx,len

lp:
    mov al,byte[esi]
    mov byte[edi],al
    inc esi
    inc edi
    loop lp

    mov eax,4
    mov ebx,1
    mov ecx,output
    mov edx,len
    int 0x80

    ret