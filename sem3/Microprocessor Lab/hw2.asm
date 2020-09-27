
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here

mov ax, 10
mov bx, 15 
MOV cx,1

cmp ax, bx
           
           
jge lable1 

cmp bx,cx

jge lable2
mov dx,cx
jmp end

lable2:
    mov dx,bx
    jmp end
    

lable1:
    cmp ax,cx
    jge lable3
    mov dx,cx
    jmp end
lable3:
    mov dx,ax
    jmp end

end:    

ret




