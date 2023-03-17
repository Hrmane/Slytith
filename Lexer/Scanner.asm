;Scanner

%include "Slytith/Lexer/Tokens.asm"
section .text

_FileReader:
	;Open the file	
	mov rax, 2
	mov rdi, filename
	xor rdx, rdx
	xor rsi, rsi
	syscall
	mov qword [FD], rax

	mov rax,0
	mov rdi,qword [FD]
	mov rsi, InputBuffer
	mov rdx, 1024
	syscall
	;ret

_NextChar:
	mov eax, [InPointer] ;The Position pointer we need to grab the charater out of the string
	inc eax
	mov [InPointer], eax
	ret


_IterScanner:

	mov rsi, [InputBuffer] ; source of buffer
	
	
	
	;obtaining the characters 
	mov eax, [InPointer]
	mov bl, byte [rsi + eax] ; starts at the index of 0

	;Increment
	call _NextChar
	
	;Check if pointer is at limit of buffer
	mov eax,[Position]
	mov ecx, 1024
	cmp eax, ecx
	je _EndOfBuffer

	;Comapare the operators to the current character
	mov dl, Operators
	cmp bl, dl
	je _OpFound
	
	mov [AssertionBuffer], bl
	mov rcx, [AssertionBuffer]
	mov rax, Cluster_Token
	cmp rcx, rax
	je	_DefineKeyword

	jmp _IterScanner



	

_OpFound:
	;clear string after
	

	jmp _IterScanner
section .data
	InPointer db 0

section .bss
	TokenBuffer resq 164
	InputBuffer resq 128
	AssertionBuffer resb 16
	FileName resb 64
	FD resb 32;FileDes
	

	
