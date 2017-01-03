; Program Name:  Chris_Moffett_Week6_Part2
; Program Description: Project for several C procedures
; Author: Christopher Moffett
; Date:   10/1/2016

.386
.model flat,c		; C calling convention
.stack 4096h

INCLUDE Chris_Moffett_Week6_Part2_Include.inc

;includelib mscvrt
;includelib vcruntime
;includelib legacy_stdio_defintions
;includelib ucrt

; Declare the external procedures we will be calling
extern exit:PROC

extern printString:PROC
extern printLine:PROC
extern promptChar:PROC
extern promptInt:PROC
extern promptString:PROC

STDIN EQU 0
STDOUT EQU 1

.data
; Backslash characters are not processed by the assembler prepocessor
; Have to explicitly put in the newline character
msg1	byte "This is a long test string. ",0
msg2	byte "This is a long test string with new line. ",0

.code
main proc
	; Output a string
	push	OFFSET msg1
	call	printString
	add		esp, 4			; Caller responsible for restoring stack

	; Output a string with new line
	push	OFFSET msg2
	call	printLine
	add		esp, 4

	; Display prompt, get single character input
	call	promptChar

	; Display prompt, get integer input
	call	promptInt

	; Display prompt, get string input
	call	promptString

	; Pass a value of 0 to the exit function
    push    0
	call exit
main endp
end main