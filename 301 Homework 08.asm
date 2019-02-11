INCLUDE NoIrvineBegin.inc

.data

numElems WORD 5 
theSUM DWORD ?
array DWORD ?

prompt1 BYTE "Input an integer less than 50 and press ENTER: ", 0
prompt2 BYTE "The 5 numbers input are: ", 0
prompt3 BYTE 0dh, 0ah, "The average of the five numbers input is: ", 0
spaces BYTE " ", 0
count DWORD ?

.code

MyProgram proc
	
	mov edi, OFFSET array
	movzx ecx, numElems
	mov edx, OFFSET prompt1
	;//////////////////////////////////////////////////////
	FIRSTLOOP: 
	
	call WriteString
	call ReadInt

	mov [edi], eax
	add esi, TYPE WORD
	
	mov [array], edi
	
	
	add [theSUM], eax

	loop FIRSTLOOP
	;//////////////////////////////////////////////////////
		

		mov edi, OFFSET array
		movzx ecx, numElems	; loop counter
		mov eax, 0

		mov edx, OFFSET prompt2
		call WriteString
	SECONDLOOP:
		mov count, ecx
		mov ecx, OFFSET spaces
		mov al, [ecx]
		call WriteChar

		mov ax, [edi]
		add edi, TYPE array

		call WriteDec

		mov ecx, count
		loop SECONDLOOP
	;/////////////////////////////////////////////////////
		mov edx, OFFSET prompt3
		call WriteString
		
		mov eax, DWORD PTR [theSUM]
		div numElems
		
		
		call WriteDec

	ret

MyProgram endp

INCLUDE NoIrvineEnd.inc

END