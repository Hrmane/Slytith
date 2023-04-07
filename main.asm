;main
%include "Lexer/Tokens.asm"
%include "Lexer/Scanner.asm"
;%include "ProcArgument/CompCli.asm"
section .data
    Start_Comp_Msg db "Compiling..."
    Msg_Comp_len equ $-Start_Comp_Msg
    TestFile db "Slytith/Main.slyte"

section .text

    _CompSequence:
        ;Contains the sequence of the compilation
        call Lex
        ret


    global _start


    _start:
        ;call ArgumentProcessor
        


        mov rax, 1
        mov rdi, 1
        mov rsi, Start_Comp_Msg
        mov rdx, Msg_Comp_len
        syscall

        mov rcx, [TestFile]
        mov [FileName], rcx
        jmp Lex

        mov rax, 1
        mov rdi, 1
       mov rsi, [TokenBuffer]
        mov rdx, 9312
        syscall

        mov rax, 60
        mov rdi, 0
        syscall
        