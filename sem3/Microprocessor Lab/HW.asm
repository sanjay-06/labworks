
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

DATA SEGMENT
     NUM1 DB 5
     NUM2 DB 9
     NUM3 DB 7
     LRGT DB ?
ENDS

CODE SEGMENT
    ASSUME DS:DATA CS:CODE
START:
    MOV AX,DATA
    MOV DS,AX
    MOV AL,NUM1
    MOV LRGT,AL
    CMP AL,NUM2
    JGE SKIP1
    MOV AL,NUM2
    MOV LRGT,AL
SKIP1:
    MOV AL,LRGT
    CMP AL,NUM3
    JGE SKIP2
    MOV AL,NUM3
    MOV LRGT,AL
SKIP2:
    MOV AH,4CH
    INT 21H
ENDS
END START

ret




