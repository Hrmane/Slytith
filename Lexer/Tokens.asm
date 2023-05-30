; Tokens
section .data
    ;**********************************************
    ;Arithmetic operations
    ;**********************************************

      T_PLUS db "ADD ",0
      T_MINUS db"MINUS ",0
      T_DIV db "DIV ",0
      T_MUL db "MUL ",0
      T_MOD db "MOD ",0
      T_INCREMENT db "INCR ",0
      T_DECREMENT db "DECR ",0
    

    ;***********************************************
    ;Logical operations
    ;***********************************************

      T_ICT db"ICT ",0
      T_ALTERN db "ALT ",0
      T_OR db"OR ",0
      T_AND db"AND ",0
      T_GREATER db"GRE ",0
      T_LESS db"LES ",0
      T_EQUAL_TO db"EQU ",0
      T_NOT_EQUAL db"NEQUAL ",0
      T_EQUAL_GREATER db"EGREAT ",0
      T_EQUAL_LESS db"ELESS ",0

    ;**************************************************
    ;General Purpose
    ;**************************************************
 
      
      T_TO db "TO ",0
      T_ASSIGNMENT db"ASSIGN ",0
      T_DECLARE db"DECL ",0
      T_DIRDIV db"DIRD ",0
      T_ELEMENT db "ELEM ",0
      T_RES db "RES ",0
      T_MUTE db "MUTE ",0
      T_IMMUTE db "IMMUT ",0
      T_VSET db "VSET ",0
      T_NOTYPE db "NOTYPE ",0
      T_ARGARROW db "ARGAR ",0
      T_OPENFUNC db "OFUNC ",0
      T_CLOSEFUNC db "CBLOK ",0
      T_RETURN db "RETURN ",0
      T_REPEAT db "REPEAT ",0
      T_FOR db "FOR ",0
      T_FOREACH db "FORE ",0

    ;*******************************************************
    ;                       OPERATORS
    ;*******************************************************
      T_DIR_DIV db "DIRD ",0
      T_MACRO_DEFINE db "MACRO ",0
      T_MEM_POINTER db "POINT ",0
      T_DECIMAL_POINT db"DPOINT ",0
      T_SEMICOLON db"SCOLON ",0
      T_OPEN_PAREN db"OPAREN ",0
      T_CLOSE_PAREN db"CPAREN ",0
      T_OPEN_FUNC db"OFUNC ",0
      T_CLOSE_FUNC db"CFUNC ",0
      T_ARRAY_OPEN db "ARR_L ",0
      T_ARRAY_CLOSE db "ARR_R ",0
      T_MULTLNCOM_START db"COM-S ",0
      T_MULTLNCOM_END db"COM-E ",0
      T_COMMA db "COMMA ",0
      T_EQUALS db "EQU ",0
      T_TILDE db "TILDE ",0
    
    ;******************************************************
    ; Data types
    ;******************************************************
   

   
     TYPE_BYTE db"BYTE ",0
     TYPE_CHAR db"CHAR ",0
     TYPE_SNUM db"SHORT " ,0;SHORT
     TYPE_INT db"INT ",0
     TYPE_LNUM db"LONG ",0
     TYPE_FLOAT64 db"F-64 ",0
     TYPE_FLOAT32 db "F-32 ",0
     TYPE_BOOL db "T-F ",0
     TYPE_STR db "STR ",0
     T_MOVINTO db "STORE ",0
     TYPE_BIT db "BIT ",0
     TYPE_NIBBLE db "NIBBLE ",0
     TYPE_QWORD db "QWORD ",0
     TYPE_DWORD db "DWORD ",0
     TYPE_WORD db "WORD ",0
     
     

  ;********************************************************
  ; Literals
  ;*********************************************************
      T_INTLIT db"INT-L ",0
      T_STRLIT db "STR-L ",0

;*********************************************************
;							Others
;*********************************************************



;//////////////////////////////////////////////////////////////////////////////////////////////
;										Token Declaration
;//////////////////////////////////////////////////////////////////////////////////////////////

       K_Mute db "mut"	;Used when declaring a "non-changable" variable
       K_Immute db	"immut";Used for varibles that will have value interchanged
       K_Vset db "vset";Similar as a stuct
       K_NoType db "notype" ; Similar to void type (not a int, str, bool, etc.)
       K_ArgsArrow db "->" ;Similar to argument parentheses e.g element Main -> str[] args<<
       K_OpenFunc db "<<" ;Open of the function to place code
       K_CloseFunc db ">>"; Close the function
       K_Element db "element" ; Declare a function/subroutine
       K_Byte db "byte"
       K_Char db "char"
       K_Snum db "snum"
       K_Int db "int"
       K_Lnum db "lnum"; Long-number
       K_Fltt db "fltt" ;Float 32-bit
       K_Flsf db "flsf" ;Float 64 bit
       K_Bool db "bool"
       K_String db "str"
       K_bit db "bit" ; singular 1 or 
       K_nibble db "nibble"
       K_word db "word"
       K_Dword db "doubword"
       K_Qword db "quadword"
       K_Store db "store" ; Add value to register(e.g store string | rax) string variable to rax
       K_Ict db "ict" ; Similar to if statement; ict(i == 25)
       K_Altern db "altern" ;Else statement
       K_Dec db "dec"; Declare a variable
       K_Add db "add"
       K_Subt db "subt"
       K_Mod db "mod"
       K_Div db "div"
       K_Sync db "sync"
       K_Sysend db "end" ; End of code
       K_Ret db "ret" ; return val
       K_Repeat db "repeat"
       K_Loop db "loop"
       K_For db "for"
       K_Fore db "foreach"
       K_Mul db "mul"
       K_True db "true"
       K_False db "false"
;*********************************
;               Operators
;**********************************
    O_TO db "|"
    O_DefMacro db "&"
    O_LessThan db "<"
    O_GreaterThan db ">"
    O_DecimalPoint db "."
    O_Semicolon db ';'
    O_EqualSign db '='
    O_Tilde db '~'
    O_Addition db '+'
    O_Subtraction db '-'
    O_Divide db '/'
    O_Modulo db '%'
    O_MemPointer db '@'
    O_ArrayOpen db '['
    O_ArrayClose db ']'
    Comments  db '#'
    Whitespace db ' '



section .text

section .bss
