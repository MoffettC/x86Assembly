; File Name :		Chris_Moffett_Week7_Part1.asm
; Description :		Week 7 Part 1
; Author:			Chris Moffett
; Date:				10/4/2016
; Requirements:		The project must include the libraries needed for the C standard I/O library

; We only need to define the .model, other items are defaulted from the project
.model flat,C

; C library functions
extern printf:PROC
extern putchar:PROC
extern rand:PROC

; Defined in the C module
extern generateColor:PROC
extern printTheNumber:PROC


;-----------------------------------------------------
; Description: Generates twenty random numbers between 0 and 32767
; Receives: Nothing
; Returns: Nothing
;-----------------------------------------------------
.data
randMsg BYTE "Random numbers:",10,0
randFormat BYTE "%d ",0

.code
randomColor PROC 
	; Function prolog
	push	ebp
	mov		ebp, esp

	; Print info
	push	offset randMsg
	call	printf
	add		esp, TYPE DWORD
	
	mov		ecx, 20			; Compute and print twenty random numbers
L1:
	push	ecx				; volatile register (C calling conventions)
	call	rand			; random number generator
	push	eax
	call	generateColor	; generates color based on random number
	push	offset randFormat
	call	printf

	push	10				; newline
	call	putchar
	add		esp, 4

	add		esp, 2 * TYPE DWORD
	pop		ecx
	loop	L1				; loop

	; Function epilog
	mov		esp, ebp
	pop		ebp
	ret
randomColor ENDP
 
END