;main
%include "Lexer/Tokens.asm"
%include "Lexer/Scanner.asm"
;%include "Slytith/ProcArgument/CompCLI.asm"
section .data
    Start_Comp_Msg db "Compiling..."
    Msg_Comp_len equ $-Start_Comp_Msg
    TestFile db "Slytith/Main.slyte"
section .text

    global _Start


    _Start:
        ;call ArgumentProcessor
        


        mov rax, 1
        mov rdi, 1
        mov rsi, Start_Comp_Msg
        mov rdx, Msg_Comp_Len
        syscall
        mov [FileName], TestFile
        call Lex

        mov rax, 1
        mov rdi, 1
        mov rsi, [TokenBuffer]
        mov rdx, 9312
        syscall

        mov rax, 60
        xor rdi, rdi
        syscall
        