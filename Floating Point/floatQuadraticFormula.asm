section .data
    a dd 2
    b dd 6
    c dd 4
    msg db " The root is %f",10,0
section .bss
    Four resd 1
section .text
    global main
    extern printf
main:
    enter 0,0
    mov dword[Four],4
    fild dword[a]
    fimul dword[c]
    fimul dword[Four]
    fild dword[b]
    fimul dword[b]
    fsub st0,st1
    fsqrt
    fild dword[b]
    fchs
    ;; fadd st0,st1
    fsub st0,st1
    mov dword[Four],2
    fild dword[Four]
    fimul dword[a]
    fdivr st1
    sub esp,8
    fstp qword[esp]
    push msg
    call printf
    add esp,12
    leave

	ret
