%include "Slytith/Lexer/Scanner.asm"

section .text

    ArgumentProcessor:
        mov rdp, rsp

        mov rsi, [rdp + 16]
        mov [FileName], rsi

        ;open the art file
        mov rax, 2
        mov rdi, ArtFileName
        mov rsi, 0
        mov rdx, 0
        syscall
        ;read file
        mov qword [FD], rax
        mov rax,0
	    mov rdi,qword [FD]
	    mov rsi, art
	    mov rdx, 100
	    syscall

	    mov rax, 6
	    mov rdi, [FD]
	    syscall
        ;print the ascii art
        mov rax, 1
        mov rdi, 1
        mov rsi, art
        mov rdx, 100
        syscall

        


       

        


section .bss
    ArtFileName resb 64
    art resb 100
section. data
