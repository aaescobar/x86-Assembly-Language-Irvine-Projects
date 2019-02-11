INCLUDE NoIrvineBegin.inc

.data

nums DWORD ?
numElems WORD 5
prompt1 BYTE "Input an integer less than 50 and press ENTER: ", 0
prompt2 BYTE "Top of the Stack is: ", 0
prompt3 BYTE "The total sum is: ", 0
theSUM DWORD ?

.code

MyProgram proc
	
	
	movzx ecx, numElems			; arguments of loop counter
	mov edx, OFFSET prompt1		; arguments
	call PrintTop

	ret

MyProgram endp

PrintTop proc
	

	L1:
	
		call WriteString
		call ReadInt
	
		push ecx
		push edi
		push eax
		push edx
	
		mov edx, 0 ; index
		

		mov [nums + edx], eax
		add edx, TYPE DWORD

		pop edx
		pop eax
		pop edi
		pop ecx
	
	loop L1

	
	mov edi, 0
	mov cx, numElems

	L3:
	
		mov edx, OFFSET prompt2
		call WriteString
		mov eax, [nums + edi]
		add edi, TYPE nums
		
		call WriteDec
		call Crlf

	loop L3

	mov edx, OFFSET prompt3
	call WriteString
	
	mov esi, 0
	mov eax, 0
	movzx ecx, numElems

	L4:

	add eax, nums[esi]
	add esi, TYPE nums
	loop L4

	mov theSUM, eax

	call WriteDec
	call Crlf

6	ret
PrintTop endp

INCLUDE NoIrvineEnd.inc

END