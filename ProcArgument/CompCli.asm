section .text

    CLI:
        mov rax, 1
        mov rdi, 1
        mov rsi, msg
        mov rdx, 19
        syscall

        mov rax, 0
        mov rdi, 0
        mov rsi, buffer
        mov rdx, 1000
        syscall


        


section .bss
    buffer resb 1000 
section. data
    msg: db ""