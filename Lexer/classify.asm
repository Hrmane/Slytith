;classify  
%include "Lexer/Tokens.asm"
;%include "Lexer/Scanner.asm"
section .text

;/////////////////////////////////////////////////////////////////
;								OPERATORS
;/////////////////////////////////////////////////////////////////
_OpFound:
	;clear string after
	mov bl, [Whitespace] 
	mov al, [CurrentChar]
	cmp al, bl
	je _NextChar

		mov rax, O_TO
		cmp rcx, rax
		je ToSign

		
		mov rax, O_DefMacro
		cmp rcx, rax
		je DefMacro


		
		mov rax, O_LessThan
		cmp rcx, rax
		je LessThan

		
		mov rax, O_GreaterThan
		cmp rcx, rax
		je GreaterThan



		mov rax, O_DecimalPoint
		cmp rcx, rax
		je DecPoint

		
		mov rax, O_Semicolon
		cmp rcx, rax
		je Semicolon



		mov rax, O_EqualSign
		cmp rcx, rax
		je Equal

	
		mov rax, O_Tilde
		cmp rcx, rax
		je Tilde


		
		mov rax, O_MemPointer
		cmp rcx, rax
		je MemPointer

		
		mov rax, O_ArrayOpen
		cmp rcx, rax
		je ArrayLBrack

		mov rax, O_ArrayClose
		cmp rcx, rax
		je ArrayRBrack


	xor al, al
	jmp _IterScanner



	ArgsArrow:
			mov rcx, T_ARGARROW
			mov [TokenBuffer], rcx
			ret

	FuncOpen:
			mov rcx, T_OPEN_FUNC
			mov [TokenBuffer], rcx
			ret

	FuncClose:
			mov rcx, T_CLOSE_FUNC
			mov [TokenBuffer], rcx
			ret
			
    DirDiv:
			mov rcx, T_DIR_DIV
			mov [TokenBuffer], rcx
			ret

	DefMacro:
			mov rcx, T_MACRO_DEFINE
			mov [TokenBuffer], rcx
			ret

	LessThan:
			mov rcx, T_LESS
			mov [TokenBuffer], rcx
			ret
			
    
    GreaterThan:
			mov rcx, T_GREATER
			mov [TokenBuffer], rcx
			ret

	DecPoint:
			mov rcx, T_DECIMAL_POINT
			mov [TokenBuffer], rcx
			ret

	Semicolon:
			mov rcx, T_SEMICOLON
			mov [TokenBuffer], rcx

			mov rax, [LineCount]
			inc rax
			mov [LineCount], rax
			ret
			
    Equal:
			mov rcx, T_EQUALS
			mov [TokenBuffer], rcx
			ret

	Tilde:
			mov rcx, T_TILDE
			mov [TokenBuffer], rcx
			ret



	MemPointer:
			mov rcx, T_MEM_POINTER
			mov [TokenBuffer], rcx
			ret
	ToSign:
			mov rcx, T_TO
			mov [TokenBuffer], rcx
			ret
	ArrayLBrack:
			mov rcx, T_ARRAY_OPEN
			mov [TokenBuffer], rcx
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
					mov rcx, TYPE_STRING
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
						mov rcx, T_ALT
						mov [TokenBuffer], rcx
						ret
			
	Declare:
						mov rcx, T_DECLARE
						mov [TokenBuffer], rcx
						ret
			
	Sync:
						mov rcx, T_SYNC
						mov [TokenBuffer], rcx
						ret
	Sysend:
			mov rcx, T_SYSEND
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
	
	LoopCall:
				mov rcx, T_LOOP
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

		
		mov rax, K_Opennc
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
		je Kint

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


		mov rax, K_nit
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


		mov rax, K_Sync
		cmp rcx, rax
		je Sync

		mov rax, K_Mod
		cmp rcx, rax
		je KModulo

		mov rax, K_Sysend
		cmp rcx, rax
		je Sysend

		mov rax, K_Ret
		cmp rcx, rax
		je Return

		mov rax, K_Repeat
		cmp rcx, rax
		je KRepeat

		mov rax, K_Loop
		cmp rcx, rax
		je KLoop

		mov rax, K_For
		cmp rcx, rax
		je KFor

		mov rax, K_Fore
		cmp rcx, rax
		je KFore

		mov rax, K_Mult
		cmp rcx, rax
		je Multiply

		mov rax, K_True
		cmp rcx, rax
		je KTrue

		mov rax, K_False
		cmp rcx, rax
		je KFalse


		

		xor rcx,rcx ; clear the buffer
		ret	
		
	



	
