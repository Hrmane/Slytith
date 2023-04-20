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
            mov rax, [AssertionBuffer]
            mov rcx, Cluster_Token
            mov r8, [Index]
            mov rdx, [rax + rcx]
            cmp rdx, 0
            je Identifier ; if the index is = to 0, buffer is a identifier

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
        mov rcx, Digits
        mov rax, [Index]
        mov bl, byte[rcx + rax]
        cmp bl, 0
        je CheckAssertBuffer

        mov byte[curr], bl
        mov bl, [curr]
        mov al, [CurrentABChar]
        call IncArrayPos
        cmp al, bl
        je IntState



        cmp al, bl
        jne DigitsCmp

        ret




    IndicatorsCmp:

         mov rcx, Indicators
            mov rax, [Index]
            mov bl, byte[rcx + rax]
            cmp bl, 0
            je Scanner



            mov byte[curr], bl
            mov bl, [curr]
            mov al, [CurrentChar]
            mov dl, byte[Whitespace]
            call IncArrayPos
            cmp al, dl
            je Scanner


            cmp al, bl
            je _OpFound


            cmp al, bl
            jne DigitsCmp

            ret



    Identifier:

        mov r8, qword[ID]
        mov rcx, AssertionBuffer
        mov rax, [TokenBuffer]
        mov rax, [r8]
        mov rax, rcx

        jmp Scanner
