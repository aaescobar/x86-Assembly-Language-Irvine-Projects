;Andy Escobar 
;Dr.Casavant
;CSDP 301
;12/7/2018
;Program 11 Finding largest and smallest along with position 
INCLUDE NoIrvineBegin.inc

.data
Array DWORD 5, 46, 90, 50, 5, 6, 90, 8, 20
Arrsze = 9
max DWORD 0
maxposn DWORD ?
min DWORD 0
minposn DWORD ?

prompt1 BYTE "The position in array of last occurrence of minimum element is: ", 0
prompt1A BYTE "The minimum element in the array is: ", 0
prompt2 BYTE "The position in array of last occurrence of maximum element is: ", 0
prompt2A BYTE "The maximum element in the array is: ", 0

.code

MyProgram proc
;MinandMax(int &max, int &maxposn, int &min, int &maxposn, int& Array, int Arrsze)
push Arrsze
push OFFSET Array
push OFFSET	minposn
push OFFSET min
push OFFSET maxposn
push OFFSET max

call Minandmax
	ret

MyProgram endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MinandMax proc
push ebp
mov ebp, esp
pushad
mov edx, OFFSET prompt1
call WriteString


mov ecx, [ebp + 28]	;Arrsze = 9
mov esi, [ebp + 24]	;offset array		
mov ebx, [ebp + 20]	;offset minposn
mov edx, [ebp + 16]	;offset min		
mov edi, [ebp + 12] ;offset maxposn
mov eax, [ebp + 8]	;offset max		
mov ebx, 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FIND MINIMUM
findSmallest:
	mov edx, [esi]
	add ebx, 4
minvalue:
	cmp edx, [esi]
	jle minloop
	mov edx, [esi]
minloop:
	add esi, 4
	loop minvalue


	mov eax, ebx
	call WriteDec
	mov eax, edx
call Crlf
mov edx, OFFSET prompt1A
call WriteString
call WriteDec
call Crlf

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;FIND MAXIMUM
mov ecx, [ebp + 28]	;Arrsze = 9
mov esi, [ebp + 24]	;offset array		
mov ebx, [ebp + 20]	;offset minposn
mov edx, [ebp + 16]	;offset min		
mov edi, [ebp + 12] ;offset maxposn
mov eax, [ebp + 8]	;offset max		
mov edi, 0
mov edx, OFFSET prompt2
	call WriteString
	

findBiggest:		
	mov eax, [esi]
	
maxvalue:
	cmp eax, [esi]
	jge maxloop
	mov eax, [esi]
maxloop:
	add esi, 4
	loop maxvalue
	mov ebx, eax

	call WriteDec
	call Crlf

	mov eax, ebx
	mov edx, OFFSET prompt2A
	call WriteString
	
	call WriteDec



popad
pop ebp
ret	8

MinandMax endp

INCLUDE NoIrvineEnd.inc

END