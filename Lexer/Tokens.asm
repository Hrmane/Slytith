; Tokens
section .data
    ;**********************************************
    ;Arithmetic operations
    ;**********************************************

      T_PLUS equ "ADD 0"
      T_MINUS equ"MINUS 0"
      T_DIV equ "DIV 0"
      T_MUL equ "MUL 0"
      T_MOD equ "MOD 0"
      T_INCREMENT equ "INCR 0"
      T_DECREMENT equ "DECR 0"
    

    ;***********************************************
    ;Logical operations
    ;***********************************************

      T_ICT equ"ICT 0"
      T_ALTERN equ "ALT 0"
      T_OR equ"OR 0"
      T_AND equ"AND 0"
      T_GREATER equ"GRE 0"
      T_LESS equ"LES 0"
      T_EQUAL_TO equ"EQU 0"
      T_NOT_EQUAL equ"NEQUAL 0"
      T_EQUAL_GREATER equ"EGREAT 0"
      T_EQUAL_LESS equ"ELESS 0"

    ;**************************************************
    ;General Purpose
    ;**************************************************
 
      
      T_TO equ "TO 0"
      T_ASSIGNMENT equ"ASSIGN 0"
      T_DECLARE equ"DECL 0"
      T_DIRDIV equ"DIRD 0"
      T_ELEMENT equ "ELEM 0"
      T_RES equ "RES 0"
      T_MUTE equ "MUTE 0"
      T_IMMUTE equ "IMMUT 0"
      T_VSET equ "VSET 0"
      T_NOTYPE equ "NOTYPE 0"
      T_ARGARROW equ "ARGAR 0"
      T_OPENFUNC equ "OFUNC 0"
      T_CLOSEFUNC equ "CBLOK 0"
      T_RETURN equ "RETURN 0"
      T_REPEAT equ "REPEAT 0"
      T_FOR equ "FOR 0"
      T_FOREACH equ "FORE 0"

    ;*******************************************************
    ;                       OPERATORS
    ;*******************************************************
      T_DIR_DIV equ "DIRD 0"
      T_MACRO_DEFINE equ "MACRO 0"
      T_MEM_POINTER equ "POINT 0"
      T_DECIMAL_POINT equ"DPOINT 0"
      T_SEMICOLON equ"SCOLON 0"
      T_OPEN_PAREN equ"OPAREN 0"
      T_CLOSE_PAREN equ"CPAREN 0"
      T_OPEN_FUNC equ"OFUNC 0"
      T_CLOSE_FUNC equ"CFUNC 0"
      T_ARRAY_OPEN equ "ARR_L 0"
      T_ARRAY_CLOSE equ "ARR_R 0"
      T_LNCOM equ"COMMENT 0"
      T_MULTLNCOM_START equ"COM-S 0"
      T_MULTLNCOM_END equ"COM-E 0"
      T_COMMA equ "COMMA 0"
      T_EQUALS equ "EQU 0"
      T_TILDE equ "TILDE 0"
    
    ;******************************************************
    ; Data types
    ;******************************************************
   

   
     TYPE_BYTE equ"BYTE 0"
     TYPE_CHAR equ"CHAR 0"
     TYPE_SNUM equ"SHORT 0" ;SHORT
     TYPE_INT equ"INT 0"
     TYPE_LNUM equ"LONG 0"
     TYPE_FLOAT64 equ"F-64 0"
     TYPE_FLOAT32 equ "F-32 0"
     TYPE_BOOL equ "T-F 0"
     TYPE_STR equ "STR 0"
     T_MOVINTO equ "STORE 0"
     TYPE_BIT equ "BIT 0"
     TYPE_NIBBLE equ "NIBBLE 0"
     TYPE_QWORD equ "QWORD 0"
     TYPE_DWORD equ "DWORD 0"
     TYPE_WORD equ "WORD 0"
     
     

  ;********************************************************
  ; Literals
  ;*********************************************************
      T_INTLIT equ"INT-LIT 0"
      T_BOOL equ"BOO-LIT 0"
      T_STRLIT equ "STR-LIT 0"

;*********************************************************
;							Others
;*********************************************************



;//////////////////////////////////////////////////////////////////////////////////////////////
;										Token Declaration
;//////////////////////////////////////////////////////////////////////////////////////////////

       K_Mute equ "mut"	;Used when declaring a "non-changable" variable
       K_Immute equ	"immut";Used for varibles that will have value interchanged
       K_Vset equ "vset";Similar as a stuct
       K_NoType equ "notype" ; Similar to void type (not a int, str, bool, etc.)
       K_ArgsArrow equ "->" ;Similar to argument parentheses e.g element Main -> str[] args<<
       K_OpenFunc equ "<<" ;Open of the function to place code
       K_CloseFunc equ ">>"; Close the function
       K_Element equ "element" ; Declare a function/subroutine
       K_Byte equ "byte"
       K_Char equ "char"
       K_Snum equ "snum"
       K_Int equ "int"
       K_Lnum equ "lnum"; Long-number
       K_Fltt equ "fltt" ;Float 32-bit
       K_Flsf equ "flsf" ;Float 64 bit
       K_Bool equ "bool"
       K_String equ "str"
       K_bit equ "bit" ; singular 1 or 0
       K_nibble equ "nibble"
       K_word equ "word"
       K_Dword equ "doubword"
       K_Qword equ "quadword"
       K_Store equ "store" ; Add value to register(e.g store string | rax) string variable to rax
       K_Ict equ "ict" ; Similar to if statement; ict(i == 25)
       K_Altern equ "altern" ;Else statement
       K_Dec equ "dec"; Declare a variable
       K_Add equ "add"
       K_Subt equ "subt"
       K_Mod equ "mod"
       K_Div equ "div"
       K_Sync equ "sync"
       K_Sysend equ "end" ; End of code
       K_Ret equ "ret" ; return val
       K_Repeat equ "repeat"
       K_Loop equ "loop"
       K_For equ "for"
       K_Fore equ "foreach"
       K_Mul equ "mul"
       K_True equ "true"
       K_False equ "false"
;*********************************
;               Operators
;**********************************
    O_TO equ "|"
    O_DefMacro equ "&"
    O_LessThan equ "<"
    O_GreaterThan equ ">"
    O_DecimalPoint equ "."
    O_Semicolon equ ';'
    O_EqualSign equ '='
    O_Tilde equ '~'
    O_DirDiv equ '^'
    O_Addition equ '+'
    O_Subtraction equ '-'
    O_Divide equ '/'
    O_Modulo equ '%'
    O_MemPointer equ '@'
    O_ArrayOpen equ '['
    O_ArrayClose equ ']'
    Comments  equ '#'
    Whitespace equ ' '




