; Tokens
section .data
    ;**********************************************
    ;Arithmetic operations
    ;**********************************************

      T_PLUS equ "add "
      T_MINUS equ"sub "
      T_DIV equ "div "
      T_MUL equ "mul "
      T_MOD equ "mod "
      T_INCREMENT equ "++ "
      T_DECREMENT equ "-- "
    

    ;***********************************************
    ;Logical operations
    ;***********************************************

      T_ICT equ"ICT "
      T_ALTERN equ "ALT "
      T_OR equ"OR "
      T_AND equ"AND "
      T_GREATER equ"GRE "
      T_LESS equ"LES "
      T_EQUAL_TO equ"EQU "
      T_NOT_EQUAL equ"NEQUAL "
      T_EQUAL_GREATER equ"EGREAT "
      T_EQUAL_LESS equ"ELESS "
    
    ;**************************************************
    ;General Purpose
    ;**************************************************
 
      
      T_TO equ "TO "
      T_ASSIGNMENT equ"ASSIGN "
      T_DECLARE equ"DECLARE "
      T_DIRDIV equ"DIR-DIV "
      T_ELEMENT equ "ELEMENT "
      T_RES equ "RES "
      T_MUTE equ "MUTE "
      T_IMMUTE equ "IMMUT "
      T_VSET equ "VSET "
      T_NOTYPE equ "NOTYPE "
      T_ARGARROW equ "ARGAR "
      T_OPENFUNC equ "OFUNC "
      T_CLOSEFUNC equ "CLOSBLK "
      T_RETURN equ "RETURN "
      T_REPEAT equ "REPEAT "
      T_FOR equ "FOR "
      T_FOREACH equ "FOREACH "

    ;*******************************************************
    ;                       OPERATORS
    ;*******************************************************
      T_DIR_DIV equ "DIR-DIV "
      T_MACRO_DEFINE equ "MACRO "
      T_MEM_POINTER equ "POINTER "
      T_DECIMAL_POINT equ"FlPOINT "
      T_SEMICOLON equ"SCOLON "
      T_OPEN_PAREN equ"OPAREN "
      T_CLOSE_PAREN equ"CPAREN "
      T_OPEN_FUNC equ"OFUNC "
      T_CLOSE_FUNC equ"CFUNC "
      T_ARRAY_OPEN equ "ARR_L "
      T_ARRAY_CLOSE equ "ARR_R "
      T_LNCOM equ"COMMENT "
      T_MULTLNCOM_START equ"COM-S "
      T_MULTLNCOM_END equ"COM-E "
      T_COMMA equ "COMMA "
      T_EQUALS equ "EQU "
      T_TILDE equ "TILDE "
    
    ;******************************************************
    ; Data types
    ;******************************************************
   

   
     TYPE_BYTE equ"BYTE "
     TYPE_CHAR equ"CHAR "
     TYPE_SNUM equ"SHORT " ;SHORT
     TYPE_INT equ"INT "
     TYPE_LNUM equ"LONG "
     TYPE_FLOAT64 equ"F-64 "
     TYPE_FLOAT32 equ "F-32 "
     TYPE_BOOL equ "T-F "
     TYPE_STR equ "STR "
     T_MOVINTO equ "STORE "
     TYPE_BIT equ "BIT "
     TYPE_NIBBLE equ "NIBBLE "
     TYPE_QWORD equ "QWORD "
     TYPE_DWORD equ "DWORD "
     TYPE_WORD equ "WORD "
     
     

  ;********************************************************
  ; Literals
  ;*********************************************************
      T_INTLIT equ"INT-LIT "
      T_BOOL equ"BOO-LIT "
      T_STRLIT equ "STR-LIT "

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




