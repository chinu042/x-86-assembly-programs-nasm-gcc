section .data
    arr dd 10,20,30,40,50,-1
    output db "Addition is %d",10,0

section .text
    global main
    extern printf

main:
    xor ecx,ecx
    xor esi,esi

lp:
    mov ebx,arr
    mov eax,4
    mul ecx 
    add ebx,eax

    cmp dword[ebx],-1
    jz endof

    add esi,dword[ebx]
    inc ecx
    jmp lp

endof:
    push esi
    push output
    call printf
    add esp,8
    
    ret