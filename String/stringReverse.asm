section .data
    string db "This is my string",0
    len equ $-string
  

section .bss
    reverseString resb len

section .text
    global main
    extern printf,puts

main:
    mov ebx,string
    mov edx,reverseString
    add ebx,len
    dec ebx
    dec ebx
    xor ecx,ecx
    inc ecx
    inc ecx

while:
    mov al,byte[ebx]
    mov byte[edx],al

    cmp ecx,len
    jnl endof
    inc ecx

    dec ebx 
    inc edx

    jmp while

endof:
    push reverseString
    call puts
    add esp,4

    push string
    call puts 
    add esp,4

    ret
