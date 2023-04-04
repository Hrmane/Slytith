;main
%include "Slytith/Lexer/Tokens.asm"
%include "Slytith/Lexer/Scanner.asm"
%include "Slytith/ProcArgument/CompCLI.asm"
section .data
    Start_Comp_Msg db "Compiling..."
    Msg_Comp_len equ $-Start_Comp_Msg

section .text

    global _Start


    _Start:
        call ArgumentProcessor
        mov rax, 1
        mov rdi, 1
        mov rsi, Start_Comp_Msg
        mov rdx, Msg_Comp_Len
        syscall

        call Lex

        mov rax, 60
        xor rdi, rdi
        syscall
        