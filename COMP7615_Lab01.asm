section .data

  InputNum1 db 'Enter first number: '
	StrLen1 equ $-InputNum1
	DispNum1 db 'First number: '
	DispNumlen1 equ $-DispNum1

	InputNum2 db 'Enter second number: '
	StrLen2 equ $-InputNum2
	DispNum2 db 'Second number: '
	DispNumlen2 equ $-DispNum2

	InputNum3 db 'Enter third number: '
	StrLen3 equ $-InputNum3
	DispNum3 db 'Third number: '
	DispNumlen3 equ $-DispNum3

section .bss
    num1 resb 5
    num2 resb 5
    num3 resb 5

section .text
global _start
_start:

; Prompt first number
	mov eax, 4
	mov ebx, 1
	mov ecx, InputNum1
	mov edx, StrLen1
	int 80h

; Store first number
	mov eax, 3
	mov ebx, 0
	mov ecx, num1
  mov edx, 5
  int 80h

; Dummy Text Output
	mov eax, 4
	mov ebx, 1
	mov ecx, DispNum1
	mov edx, DispNumlen1
	int 80h

;Output the first number entered
	mov eax, 4
	mov ebx, 1
	mov ecx, num1
	mov edx, 5
	int 80h

; Prompt second number
	mov eax, 4
	mov ebx, 1
	mov ecx, InputNum2
	mov edx, StrLen2
	int 80h

; Store second number
	mov eax, 3
	mov ebx, 0
	mov ecx, num2
    mov edx, 5
    int 80h

; Dummy Text Output
	mov eax, 4
	mov ebx, 1
	mov ecx, DispNum2
	mov edx, DispNumlen2
	int 80h

;Output the second number entered
	mov eax, 4
	mov ebx, 1
	mov ecx, num2
	mov edx, 5
	int 80h

; Prompt third number
	mov eax, 4
	mov ebx, 1
	mov ecx, InputNum3
	mov edx, StrLen3
	int 80h

; Store third number
	mov eax, 3
	mov ebx, 0
	mov ecx, num3
    mov edx, 5
    int 80h

; Dummy Text Output
	mov eax, 4
	mov ebx, 1
	mov ecx, DispNum3
	mov edx, DispNumlen3
	int 80h

;Output the third number entered
	mov eax, 4
	mov ebx, 1
	mov ecx, num3
	mov edx, 5
	int 80h

;Compare num1 with num2
    mov eax, [num1]
    cmp eax, [num2] ;compare num1 > num2
    jg stageA ;if num1 is greater go to stageA

    cmp eax, [num2] ;if num1 is less go to stageB
    jl stageB

stageA:
    mov eax, [num1]
    cmp eax, [num3] ;compare num1 > num3
    jge stageAB

    cmp eax, [num3] ;compare num1 > num3
    jl stageCA ;if num1 is less go to stageCA

stageAB:
   mov eax, [num2]
   cmp eax, [num3] ;compare num2 > num3
   jge print1

   cmp eax, [num3] ;compare num2 > num3
   jl print2

stageB:
    mov eax, [num2]
    cmp eax, [num3] ;compare num2 > num3
    jge stageBA

    cmp eax, [num3] ;compare num2 > num3
    jl stageC

stageBA:
   mov eax, [num1]
   cmp eax, [num3] ;compare num1 > num3
   jge print3

   cmp eax, [num3] ;compare num1 > num3
   jl print4

stageC:
   mov eax, [num3]
   cmp eax, [num1] ;compare num1 > num3
   jge print5

stageCA:
   mov eax, [num3]
   cmp eax, [num2] ;compare num1 > num2
   jge print6

print1:
	mov eax, 4
	mov ebx, 1
	mov ecx, num1
	mov edx, 5
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num2
	mov edx, 5
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num3
	mov edx, 5
	int 80h

    ;exit code
    mov eax, 1
    int 0x80

print2:
	mov eax, 4
	mov ebx, 1
	mov ecx, num1
	mov edx, 5
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num3
	mov edx, 5
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num2
	mov edx, 5
	int 80h

    ;exit code
    mov eax, 1
    int 0x80

print3:
	mov eax, 4
	mov ebx, 1
	mov ecx, num2
	mov edx, 5
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num1
	mov edx, 5
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num3
	mov edx, 5
	int 80h

    ;exit code
    mov eax, 1
    int 0x80

print4:
	mov eax, 4
	mov ebx, 1
	mov ecx, num2
	mov edx, 5
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num3
	mov edx, 5
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num1
	mov edx, 5
	int 80h

    ;exit code
    mov eax, 1
    int 0x80

print5:
	mov eax, 4
	mov ebx, 1
	mov ecx, num3
	mov edx, 5
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num2
	mov edx, 5
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num1
	mov edx, 5
	int 80h

    ;exit code
    mov eax, 1
    int 0x80

print6:
	mov eax, 4
	mov ebx, 1
	mov ecx, num3
	mov edx, 5
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num1
	mov edx, 5
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, num2
	mov edx, 5
	int 80h

    ;exit code
    mov eax, 1
    int 0x80
