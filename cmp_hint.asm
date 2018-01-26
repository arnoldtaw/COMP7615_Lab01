;The following program displays the largest of three variables. 
; Assemble as: nasm -f elf -g cmpsums.asm
; Link as: ld -m elf_i386 -o cmpsums cmpsums.o

section .data 
    msg db "The largest digit is: " 
    len equ $- msg 
    num1 dd '47' 
    num2 dd '22' 
    num3 dd '31' 
    newLine db 0xa
    NewLen equ $- newLine

segment .bss 
    largest resb 2 

section .text 
    global _start 

_start:  
    mov ecx, [num1] 
    cmp ecx, [num2] 
    jg check_third_num 
    mov ecx, [num3] 

check_third_num: 
    cmp ecx, [num3] 
    jg _exit 
    mov ecx, [num3] 

_exit: 
    mov [largest], ecx 
    mov ecx,msg 
    mov edx, len 
    mov ebx,1   ;file descriptor (stdout) 
    mov eax,4   ;system call number (sys_write) 
    int 0x80    ;call kernel 
   
    mov ecx,largest 
    mov edx, 2 
    mov ebx,1 ;file descriptor (stdout) 
    mov eax,4 ;system call number (sys_write) 
    int 0x80 ;call kernel 

    ; print newline
    mov edx, NewLen  ; msg length
    mov ecx, newLine
    mov ebx, 1   ; stdout
    mov eax, 4   ; write
    int 0x80
    
    mov eax, 1 ; exit
    int 80h 


