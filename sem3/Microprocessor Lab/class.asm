
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

; add your code here

mov SS:[bx],2011h

mov ax,[1000h]
mov bx,[1002h]

cmp ax, bx

jge label1
    mov cx, 0
    jmp end

label1:
    mov cx, 1

end:    

ret




