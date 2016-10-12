; Program Name:  Chris_Moffett_Week6_Part1
; Program Description: Reverse string with modules
; Author: Christopher Moffett
; Date:   9/28/2016

.386
.model flat,c		; C calling convention
.stack 4096h

INCLUDE Chris_Moffett_Week6_Part1_Include.inc
includelib mscvrt
includelib vcruntime
includelib legacy_stdio_defintions
includelib ucrt

; Declare the external procedures we will be calling
extern ReverseString:PROC	; my modular proc

STDIN EQU 0
STDOUT EQU 1

.data
nl		dword 0ah		; new line character
fwdString byte "A super calloused fragile mystic hexed by halitosis",0
stringSize = ($ - fwdString) - 1
rvdString byte ?

.code
main proc
mov ecx, stringSize		;load loop count
push OFFSET fwdString
push OFFSET rvdString
call ReverseString
		
main endp

end main