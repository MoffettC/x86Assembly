; Module Name: Chris_Moffett_Week15_Nasm.asm
; Description: Nasm Example
; Date: 12/5/2016
; Author: Chris Moffett

BITS 32 ; Tell NASM we're using 32-bit protected mode.

extern _masmProc    ; Have to prepend _ to names of external functions for Windows
extern _printf
extern _exit

GLOBAL _main   ; Tells the linker about the label called _main

SECTION .data  ; Initialized Data Section
format db "%c ", 0
nums db 0,1,2,3,4,5,6,7,8,9
nullByte db 0

SECTION .text ; Says that this is the start of the code section.

_main:

	call _masmProc

	mov		ebx, nums
	mov		ecx, 10
	mov		edx, 0

.L0
	push	ecx
	mov		dl, [ebx]
	add		dl, 48

	push	edx
	push	format
	call	_printf
	add		esp, 8

	inc		ebx
	pop		ecx
	jb	 .L0

mov eax, 0
ret			; Return 