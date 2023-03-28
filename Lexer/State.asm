%include "Slytith/Lexer/Scanner.asm"
section .data
    dqm db "\""
section .text
    ;To be called after a double quotation is found and will stop till another is found
    StringState:
        ;first get the current POSITION for the character then compare to a quote
        mov rcx, [InPointer]
        mov rbx, [InputBuffer]
        mov al, byte[rbx + rcx]

        mov dl, dqm
        cmp al, dl
        je AddStrToBuffer
        call _NextChar
    AddStrToBuffer:

        jmp _IterScanner



    _EndOfBuffer: ;called for EOF
       
