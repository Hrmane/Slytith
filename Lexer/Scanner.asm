;_GrabChar
%include "Lexer/TokenArray.asm"
%include "Lexer/Tokens.asm"
%include "Lexer/State.asm"
%include "Lexer/classify.asm"
%include "Parser/Parse.asm"


section .text

_AddToCbuf_GrabChar:
    mov bl, [CurrentChar]
    mov [AssertionBuffer], bl
    call _GrabChar




_Output:
    mov rax, 1
    mov rdi, 1
    mov rsi, Output_txt
    mov rdx, otxtLen
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, TokenBuffer
    mov rdx, 20000
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, nln
    mov rdx, 1
    syscall

    call END

_Inc_grab:
    call _NextChar
    jmp _GrabChar

_GrabChar:
    mov r9, InputBuffer
	mov rax, [InPointer]

	mov bl, byte[r9 + rax]
	cmp bl, 0
    je _Output

    mov al, Whitespace
    cmp al, bl
    je _Inc_grab

    mov byte[CurrentChar], bl



	call _NextChar


	jmp IndicatorsCmp



_NextChar:
	mov eax, [InPointer] ;The Position pointer we need to grab the charater out of the string
	inc eax
	mov [InPointer], eax
	ret

section .data
    Output_txt: db "Outputted Lexemes >> ",0
    otxtLen equ $-Output_txt
	nln db 0ah
	InputBuffer db "|+",0
	Cycle: db "Cycle completed", 0ah ,0
section .bss

    InPointer resb 124
	TokenBuffer resb 9192
	InputBuffer resb 9192
	AssertionBuffer resb 64
	FileName resb 64
	FD resb 32;FileDes
	CurrentChar resb 1
	TBufPos resb 4
	



	
