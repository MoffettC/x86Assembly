; Module Name: macro_examples.asm
; Description: Masm Example
; Date: 12/5/2016
; Author: Chris Moffett

; Usual directives
.386
.model flat,C
.stack 4096

; Declare some standard C functions externals
extern printf:PROC
extern exit:PROC

; These libraries are needed for the C library functions.
; Could also add them to the linker Additional Dependencies line
INCLUDELIB msvcrtd
INCLUDELIB legacy_stdio_definitions
INCLUDELIB ucrtd

; C calling conventions: 
;       EBP, EBX, ESI, EDI should not be modified in a function call (non-volatile)
;       EAX, ECX, EDX can be modified (volatile)
;----------------------

.data
format BYTE "%c ", 0
nums BYTE 0,1,2,3,4,5,6,7,8,9
nullByte BYTE 0

;-----------------------------------------------------
; Description: Copies a string with a given length
;   char *copyStringN(char *a, char *b, int c)
; Receives: Pointers to source and destination strings,
;           length of string
; Returns: A pointer to the destination string
;-----------------------------------------------------
.code
main PROC
	mov		ebx, OFFSET nums
	mov		ecx, LENGTHOF nums
	mov		edx, 0

L0:
	push	ecx
	mov		dl, [ebx]
	add		dl, 48

	push	edx
	push	OFFSET format
	call	printf
	add		esp, 2*DWORD

	inc		ebx
	pop		ecx
	loop	 L0

	push	0
	call	exit
main ENDP

END main
