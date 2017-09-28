; Program Name:  Chris_Moffett_Week6_Part1
; Program Description: This module contains reverse string procedure
; Author: Christopher Moffett
; Date:   10/1/2016

.386
.model flat,c

aParam EQU [ebp+8]
bParam EQU [ebp+12]
cParam EQU [ebp+16]

.code
;-----------------------------------------------------
; Description:
; Receives: String
; Returns: Reversed String
;-----------------------------------------------------
ReverseString PROC

	; Function prolog
	push ebp
	mov	ebp, esp

	mov ecx, 0			;zero out loop

	; Compute the result
	mov	eax, aParam		; rvdString offset
	mov	ebx, bParam		; fwdString offset
	mov	ecx, cParam		; loop counter

	L1: push [ebx]		;push value of offset fwdString ref onto stack
	    inc ebx			;inc ref
		loop L1

	mov	ecx, [ebp + 16]	; loop counter

	L2: pop ebx			;pop value onto ebx
		mov [eax], bl	;move value into value of eax ref
		inc eax			;inc eax ref
		loop L2

	; Function epilog
	pop	ebp
	ret	
ReverseString ENDP
END