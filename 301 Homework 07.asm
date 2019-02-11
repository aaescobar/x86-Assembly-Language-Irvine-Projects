INCLUDE NoIrvineBegin.inc

.data

array DWORD 1, 5, 6, 8, 0Ah, 1Bh, 1Eh, 22h, 2Ah, 32h
count DWORD ?

prompt1	BYTE "The non-reversed array contents are: ", 0
spaces BYTE " ", 0

prompt2 BYTE 0dh, 0ah, "The reversed array contents are: ", 0
.code

MyProgram proc

	mov edi, OFFSET array	;copy address of array into edi
	mov ecx, LENGTHOF array	;set the loop counter
	mov eax, 0
	
	mov edx, OFFSET prompt1
	call WriteString
	;////////////////////	LOOP 1 ////////////////////////
	NormalArray:
		mov count, ecx		;keep contents of ecx in count to preserve loop count
		;add space between numbers
		mov ecx, OFFSET spaces
		mov al, [ecx]
		call WriteChar


		mov ax, [edi]
		add edi, TYPE array

		call WriteDec

		mov ecx, count
		loop NormalArray
		
	;/////////////////////	LOOP 2 /////////////////////////////////////
	mov esi, 0				;reseting registers
	mov edi, 0				;reseting registers
	mov eax, 0				;reseting registers
	mov ebx, 0				;reseting registers

	mov esi, OFFSET array		;write beginning address of array	into esi			
	mov edi, OFFSET array + SIZEOF array - TYPE array 		;Write ending address of array into edi
	
	mov ecx, LENGTHOF array / 2  	;set loop counter

	ArrayReverserLoop:
	mov eax, [esi]    ; move the first number in array into eax
	mov ebx, [edi]	  ; move the last number in array into ebx

	xchg eax, ebx 		;exchange the values

	mov [esi], eax  	;moving the last number from the array into first array address
	mov [edi], ebx		;moving the first number into last address

	add esi, TYPE array 	;incrementing the process in order to move through the array frontwards
	sub edi, TYPE array 	;subtracting 4 from edi in order to move backwards

	loop ArrayReverserLoop
	

	;/////////////////////	LOOP 3 ////////////////////////////////
	
	mov edx, OFFSET prompt2
	call WriteString
	mov edi, OFFSET array	;copy address of array into edi
	mov ecx, LENGTHOF array	;set the loop counter
	mov eax, 0
	;//reusing first loop to display array again now with reversed numbers
	ReversedArray:
		mov count, ecx

		mov ecx, OFFSET spaces

		mov al, [ecx]
		call WriteChar
		
		mov ax, [edi]
		add edi, TYPE array

		call WriteDec

		mov ecx, count
		loop ReversedArray
		

	ret

MyProgram endp

INCLUDE NoIrvineEnd.inc

END