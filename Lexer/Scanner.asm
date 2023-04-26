;Scanner
%include "Lexer/TokenArray.asm"
%include "Lexer/Tokens.asm"
%include "Lexer/State.asm"
%include "Lexer/classify.asm"
%include "Parser/Parse.asm"


section .text

%macro print 0
    mov rax, 1
    mov rdi, 1
    mov r9, Cycle
    mov rdx, 123
    syscall
    %endmacro




Lex: ;Opens, reads, and closes the file
	;Open the file	
	mov rax, 2
	mov rdi, FileName
	xor rdx, rdx
	xor r9, r9
	syscall
	mov qword [FD], rax

	;Read File
	mov rax,0
	mov rdi,qword [FD]
	mov r9, InputBuffer
	mov rdx, 1024
	syscall

	;Close File
	mov rax, 6
	mov rdi, [FD]
	syscall
	
	jmp Scanner



Scanner:
    mov r9, InputBuffer

	;obtaining the characters 
	mov rax, [InPointer]
	mov bl, byte[r9 + rax] ; starts at the index of 0

	;Check if pointer is at limit of buffer
	cmp bl, 0
    call END

	;Check for comments
	xor al,al
	mov al, Comments
	cmp bl, al
	je CommentState

	xor al, al
	mov al, [dqm]
	cmp al, bl
	je StringState

	;Comapare the operators to the current character
	call IndicatorsCmp

	mov [AssertionBuffer], bl
	mov rcx, [AssertionBuffer]

	xor al, al
	mov al, [rcx + 0]
	xor dl, dl
	mov dl, [CurrentABChar]

	;call DigitsCmp

	call _NextChar



	jmp Scanner

_NextChar:
	mov eax, [InPointer] ;The Position pointer we need to grab the charater out of the string
	inc eax
	mov [InPointer], eax
	ret

section .data

	NullTerm db 0
	InputBuffer db "= 2390;",0
	Cycle: db "Cycle completed", 0ah
section .bss

    InPointer resb 124
	TokenBuffer resb 164
	;InputBuffer resb 128
	AssertionBuffer resb 64
	FileName resb 64
	FD resb 32;FileDes
	CurrentChar resb 1
	



	
