; Program Name:  Chris_Moffett_Week6_Part1
; Program Description: Reverse string with modules
; Author: Christopher Moffett
; Date:   10/1/2016

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
extern exit:PROC

.data
fwdString byte "A super calloused fragile mystic hexed by halitosis",0
stringSize = ($ - fwdString) - 1
rvdString byte ?

.code
main proc

	mov  ecx, stringSize
	push ecx				;push loop counter on stack so module can pop it (unnecessary argument?)
	push OFFSET fwdString	;push offsets
	push OFFSET rvdString

	call ReverseString
	add	 esp, 12			;inc stack pointer

	call exit
main endp
end main