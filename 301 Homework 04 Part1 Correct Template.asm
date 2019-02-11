; AddTwo.asm - adds two 32 - bit integers.
; Andy Escobar
; Assembly Language
; Program 04 Part 1

INCLUDE NoIrvineBegin.inc

.data
prompt1 db 13, 10, "Enter first number: ", 0dh, 0ah, 0
prompt2 db 13, 10, "Now enter second number:", 0dh, 0ah, 0
prompt3 db 13, 10, "The sum is: " , 0dh, 0ah, 0
userNum1 DWORD ?
userNum2 DWORD ?
result DWORD ?

.code
MyProgram proc
call Clrscr
; get first number
mov edx, OFFSET prompt1
call WriteString
call ReadInt

mov userNum1, eax
; get second number
mov edx, OFFSET prompt2
call WriteString
call ReadInt
; display sum
mov edx, OFFSET prompt3
call WriteString
add userNum1, eax
mov eax, userNum1


call WriteDec



MyProgram endp

INCLUDE NoIrvineEnd.inc
END