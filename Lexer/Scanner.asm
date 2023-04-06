;Scanner
%include "Lexer/TokenArray.asm"
%include "Lexer/Tokens.asm"
%include "Lexer/State.asm"
%include "Lexer/classify.asm"

section .text


Lex:
	;Open the file	
	mov rax, 2
	mov rdi, [filename]
	xor rdx, rdx
	xor rsi, rsi
	syscall
	mov qword [FD], rax

	;Read File
	mov rax,0
	mov rdi,qword [FD]
	mov rsi, [InputBuffer]
	mov rdx, 1024
	syscall

	;Close File
	mov rax, 6
	mov rdi, [FD]
	syscall
	
	jmp _IterScanner

_NextChar:
	mov eax, [InPointer] ;The Position pointer we need to grab the charater out of the string
	inc eax
	mov [InPointer], eax
	ret

_IterScanner:

	mov rsi, [InputBuffer] ;source of buffer
	
	
	
	;obtaining the characters 
	mov rax, [InPointer]
	mov bl, byte [rsi + rax] ; starts at the index of 0
	mov [CurrentChar], bl
	;Increment
	
	
	;Check if pointer is at limit of buffer
	mov eax,[Position]
	mov ecx, 1024
	cmp eax, ecx
	je _EndOfBuffer

	;Check for comments
	mov al, [Comments]
	cmp bl, al
	je CommentState

	;Check for integers
	mov al, [Digits]
	cmp al, bl
	je IntState

	;Check for string literals
	mov al, [dqm]
	cmp al, bl
	je StringState


	;Comapare the operators to the current character
	mov dl, Operators
	cmp bl, dl
	je _OpFound
	
	mov [AssertionBuffer], bl
	mov rcx, [AssertionBuffer]
	mov rax, [Cluster_Token]
	cmp rcx, rax
	je	_DefineKeyword

	call _NextChar
	
	jmp _IterScanner


section .data 
	InPointer db 0
	LineCount db 1
	
section .bss
	TokenBuffer resq 164
	InputBuffer resq 128
	AssertionBuffer resb 64
	FileName resb 64
	FD resb 32;FileDes
	currentChar resb 1
	

	CurrState resb 16

	
