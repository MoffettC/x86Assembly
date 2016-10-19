; File Name :		Chris_Moffett_Week8_Part1.asm
; Description :		Week 7 Part 1
; Author:			Chris Moffett
; Date:				10/10/2016
; Requirements:		The project must include the libraries needed for the C standard I/O library

.386
.model flat,C
.stack 4096

parameterA EQU [ebp+8]
parameterB EQU [ebp+12]
parameterC EQU [ebp+16]

; C library functions
extern printf:PROC

; C calling conventions: 
;   EBP, EBX, ESI, EDI should not be modified in a function call (non-volatile)
;   EAX, ECX, EDX can be modified (volatile)

.data

.code
;-----------------------------------------------------
; Description: Computes a = a + b
; Receives: Offsets to three bytes arrays, size parameter
; Returns: Nothing (result is in the a array)
;-----------------------------------------------------
extendAdd PROC
	; Function prolog
	push	ebp
	mov		ebp, esp
	push	esi
	push	edi

	mov eax, 0
	; Copy the parameter values into some registers
	mov		esi, parameterA		; Pointer to a array
	mov		edi, parameterB		; Pointer to b array
	mov		ecx, parameterC		; Size

	; Do the addition
	clc							; clear the carry bit
L1:
	mov		al, [esi]
	adc		al, [edi]
	mov		[esi], al
	inc		esi					; inc does not affect the carry flag
	inc		edi
	loop	L1

	; Function epilog
	pop		edi
	pop		esi
	mov		esp, ebp
	pop		ebp
	ret
extendAdd ENDP


;-----------------------------------------------------
; Description: Computes a = a - b
; Receives: Offsets to three bytes arrays, size parameter
; Returns: Nothing (result is in the a array)
;-----------------------------------------------------
extendSub PROC
	; Function prolog
	push	ebp
	mov		ebp, esp
	push	esi
	push	edi

	; Copy the parameter values into some registers
	mov		esi, parameterA		; Pointer to a array
	mov		edi, parameterB		; Pointer to b array
	mov		ecx, parameterC		; Size

	; Do the subtraction
	clc							; clear the carry bit
L1:
	mov		al, [esi]
	sbb		al, [edi]
	mov		[esi], al
	inc		esi					; inc does not affect the carry flag
	inc		edi
	loop	L1

	; Function epilog
	pop		edi
	pop		esi
	mov		esp, ebp
	pop		ebp
	ret
extendSub ENDP

;-----------------------------------------------------
; Description: Prints an array as hex digits
; Receives: Offsets to byte arrays, size parameter
; Returns: Nothing
;-----------------------------------------------------
.data
format BYTE "%02x ",0				; Always print 2 digits
.code
displayAsHexInt PROC
	; Function prolog
	push	ebp
	mov		ebp, esp
	push	esi

	; Copy the parameter values into some registers
	mov		esi, parameterA		; Pointer to array
	mov		ecx, parameterB		; Size

	; Have to print in reverse order since little endian
	add		esi, ecx
	dec		esi

	; Print the array values as hex
L1:
	push	ecx					 ; have to save ECX before calling printf
	movzx	eax, BYTE PTR [esi]	 ; zero extend the byte being pointed at
	push	eax
	push	offset format
	call	printf
	add		esp, 2 * TYPE DWORD
	pop		ecx					; restore ecx
	dec		esi
	loop	L1

	; Function epilog
	pop		esi
	mov		esp, ebp
	pop		ebp
	ret
displayAsHexInt ENDP

end