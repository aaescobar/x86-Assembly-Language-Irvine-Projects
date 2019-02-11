INCLUDE NoIrvineBegin.inc

.data

;step a data
prompt1 db 13, 10, "The contents of ebx is: ", 0dh, 0ah, 0
number1 DWORD	5
prompt2 db 13, 10, "The contents of ecx is: ", 0dh, 0ah, 0

;step b data
unsigned WORD 5, 6, 7, 8
signed SWORD -1, -2, -3, -4
prompt3 db 13, 10, "This are registers for unsigned task.", 0dh, 0ah, 0
prompt4 db 13, 10, "This are registers for signed task.", 0dh, 0ah, 0

;step c data
prompt5 db 13, 10, "This are the registers for part C.", 0dh, 0ah, 0
.code

MyProgram proc
;step a code
  ;moving number1 and negating the register
   mov ebx, number1
   neg ebx

  ;moving 5 to lower 8 bits of ecx
  mov ecx, 0
  mov cl, BYTE PTR [number1]
  neg cl


  ;moving ebx into eax and displaying contents of ebx
  mov eax, ebx
  mov edx, OFFSET prompt1
  call WriteString
  call WriteInt

  ;moving ecx into eax and displaying prompt2
 
  mov edx, OFFSET prompt2
  call WriteString

  mov eax, ecx
  call WriteInt

  mov edx, OFFSET prompt3
  call WriteString

;step b code
	movzx eax, [unsigned]
	movzx ebx, [unsigned + 2]
	movzx ecx, [unsigned + 4]
	movzx edx, [unsigned + 6]
 call DumpRegs

 mov edx, OFFSET prompt4
 call WriteString

	 movsx eax, [signed]
	 movsx ebx, [signed + 2]
	 movsx ecx, [signed + 4]
	 movsx edx, [signed + 6]
 call DumpRegs
 
 mov edx, OFFSET prompt5
 call WriteString


 ;step c code
	; moving 7FF0h into ax
 mov ax, 7FF0h
	; moving 10h into al
 add al, 10h
 call DumpRegs
 ;The reason for the CF flags to be 1 is becasue the carry from the addition
 ;requires 9 bits;The OF flag is off because there is no overflow that shows a positive 
 ;number because we are adding to lower bits of eax
 call DumpFlags

	;adding 1 to upper 8 bits of ax
 add ah, 1
 call DumpRegs
 call DumpFlags
 ;The CF flag is off because there is no carry to the upper eax and is added to
 ;7 of the least significant; OF flag is on because 
	;adding 2 to ax
 add ax, 2
 call DumpRegs
 call DumpFlags
 
 





	ret

MyProgram endp

INCLUDE NoIrvineEnd.inc

END