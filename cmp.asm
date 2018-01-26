; Assemble as: nasm -f elf -g readwrite.asm
; Link as: ld -m elf_i386 -o readwrite readwrite.o

section .data ;Data segment 
    prompt db 'Enter a number: '
	StrLen equ $-prompt
	
    DispNum db 'You entered: '  
    DispNumLen equ $-DispNum        
    
    num1 dd ''
    num2 dd ''
    num3 dd ''
    
    
    
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

; Exit code 
	mov eax, 1 
	mov ebx, 0 
	int 80h 

