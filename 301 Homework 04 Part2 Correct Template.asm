; AddTwo.asm - adds two 32 - bit integers.
; Chapter 3 example
; Andy Escobar 
; Dr. Casavant
INCLUDE NoIrvineBegin.inc

messageFor11 TEXTEQU <"The following should be 11">
messageFor7 TEXTEQU <"The following should be 7">

movSetup TEXTEQU <mov edx, OFFSET>

five = 5
six = 6
eleven = 11
seven = 7
.data
displayMessageFor11 BYTE messageFor11, 0Dh, 0Ah, 0
displayMessageFor7 BYTE messageFor7, 0Dh, 0Ah, 0

eleve DWORD eleven
seve DWORD seven

WriteStrSetup TEXTEQU <mov edx, OFFSET displayMessageFor11>

.code

MyProgram proc

WriteStrSetup TEXTEQU <movSetup eleven>
eleven = 11


mov edx, OFFSET displayMessageFor11
call WriteString
mov eax, eleve
call WriteDec
call CrLf

WriteStrSetup TEXTEQU <movSetup seven>
numSeven TEXTEQU %seven

WriteStrSetup
mov edx, OFFSET displayMessageFor7
call WriteString
mov eax, seve
call WriteDec
call Crlf


MyProgram endp

INCLUDE NoIrvineBegin.inc

END