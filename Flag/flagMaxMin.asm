section .data
    arr dd 10,40,83,68,97,32,46,98
    max db "Maximum element is %d",10,0
    min db "Minimum element is %d",10,0

section .text
    global main
    extern printf

main:
    xor ecx,ecx
    mov esi,dword[arr]
    mov edi,dword[arr]

lp:
    mov ebx,arr
    mov eax,4
    mul ecx
    add ebx,eax

    cmp esi,dword[ebx]
    cmovl esi,dword[ebx]

    cmp edi,dword[ebx]
    cmovg esi,dword[ebx]

    inc ecx
    cmp ecx,8

    jl lp

    push esi
    push max
    call printf
    add esp,8

    push edi
    push min 
    call printf
    add esp,8

endof:
    ret