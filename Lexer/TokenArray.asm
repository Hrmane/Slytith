;%include "Lexer/Scanner.asm"
;%include "Lexer/classify.asm"

section .bss
    Index resb 24
    CurrentABChar resb 1
    curr resb 1
section .data

        ID: db "Identifier"
        Cluster_Token: db "dword","bit","nibble","word","qword","res","mute","immute","vset","notype","->","<<",">>","element", "byte","char","snum","int","lnum","fltt","flst","bool","str","store","ict","altern","dec","add","subt","div","sync","assert","sysend","ret","repeat","loop","for",0
      ;  CTLength equ $-Cluster_Token
        Indicators: db '|','&','>','<','.',';','=','~','+','-','%','!','@', '[',']', " ", '/', '^', 0
        ;IndicatorsLength equ $-Indicators
        Digits: db '1','2','3','4','5','6','7','8','9','0', 0
      ; DigitsLength $-Digits

      Characters: db "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z", "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",0


section .text

    CheckAssertBuffer:
            mov rax, AssertionBuffer
            mov rcx, Cluster_Token
            mov r8, [Index]
            mov rdx, [rax + rcx]
            cmp rdx, 0
            je _GrabChar

            cmp rax, rcx
            jmp _DefineKeyword



            cmp rax, rcx
            jne CheckAssertBuffer
        ret


    IncArrayPos:
        mov rax, [Index]
        inc rax
        mov [Index], rax
        ret


    DigitsCmp:
        mov rax, 1
      mov rdi, 1
      mov rsi, Cycle
        mov rdx, 20
       syscall

        call _add2Cbuf

        mov rcx, Digits
        mov rax, [Index]
        mov bl, byte[rcx + rax]
        cmp bl, 0
        je CheckAssertBuffer

       ; mov byte[curr], bl
       ; mov bl, [curr]

       mov al, byte[AssertionBuffer + 0]




        mov dl, CurrentABChar
        call IncArrayPos
        cmp dl, al
        je IntState



        cmp al, bl
        jne DigitsCmp

        ret

    _add2Cbuf:
        mov bl, byte[CurrentChar]
        mov byte[AssertionBuffer], bl
        ret

    _add2Cbuf_cbufcheck:
        mov bl, byte[CurrentChar]
        mov byte[AssertionBuffer], bl
        jmp CheckAssertBuffer



    IndicatorsCmp:



         mov bl, byte[CurrentChar]
          xor al,al
          mov al, Comments
          cmp bl, al
          je CommentState


          xor al, al
          mov al, [dqm]
          cmp al, bl
          je StringState



         mov rcx, Indicators
            mov rax, [Index]
            mov bl, byte[rcx + rax]
            cmp bl, 0
            je DigitsCmp




            mov byte[curr], bl
            mov bl, [curr]
            mov al, [CurrentChar]

            mov dl, Whitespace

            call IncArrayPos
            cmp al, dl
            je DigitsCmp



            cmp al, bl
            je _OpFound


            jmp IndicatorsCmp

            ret



    Identifier:

        mov r8, qword[ID]
        mov rcx, AssertionBuffer
        mov rax, [TokenBuffer]
        mov rax, [r8]
        mov rax, rcx

        jmp _GrabChar
