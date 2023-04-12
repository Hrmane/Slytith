section .bss
    Index resb 24
section .data
        Cluster_Token db "dword","bit","nibble","word","qword","res","mute","immute","vset","notype","->","<<",">>","element", "byte","char","snum","int","lnum","fltt","flst","bool","str","store","ict","altern","dec","add","subt","div","sync","assert","sysend","ret","repeat","loop","for",0
      ;  CTLength equ $-Cluster_Token
        Indicators db '|','&','>','<','.',';','=','~','+','-','%','!','@', '[',']', " ", '/', '^', 0
        ;IndicatorsLength equ $-Indicators
        Digits db '1','2','3','4','5','6','7','8','9','0', 0
      ; DigitsLength $-Digits

      Characters db "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z", "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",0


section .text

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
        je Scanner

        mov byte[curr], bl
        mov bl, [curr]
        mov al, [CurrentChar]
        cmp al, bl
        je IntState

        call IncArrayPos

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
            cmp al, bl
            je OpFound

            call IncArrayPos

            cmp al, bl
            jne DigitsCmp

            ret


    TokensCmp:

    Identifier: