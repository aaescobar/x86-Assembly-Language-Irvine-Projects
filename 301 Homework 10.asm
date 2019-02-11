INCLUDE NoIrvineBegin.inc

.data

a DWORD ?
b DWORD ?
LCF DWORD ?

prompt1 BYTE "Please provide an integer for a: ", 0
prompt2 BYTE "Please provide an integer for b: ", 0
solution_prompt BYTE "The largest common factor of a and b is: +", 0

.code

MyProgram proc

mov edx, OFFSET prompt1
call WriteString
call ReadInt
mov a, eax

mov edx, OFFSET prompt2
call WriteString
call ReadInt
mov b, eax

mov eax, a
mov ebx, b

;if (a==0 && b==0)
	cmp eax, 0		; if(a == 0)
	jne L1			;if(a!=0) jump to first else
	cmp ebx, 0		; && b == 0)
	jne L1			;if(b!=0)jump to else
	mov ebx, 1		;b=1 if both arguments correct move 1 into b or ebx
	jmp next

;else
  L1:		
	;if
	cmp ebx, 0
	jne L2			;second else
	mov ebx, eax
	jmp next
	;else
	L2:
	  ;if
	  cmp eax, 0	;a != 0
		jne L3		;continue 
		jmp next	;otherwise jump to next
	
			L3:	
			  cmp eax, ebx	;while(a != b)
			  je next		;if argument is false then exit to next
			  cmp eax, ebx			;if true continue
				jl  L4			;if a < b true jump to make b -= a;
				sub eax, ebx	;a -= b
				mov a, eax
				jmp next
		L4:			;B -= A
			sub ebx, eax
			mov b, ebx
			mov eax, b
			jmp next
			
;last statement
  next: 





mov edx, OFFSET solution_prompt
call WriteString
call WriteDec
	ret

MyProgram endp

INCLUDE NoIrvineEnd.inc

END