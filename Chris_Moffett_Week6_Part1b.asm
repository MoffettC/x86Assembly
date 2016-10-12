; Program Name:  Chris_Moffett_Week6_Part1
; Program Description: This module contains reverse string procedure
; Author: Christopher Moffett
; Date:   9/28/2016

.386
.model flat,c

.code

;-----------------------------------------------------
; Description:
; Receives: String
; Returns: Reversed String
;-----------------------------------------------------
ReverseString PROC
	; Function prolog
	push	ebp
	mov		ebp, esp

	; Compute the result
	mov		esi, 0
	mov		eax, [ebp + 8]		; rvdString offset
	mov		ebx, [ebp + 12]		; fwdString offset


	; Function epilog
	pop		ebp
	ret		12		; Three 32-bit items on stack
ReverseString ENDP

END