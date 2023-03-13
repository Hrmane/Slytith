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
 
      T_PERIOD db'PERIOD'
      T_SEMICOLON db'SEMICOLON'
      T_OPEN_PAREN db'OPEN-PAREN'
      T_CLOSE_PAREN db'CLOSE-PAREN'
      T_PARIM db'PRIM'
      T_OPEN_FUNC db'OPEN-FUNC'
      T_CLOSE_FUNC db'CLOSE-FUNC'
      T_ASSIGNMENT db'ASSIGN'
      T_DECLARE db'DECLARE'
      T_DIRDIV db'DIR-DIV'
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

  ;********************************************************
  ; Literals
  ;*********************************************************
      T_INTLIT db'INT-LITERAL'
      T_BOOL db'BOOL-LITERAL'
      T_STRLIT db 'STRING-LITERAL'


;/////////////////////////////////////////////////////////////////////////////////////////////////////
;                                         Token Cluster                                             
;//////////////////////////////////////////////////////////////////////////////////////////////////////
;***************************************Representation of the keywords*********************************
  Cluster_Token db 'byte','char','snum','int','lnum','fltt','flst','tf','str','store','ict','altern','dec','add','subt','div' 
  Operators db '&','>','<','.',';','(',')','=','~','+','-','%','!','@','-', ' '
  Digits db '1','2','3','4','5','6','7','8','9','0'
  Forebidden db ' ', '@', '/@','@/' ; includes whitespaces and comments
