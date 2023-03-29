%include "Slytith/Lexer/Scanner.asm"
section .bss
    StringBuffer resq 1000
    IntBuffer resq 100
section .data
    StringLiteralToken: db "STRING: "
    IntLiteralToken: db "INT: "
    dqm db "\""


section .text
   
    StringState:
        ;To be called after a double quotation is found and will stop till another is found
        ;first get the current POSITION for the character then compare to a quote
       
        mov rcx, [InPointer]
        mov rbx, [InputBuffer]
        mov al, byte[rbx + rcx]
        mov dl, dqm
        cmp al, dl
        je AddStrToBuffer
        ;if the character isnt a quote, add it to the string buffer
        
        mov [StringBuffer], al

        call _NextChar
        jmp StringState

    AddStrToBuffer:
    
        mov rax, word[StringLiteralToken]
        mov [TokenBuffer], rax
        mov [TokenBuffer], StringBuffer
        jmp _IterScanner



    IntState:
        mov rcx, [InPointer]
        mov rdx, [InputBuffer]
        mov bl, byte[rdx + rcx]
        mov [IntLiteralToken], bl
        call _NextChar
        mov al, Digits
        cmp al, bl
        je IntState

        jmp AddintToBuffer


    AddIntToBuffer:
        mov rcx, word[IntLiteralToken]
        mov [TokenBuffer], rcx
        mov rax, [IntBuffer]
        mov [TokenBuffer], rax

        jmp _IterScanner 



    CommentState:
        mov rcx, [InPointer]
        mov rax, [InputBuffer]
        mov al, byte[rax + rcx]
        mov bl, [Comments]

        ;Determine the end of the comment by another @ symbol
        cmp al, bl
        je _IterScanner

        call _NextChar

        jmp CommentState
    
       
