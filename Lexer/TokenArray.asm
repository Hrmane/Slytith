;%include "Lexer/Scanner.asm"
;%include "Lexer/classify.asm"

section .bss
    Index resb 24
    CurrentABChar resb 1
    curr resb 1
    DigitIndex resb 11
    TokenIndex resb 40

section .data

        ID: db "Identifier", 0ah
        Cluster_Token: db "dword","bit","nibble","word","qword","res","mute","immute","vset","notype","->","<<",">>","element", "byte","char","snum","int","lnum","fltt","flst","bool","str","store","ict","altern","dec","add","subt","div","sync","assert","sysend","ret","repeat","loop","for",0
      ;  CTLength equ $-Cluster_Token
        Indicators: db "|",'&','>','<','.',';','=','~','+','-','%','!','@', '[',']', " ", '/', '^', 0
        ;IndicatorsLength equ $-Indicators
        Digits: db '1','2','3','4','5','6','7','8','9','0', 0
      ; DigitsLength $-Digits

      Characters: db "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z", "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",0


section .text

    CheckAssertBuffer:

            mov rax, AssertionBuffer
            mov rcx, Cluster_Token
            mov r8, [TokenIndex]
            mov rdx, [rax + rcx]
            cmp rdx, 0
            je _GrabChar


            cmp rax, rcx
            jmp _DefineKeyword
            call Inc_t



            cmp rax, rcx
            jne CheckAssertBuffer
        ret
    Inc_d:
        mov rax, [DigitIndex]
        inc rax
        mov [DigitIndex], rax
        ret

    ClearDIn_BackToGrab:
      mov qword[DigitIndex], 0000000000000
      jmp _GrabChar

    ClearTIn_BackToGrab:
      mov qword[TokenIndex], 0000000000000000000000000000000000000000
      jmp _GrabChar

    
    Inc_t:
        mov rax, [TokenIndex]
        inc rax
        mov [TokenIndex], rax
        ret

    IncArrayPos:
        mov rax, [Index]
        inc rax
        mov [Index], rax
        ret

    Add2cbuf_DCMP:
        call _add2Cbuf
        jmp DigitsCmp
    DigitsCmp:



        mov rcx, Digits
        mov rax, [DigitIndex]
        mov bl, byte[rcx + rax]
        cmp bl, 0
        je CheckAssertBuffer



       ; mov byte[curr], bl
       ; mov bl, [curr]

       mov al, byte[AssertionBuffer + 0]




        mov dl, [CurrentABChar]
        call Inc_d
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

  _zero_index_DCMP:


    mov qword[Index], 000000000000000000000000
    je DigitsCmp

  IndicatorsCmp:



         ;mov bl, [CurrentChar]

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
            mov dl, byte[rcx + rax]

            cmp dl, 0
            je _zero_index_DCMP




            mov byte[curr], dl



            ;mov al, [CurrentChar]

            ;mov dl, Whitespace

            call IncArrayPos
            ;cmp al, dl
            ;je _zero_index_DCMP


            mov dl, [curr]
            cmp bl, dl
            je _OChain


            jmp IndicatorsCmp





    Identifier:

        mov r8, qword[ID]
        mov rcx, AssertionBuffer
        mov rax, [TokenBuffer]
        mov rax, [r8]
        mov rax, rcx

        jmp _GrabChar
