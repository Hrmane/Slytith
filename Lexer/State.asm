;%include "Lexer/Scanner.asm"
;%include "Lexer/Tokens.asm"

section .bss
    StringBuffer resq 1000
    IntBuffer resq 100
section .data
    StringLiteralToken: db "STRING: "
    IntLiteralToken: db "INT: "
    FloatToken db "FLOAT: "
    dqm db "\""

section .text

    ;All of the code below are to be called after a specific cindition is met
    ;e.g, 
   
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



    AddDecPoint:
        mov al, byte [O_DecimalPoint]
        mov [IntBuffer], al
        jmp FloatState
    
    FloatState:
       
        mov rcx, [InPointer]
        mov rdx, [InputBuffer]
        mov bl, byte[rdx + rcx]
        call _NextChar
        cmp bl, digits
        jne AddFloatToBuffer

        mov [IntBuffer], bl
        jmp FloatStat

    AddFloatToBuffer:
        mov rcx, [FloatToken]
        mov [TokenBuffer], rcx
        mov rax, [IntBuffer]
        mov [TokenBuffer], rax
        jmp _IterScanner
        

    IntState:
        mov rcx, [InPointer]
        mov rdx, [InputBuffer]
        mov bl, byte[rdx + rcx]
        mov [IntBuffer], bl
        call _NextChar
        mov al, Digits
        cmp al, bl
        je IntState

        mov al, O_DecimalPoint
        cmp al, bl
        je AddDecPoint

        jmp AddintToBuffer


    AddNumberToBuffer: ; used for both floats and ints
        mov rcx, [IntLiteralToken]
        mov [TokenBuffer], rcx
        mov rax, [IntBuffer]
        mov [TokenBuffer], rax

        jmp _IterScanner 



    CommentState:
        mov rcx, [InPointer]
        mov rax, [InputBuffer]
        mov al, byte[rax + rcx]
        mov bl, [Comments]

        ;Determine the end of the comment by another # symbol
        cmp al, bl
        je _IterScanner

        call _NextChar

        jmp CommentState
    
       
