; File Name :		Chris_Moffett_Week7_Part2.asm
; Description :		Week 7 Part 2
; Author:			Chris Moffett
; Date:				10/9/2016
; Requirements:		The project must include the libraries needed for the C standard I/O library

; We only need to define the .model, other items are defaulted from the project
.model flat,C

; C library functions
extern printf:PROC
extern putchar:PROC

.code
;-----------------------------------------------------
; Description:
;	Compares 3 numbers
; Receives: Three signed 32-bit ints
; Returns: Logic results
;-----------------------------------------------------
.data
exp1 BYTE "a is greater than b, b is greater than c",10,0
exp2 BYTE "a is less than b, b is less than c",10,0
exp3 BYTE "either a or b is zero",10,0
exp4 BYTE "either a equals b or b equals c. None are zero",10,0
exp5 BYTE "unexpected edge case?",10,0

.code
compoundExp PROC
	; Function prolog
	push	ebp
	mov		ebp, esp

	mov		eax, [ebp+8]	; a		Do zero checks first
	cmp		eax, 0			; 0
	je		equalsZero
	mov		eax, [ebp+12]	; b
	cmp		eax, 0			; 0
	je		equalsZero

	mov		eax, [ebp+8]	; a
	cmp		eax, [ebp+12]	; b
	jg		ifGreater		; Check a is b greater than
	jl		ifLess			; Check a is b less than
	je		finalCase		; Check if a and b are equal (final case)

ifGreater:
	mov		eax, [ebp+12]	; b
	cmp		eax, [ebp+16]	; c
	jg		greaterThan		; Check b is c greater than
	je		finalCase		; Check if b and c are equal (final case)
	jl		edgeCase		; for edge cases

ifLess:
	mov		eax, [ebp+12]	; b
	cmp		eax, [ebp+16]	; c
	jl		lessThan		; Check b is c less than
	je		finalCase		; Check if b and c are equal (final case)
	jg		edgeCase		; for edge cases

equalsZero:
	push	offset exp3
	call	printf
	add		esp, 4
	jmp		compoundExpExit

greaterThan:
	push	offset exp1
	call	printf
	add		esp, 4
	jmp		compoundExpExit

lessThan:
	push	offset exp2
	call	printf
	add		esp, 4
	jmp		compoundExpExit

finalCase:
	push	offset exp4
	call	printf
	add		esp, 4
	jmp		compoundExpExit

edgeCase:
	push	offset exp5
	call	printf
	add		esp, 4

compoundExpExit:
	; Function epilog
	mov		esp, ebp
	pop		ebp
	ret
compoundExp ENDP

end