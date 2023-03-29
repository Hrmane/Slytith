; Tokens

section .data
    ;**********************************************
    ;Arithmetic operations
    ;**********************************************

      T_PLUS db 'add'
      T_MINUS db'sub'
      T_DIV db 'division'
      T_MUL db 'mul'
      T_MOD db 'mod'
      T_INCREMENT db '++'
      T_DECREMENT db '--'
    

    ;***********************************************
    ;Logical operations
    ;***********************************************

      T_ICT db'ICT' 
      T_ALTERN db 'ALT'
      T_OR db'OR'
      T_AND db'AND'
      T_GREATER db'GRE'
      T_LESS db'LES'
      T_EQUAL_TO db'EQU'
      T_NOT_EQUAL db'NOT-EQUAL-TO'
      T_EQUAL_GREATER db'EQUAL-GREATER'
      T_EQUAL_LESS db'EQUAL-LESS'
    
    ;**************************************************
    ;General Purpose
    ;**************************************************
 
      
      T_TO db 'TO'      
      T_ASSIGNMENT db'ASSIGN'
      T_DECLARE db'DECLARE'
      T_DIRDIV db'DIR-DIV'
      T_ELEMENT db "ELEMENT(FUNC)"
      T_RES db 'RES'
      T_MUTE db 'MUTE'
      T_IMMUTE db 'IMMUT'
      T_VSET db 'VSET'
      T_NOTYPE db 'NOTYPE'
      T_ARGARROW db 'ARGARROW' 
      T_OPENFUNC db 'OPENFUNC'
      T_CLOSEFUNC db 'CLOSEFUNC'
      T_SYNC db 'SYNC'
      T_SYSEND db 'SYSEND'
      T_RETURN db 'RETURN'
      T_REPEAT db 'REPEAT'
      T_LOOP db 'LOOP'
      T_FOR db 'FOR'
      T_FOREACH db 'FOREACH'

    ;*******************************************************
    ;                       OPERATORS
    ;*******************************************************
      T_DIR_DIV db 'DIR-DIV'
      T_MACRO_DEFINE db 'DEF-MACRO'
      T_MEM_POINTER db 'POINTER'
      T_DECIMAL_POINT db'FLOAT-POINT'
      T_SEMICOLON db'SEMICOLON'
      T_OPEN_PAREN db'OPEN-PAREN'
      T_CLOSE_PAREN db'CLOSE-PAREN'
      T_OPEN_FUNC db'OPEN-FUNC'
      T_CLOSE_FUNC db'CLOSE-FUNC'
      T_ARRAY_OPEN db 'ARRAY_OPEN'
      T_ARRAY_CLOSE db 'ARRAY_CLOSE'
      T_LNCOM db'SINGLE-LN-COMMENT'
      T_MULTLNCOM_START db'MLN-COMMENT-S'
      T_MULTLNCOM_END db'MLN-COMMENT-E'
      T_COMMA db 'COMMA'
      T_EQUALS db 'EQUAL-SIGN'
      T_TILDA db "TILDE"
    
    ;******************************************************
    ; Data types
    ;******************************************************
   

   
     TYPE_BYTE db'BYTE'
     TYPE_CHAR db'CHARACTER'
     TYPE_SNUM db'SHORT-NUM' ;SHORT
     TYPE_INT db'INTEGER'
     TYPE_LNUM db'LONG-NUM'
     TYPE_FLOAT64 db'FLOAT-64'
     TYPE_FLOAT32 db 'FLOAT-32'
     TYPE_BOOL db 'T-F'
     TYPE_STR db 'STR'
     T_MOVINTO db 'STORE'
     TYPE_BIT db 'BIT'
     TYPE_NIBBLE db 'NIBBLE'
     TYPE_QWORD db 'QWORD'
     TYPE_DWORD db 'DWORD'
     TYPE_WORD db 'WORD'
     
     

  ;********************************************************
  ; Literals
  ;*********************************************************
      T_INTLIT db'INT-LITERAL'
      T_BOOL db'BOOL-LITERAL'
      T_STRLIT db 'STRING-LITERAL'

;*********************************************************
;							Others
;*********************************************************


;/////////////////////////////////////////////////////////////////////////////////////////////////////
;                                         Token Cluster                                             
;//////////////////////////////////////////////////////////////////////////////////////////////////////
;***************************************Representation of the keywords*********************************
  Cluster_Token db ,"dword","bit","nibble","word","qword","res",'mute','immute','vset','notype','->','<<','>>','element', 'byte','char','snum','int','lnum','fltt','flst','bool','str','store','ict','altern','dec','add','subt','div','sync','assert','sysend','ret','repeat','loop','for'
  Operators db '|','&','>','<','.',';','=','~','+','-','%','!','@', '[',']', " ", '/', '^'
  Digits db '1','2','3','4','5','6','7','8','9','0'
  ;Forebidden db ' ', '@', '/@','@/' ; includes whitespaces and comments
  Comments  db '@'
  Whitespace db ' '
;//////////////////////////////////////////////////////////////////////////////////////////////
;										Token Declaration
;//////////////////////////////////////////////////////////////////////////////////////////////

K_Mute db "mut"	;Used when declaring a "non-changable" variable
K_Immute db	"immut";Used for varibles that will have value interchanged
K_Vset db "vset";Similar as a stuct
K_Notype db "notype" ; Similar to void type (not a int, str, bool, etc.)
K_ArgsArrow db "->" ;Similar to argument parentheses e.g element Main -> str[] args<<
K_OpenFunc db "<<" ;Open of the function to place code
K_CloseFunc db ">>"; Close the function
K_Element db "element" ; Declare a function/subroutine
K_Byte db "byte"
K_Char db "char"
K_Snum db "snum"
K_int db "int"
K_Lnum db "lnum"; Long-number
K_Fltt db "fltt" ;Float 32-bit
K_Flsf db "flsf" ;Float 64 bit
K_Bool db "bool"
K_String db "str"
K_bit db "bit" ; singular 1 or 0
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
O_DirDiv db '^'
O_Addition db '+'
O_Subtraction db '-'
O_Divide db '/'
O_Modulo db '%'
O_MemPointer db '@'
O_ArrayOpen db '['
O_ArrayClose db ']'




