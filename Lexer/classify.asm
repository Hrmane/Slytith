;classify  
%include "Lexer/Tokens.asm"
;%include "Lexer/Scanner.asm"

section .data


    Cycle2: db "<<>>", 0ah ,0
    clen2 equ $-Cycle2



    here: db "Here", 0ah

section .text
;/////////////////////////////////////////////////////////////////
;								OPERATORS
;/////////////////////////////////////////////////////////////////
_OpFound:

	mov bl, [Whitespace]
	mov al, [CurrentChar]
	cmp al, bl
	je _GrabChar


    mov rax, 1
             mov rdi, 1
             mov rsi, Cycle2
             mov rdx, clen2
             syscall
    call _OChain


    _OChain:
        mov al, [CurrentChar]
        call _CTO
        call _CMA
        call _CLT
        call _CGT
        call _CDP
        call _CSE
        call _CES
        call _CTI
        call _CMP
        call _CAO
        call _CAC
        jmp _AddToCbuf_GrabChar

    _CTO:
        mov dl, O_TO
    		cmp al, dl
    		je ToSign
    		ret

    _CMA:
    		mov dl, O_DefMacro
    		cmp al, dl
    		je DefMacro
            ret

    _CLT:
    		mov dl, O_LessThan
    		cmp al, dl
    		je LessThan
            ret
    _CGT:
    		mov dl, O_GreaterThan
    		cmp al, dl
    		je GreaterThan
            ret

    _CDP:
    		mov dl, O_DecimalPoint
    		cmp al, dl
    		je DecPoint
            ret
    _CSE:
    		mov dl, O_Semicolon
    		cmp al, dl
    		je Semicolon
            ret

    _CES:
    		mov dl, O_EqualSign
    		cmp al, dl
    		je Equal
            ret
    _CTI:
    		mov dl, O_Tilde
    		cmp al, dl
    		je Tilde
            ret

    _CMP:
    		mov dl, O_MemPointer
    		cmp al, dl
    		je MemPointer
            ret
    _CAO:
    		mov dl, O_ArrayOpen
    		cmp al, dl
    		je ArrayLBrack
    		ret
    _CAC:
    		mov dl, O_ArrayClose
    		cmp al, dl
    		je ArrayRBrack
            ret
	



	ArgsArrow:
	        mov rax, [TBufPos]
			mov rcx, T_ARGARROW
			mov [TokenBuffer+rax], rcx
			inc rax
			mov [TBufPos], rax
			ret


	FuncOpen:
			mov rax, [TBufPos]
			mov rcx, T_OPEN_FUNC
			mov [TokenBuffer+rax], rcx
			inc rax
			mov [TBufPos], rax
			ret

	FuncClose:
			mov rax, [TBufPos]
			mov rcx, T_CLOSE_FUNC
			mov [TokenBuffer+rax], rcx
			inc rax
			mov [TBufPos], rax
			ret

    DirDiv:
			mov rax, [TBufPos]
			mov rcx, T_DIR_DIV
			mov [TokenBuffer+rax], rcx
			inc rax
			mov [TBufPos], rax
			ret

	DefMacro:
			mov rax, [TBufPos]
			mov rcx, T_MACRO_DEFINE
			mov [TokenBuffer+rax], rcx
			inc rax
			mov [TBufPos], rax
			ret

	LessThan:
			mov rax, [TBufPos]
			mov rcx, T_LESS
			mov [TokenBuffer+rax], rcx
			inc rax
			mov [TBufPos], rax
			ret


    GreaterThan:
			mov rax, [TBufPos]
			mov rcx, T_GREATER
			mov [TokenBuffer+rax], rcx
			inc rax
			mov [TBufPos], rax
			ret

	DecPoint:
			mov rax, [TBufPos]
			mov rcx, T_DECIMAL_POINT
			mov [TokenBuffer + rax], rcx
			inc rax
			mov [TBufPos], rax
			ret

	Semicolon:
			mov rax, [TBufPos]
			mov rcx, T_SEMICOLON
			mov [TokenBuffer+rax], rcx
			inc rax
			mov [TBufPos], rax
			ret

    Equal:
            		mov rax, [TBufPos]
			mov rcx, T_EQUALS
			mov [TokenBuffer+rax], rcx
			inc rax
			mov [TBufPos], rax
			ret

	Tilde:
			mov rax, [TBufPos]
			mov rcx, T_TILDE
			mov qword[TokenBuffer+rax], rcx
			inc rax
			mov [TBufPos], rax
			ret



	MemPointer:
			mov rax, [TBufPos]
			mov rcx, T_MEM_POINTER
			mov [TokenBuffer+rax], rcx
			inc rax
			mov [TBufPos], rax
			ret
	ToSign:
	        mov rax, [TBufPos]
			mov rcx, T_TO
			mov [TokenBuffer], rcx

			inc rax
			mov [TBufPos], rax
			ret
	ArrayLBrack:

			mov rax, [TBufPos]
			mov rcx, T_ARRAY_OPEN
			mov [TokenBuffer+rax], rcx
			inc rax
			mov [TBufPos], rax
			ret
	ArrayRBrack:
			
			mov rcx, T_ARRAY_CLOSE
			mov [TokenBuffer], rcx
			ret



;////////////////////////////////////////////////////////////////////
;								KEYWORDS
;////////////////////////////////////////////////////////////////////
	Muteable:
		mov rcx, T_MUTE
		mov [TokenBuffer], rcx
		ret

	Immutable:
			mov rcx, T_IMMUTE
			mov [TokenBuffer], rcx
			ret
	ValueSet:
			mov rcx, T_VSET
			mov [TokenBuffer], rcx
			ret

	NoType:
			mov rcx, T_NOTYPE
			mov [TokenBuffer], rcx
			ret



	Element:
			mov rcx, T_ELEMENT
			mov [TokenBuffer], rcx
			ret

	KByte:
				mov rcx, TYPE_BYTE
				mov [TokenBuffer], rcx
				ret
	Char:
				mov rcx, TYPE_CHAR
				mov [TokenBuffer], rcx
				ret

	Snum:
				mov rcx, TYPE_SNUM
				mov [TokenBuffer], rcx
				ret

	KInt:
				mov rcx, TYPE_INT
				mov [TokenBuffer], rcx
				ret

	Lnum:
				mov rcx, TYPE_LNUM
				mov [TokenBuffer], rcx
				ret

	Fltt:
				mov rcx, TYPE_FLOAT32
				mov [TokenBuffer], rcx
				ret
	Flsf:
				mov rcx, TYPE_FLOAT64
				mov [TokenBuffer], rcx
				ret

	Bool:
					mov rcx, TYPE_BOOL
					mov [TokenBuffer], rcx
					ret
	String:
					mov rcx, TYPE_STR
					mov [TokenBuffer], rcx
					ret

	KBit:
					mov rcx, TYPE_BIT
					mov [TokenBuffer], rcx
					ret

	Nibble:
					mov rcx, TYPE_NIBBLE
					mov [TokenBuffer], rcx
					ret

	KWord:
					mov rcx, TYPE_WORD
					mov [TokenBuffer], rcx
					ret

	KDword:
					mov rcx, TYPE_DWORD
					mov [TokenBuffer], rcx
					ret
	KQword:
					mov rcx, TYPE_QWORD
					mov [TokenBuffer], rcx
					ret

	Store:
						mov rcx, T_MOVINTO
						mov [TokenBuffer], rcx
						ret

	Ict:
						mov rcx, T_ICT
						mov [TokenBuffer], rcx
						ret

	Altern:
						mov rcx, T_ALTERN
						mov [TokenBuffer], rcx
						ret

	Declare:
						mov rcx, T_DECLARE
						mov [TokenBuffer], rcx
						ret




	Return:
				mov rcx, T_RETURN
				mov [TokenBuffer], rcx
				ret
	KRepeat:
				mov rcx, T_REPEAT
				mov [TokenBuffer], rcx
				ret


	For:
				mov rcx, T_FOR
				mov [TokenBuffer], rcx
				ret

	Foreach:
				mov rcx, T_FOREACH
				mov [TokenBuffer], rcx
				ret

	Modulo:
				mov rcx, T_FOREACH
				mov [TokenBuffer], rcx
				ret
	Division:
				mov rcx, T_FOREACH
				mov [TokenBuffer], rcx
				ret

	Subtraction:
				mov rcx, T_FOREACH
				mov [TokenBuffer], rcx
				ret
	Addition:
				mov rcx, T_FOREACH
				mov [TokenBuffer], rcx
				ret
	Multiply:
				mov rcx, T_FOREACH
				mov [TokenBuffer], rcx
				ret


	LessEqual:
			mov rcx, T_EQUAL_LESS
			mov [TokenBuffer], rcx
			ret


    GreaterEqual:
			mov rcx, T_EQUAL_GREATER
			mov [TokenBuffer], rcx
			ret


	EqualTo:
			mov rcx, T_EQUAL_TO
			mov [TokenBuffer], rcx
			ret


    NotEqual:
			mov rcx, T_NOT_EQUAL
			mov [TokenBuffer], rcx
			ret

_DefineKeyword: ; jumped to by _IterScanner

		mov rcx, [AssertionBuffer]

		mov rax, K_Mute
		cmp rcx, rax
		je Muteable


		mov rax, K_Immute
		cmp rcx, rax
		je Immutable



		mov rax, K_Vset
		cmp rcx, rax
		je ValueSet


		mov rax, K_NoType
		cmp rcx, rax
		je NoType



		mov rax, K_ArgsArrow
		cmp rcx, rax
		je ArgsArrow


		mov rax, K_OpenFunc
		cmp rcx, rax
		je FuncOpen



		mov rax, K_CloseFunc
		cmp rcx, rax
		je FuncClose


		mov rax, K_Element
		cmp rcx, rax
		je Element



		mov rax, K_Byte
		cmp rcx, rax
		je KByte


		mov rax, K_Char
		cmp rcx, rax
		je Char

		mov rax, K_Snum
		cmp rcx, rax
		je Snum


		mov rax, K_Int
		cmp rcx, rax
		je KInt

		mov rax, K_Lnum
		cmp rcx, rax
		je Lnum

		mov rax, K_Fltt
		cmp rcx, rax
		je Fltt


		mov rax, K_Flsf
		cmp rcx, rax
		je Flsf


		mov rax, K_Bool
		cmp rcx, rax
		je Bool


		mov rax, K_String
		cmp rcx, rax
		je String


		mov rax, K_bit
		cmp rcx, rax
		je KBit

		mov rax, K_nibble
		cmp rcx, rax
		je Nibble


		mov rax, K_Dword
		cmp rcx, rax
		je KDword


		mov rax, K_Qword
		cmp rcx, rax
		je KQword


		mov rax, K_Store
		cmp rcx, rax
		je Store


		mov rax, K_Ict
		cmp rcx, rax
		je Ict

		mov rax, K_Altern
		cmp rcx, rax
		je Altern


		mov rax, K_Dec
		cmp rcx, rax
		je Declare


		mov rax, K_Add
		cmp rcx, rax
		je Addition


		mov rax, K_Subt
		cmp rcx, rax
		je Subtraction

		mov rax, K_Div
		cmp rcx, rax
		je Division




		mov rax, K_Mod
		cmp rcx, rax
		je Modulo



		mov rax, K_Ret
		cmp rcx, rax
		je Return

		mov rax, K_Repeat
		cmp rcx, rax
		je KRepeat



		mov rax, K_For
		cmp rcx, rax
		je For

		mov rax, K_Fore
		cmp rcx, rax
		je Foreach

		mov rax, K_Mul
		cmp rcx, rax
		je Multiply

		;mov rax, K_True
		;cmp rcx, rax
		;je KTrue
        ;
		;mov rax, K_False
		;cmp rcx, rax
		;je KFalse




		xor rcx,rcx ; clear the buffer
		ret
		
	



	
