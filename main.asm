;main
%include "Lexer/Tokens.asm"
%include "Lexer/Scanner.asm"
;%include "ProcArgument/CompCli.asm"
section .data
    Start_Comp_Msg db "Compiling...", 0ah
    Msg_Comp_len equ $-Start_Comp_Msg
    TestFile db "Slytith/Main.slyte"

section .text




    global _start

    END:
        mov rax, 60
        xor rdi, rdi
        syscall


    _start:
        ;call ArgumentProcessor
        


        mov rax, 1
        mov rdi, 1
        mov rsi, Start_Comp_Msg
        mov rdx, Msg_Comp_len
        syscall

        ;mov rcx, TestFile
       ; mov [FileName], rcx
        jmp Scanner

        mov rax, 1
        mov rdi, 1
         mov rsi, TokenBuffer
        mov rdx, 9312
        syscall

       mov rax, 60
       xor rdi, rdi
       syscall