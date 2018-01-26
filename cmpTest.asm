; Assemble as: nasm -f elf -g readwrite.asm
; Link as: ld -m elf_i386 -o readwrite readwrite.o

section .data ;Data segment 
    prompt db 'Enter a number: '
	StrLen equ $-prompt
	
    DispNum db 'You entered: '  
    DispNumLen equ $-DispNum   
    
    msg db "The largest digit is: " 
    len equ $- msg      
    
    num1 dd ''
    num2 dd ''
    num3 dd ''
    num4 dd ''
    
    newLine db 0xa
    NewLen equ $- newLine

    
    
section .bss    ;Uninitialized data 
	num resb 5 

section .text   ;Code Segment 
global _start 
_start: 
    ;1	
    ;Prompt User 
	mov eax, 4 
	mov ebx, 1     ; descriptor value for stdout
	mov ecx, prompt
	mov edx, StrLen
	int 80h 

	;Read and store the user input 
	mov eax, 3 
	mov ebx, 0     ; descriptor value for stdin
	mov ecx, num1 
	mov edx, 5     ;5 bytes (numeric, 1 for sign) of that information 
	int 80h 

    ;Prompt for a number  
	mov eax, 4 
	mov ebx, 1 
	mov ecx, DispNum
	mov edx, DispNumLen
	int 80h 

	;Output the number entered 
	mov eax, 4 
	mov ebx, 1 
	mov ecx, num1 
	mov edx, 5 
	int 80h 

    ;2
	;Prompt User 
	mov eax, 4 
	mov ebx, 1     ; descriptor value for stdout
	mov ecx, prompt
	mov edx, StrLen
	int 80h 

	;Read and store the user input 
	mov eax, 3 
	mov ebx, 0     ; descriptor value for stdin
	mov ecx, num2 
	mov edx, 5     ;5 bytes (numeric, 1 for sign) of that information 
	int 80h 

    ;Prompt for a number  
	mov eax, 4 
	mov ebx, 1 
	mov ecx, DispNum 
	mov edx, DispNumLen 
	int 80h 

	;Output the number entered 
	mov eax, 4 
	mov ebx, 1 
	mov ecx, num2 
	mov edx, 5 
	int 80h 


    ;3
	;Prompt User 
	mov eax, 4 
	mov ebx, 1     ; descriptor value for stdout
	mov ecx, prompt
	mov edx, StrLen
	int 80h 

	;Read and store the user input 
	mov eax, 3 
	mov ebx, 0     ; descriptor value for stdin
	mov ecx, num3 
	mov edx, 5     ;5 bytes (numeric, 1 for sign) of that information 
	int 80h 
    
    ;Prompt for a number  
	mov eax, 4 
	mov ebx, 1 
	mov ecx, DispNum
	mov edx, DispNumLen 
	int 80h 

	;Output the number entered 
	mov eax, 4 
	mov ebx, 1 
	mov ecx, num3 
	mov edx, 5 
	int 80h 


    mov ecx, [num1] 
    cmp ecx, [num2] 
    jg check_third_num 
    mov ecx, [num3] 

check_third_num: 
    cmp ecx, [num3] 
    jg 
    mov ecx, [num3] 


; Exit code 
	mov [num4], ecx 
    mov ecx,msg 
    mov edx, len 
    mov ebx,1   ;file descriptor (stdout) 
    mov eax,4   ;system call number (sys_write) 
    int 0x80    ;call kernel 
   
    mov ecx,num4 
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

