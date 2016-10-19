; Program Name:  Chris_Moffett_Week6_Part2
; Program Description: This module for several C procedures
; Author: Christopher Moffett
; Date:   10/1/2016

.386
.model flat,c

extern printf:PROC			; C convention
extern getchar:PROC
extern putchar:PROC
extern scanf:PROC
extern exit:PROC

.data
nl			 dword 0ah		; new line character
cr			 dword 0dh		; carriage

promChar	 byte "Please input a single character: ",0
promInt	     byte "Please input a digit: ",0
promStr		 byte "Please input a string: ",0

inputChar	 dword ?
inputInt	 dword 0
inputStr	 byte ?
scanFormat	 byte "%d",0
scanString	 byte "%s",0

.code
printString PROC
	; Function prolog
	push	ebp
	mov		ebp, esp

	mov		eax, [EBP + 8] 
	push	eax				;push eax to c function
	call	printf			;display

	; Function epilog
	pop		eax				;popping off unneeded values off stack
	pop		ebp				;pop original ebp back into ebp
	ret	
printString ENDP

printLine PROC
	; Function prolog
	push	ebp
	mov		ebp, esp

	mov		eax, [EBP + 8]
	push	eax
	call	printf			;display
	push	nl
	call	putchar			;putchar(int ch)

	; Function epilog
	pop		eax				;popping off unneeded values off stack
	pop		eax				
	pop		ebp				;pop original ebp back into ebp
	ret	
printLine ENDP

promptChar PROC
	; Function prolog
	push	ebp
	mov		ebp, esp

	push	OFFSET promChar		;display prompt
	call	printf
	call	getchar				; Value returned in EAX
	mov		inputChar, eax		; EAX can be affected by other procedures, saves value into inputChar

	; Function epilog
	pop		eax					;popping off unneeded values off stack
	pop		ebp					;pop original ebp back into ebp
	ret	
promptChar ENDP

promptInt PROC
	; Function prolog
	push	ebp
	mov		ebp, esp

	push	OFFSET promInt		;display prompt
	call	printf
	push	OFFSET inputInt
	push	OFFSET scanFormat
	call	scanf
	mov eax, inputInt			;move value into eax register

	; Function epilog
	pop		eax					;popping off unneeded values off stack
	pop		eax					
	pop		eax
	pop		ebp					;pop original ebp back into ebp
	ret	
promptInt ENDP

promptString PROC
	; Function prolog
	push	ebp
	mov		ebp, esp

	push	OFFSET promStr		;display prompt
	call	printf
	push	OFFSET inputStr
	push	OFFSET scanString
	call	scanf
	mov		eax, inputInt		;move value into eax register

	; Function epilog
	pop		eax					;popping off unneeded values off stack
	pop		eax					
	pop		eax
	pop		ebp					;pop original ebp back into ebp
	ret	
promptString ENDP

end