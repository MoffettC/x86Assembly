; File Name :		Chris_Moffett_Week8_Part1.asm
; Description :		Week 8 Part 1
; Author:			Chris Moffett
; Date:				10/17/2016
; Requirements:		The project must include the libraries needed for the C standard I/O library

.386
.model flat,C
.stack 4096 

; C library functions
extern printf:PROC
extern putchar:PROC

.data
op1 BYTE 10h, 10h, 10h, 5h ; 5101010h
op2 BYTE 8,8,8,4           ; 4080808h
op1b BYTE 10h, 10h, 10h, 5h ; 5101010h
op2b BYTE 8,8,8,4           ; 4080808h
op3 BYTE 20h, 20h, 20h, 20h, 20h, 20h, 10h     ;10202020202020h
op4 BYTE 30h, 30h, 30h, 30h, 30h, 30h, 5       ; 5303030303030h
result BYTE 7 DUP(?) 
result2 BYTE 7 DUP(?) 
format BYTE "%x ", 0
.code
normalMath PROC
;----------------------PART 1 Normal Arithmetic----------------------------------------
; Function prolog
	push	ebp
	mov		ebp, esp
	mov		esi, 0				;reset registers

	shl		op1[esi + 3], 2		;multiplying op1 array by 4
	rcl		op1[esi + 2], 2
	rcl		op1[esi + 1], 2
	rcl		op1[esi], 2

	mov		ecx, 4
L0:							
	mov		al, op1[esi]		
	add		al, op2[esi]		;adding op2 to op1 array, regular add
	shr		al, 1				;dividing by 2
	mov		result[esi], al		;mov new value back into results
	inc		esi
	loop	L0

;-------The rest of code prints out array----------
	mov		ecx, 4
	mov		esi, 3
PrintArray:
	push	ecx
	movsx	eax, result[esi]  
	push	eax                
	push	offset format
    call	printf               ; call the printf command
	dec		esi

    add		esp, 2 * TYPE DWORD
	pop		ecx
    loop	PrintArray

	push	10					; newline
	call	putchar
	add		esp, 4

	; Function epilog
	mov		esp, ebp
	pop		ebp
	ret
normalMath ENDP

extendMath PROC
;----------------------PART 1 Extended Arithmetic----------------------------------------
	; Function prolog
	push	ebp
	mov		ebp, esp
	mov		esi, 0

	shl		op1b[esi + 3], 2		;multiplying op1 array by 4
	rcl		op1b[esi + 2], 2
	rcl		op1b[esi + 1], 2
	rcl		op1b[esi], 2

	mov		ecx, 4
L1:							
	mov		al, op1b[esi]		
	adc		al, op2b[esi]		;adding op2 to op1 array, extended math call
	shr		al, 1				;dividing by 2
	mov		result[esi], al
	inc		esi
	loop	L1

;-------The rest of code prints out array----------
	mov		ecx, 4
	mov		esi, 3
PrintArray2:
	push	ecx
	movsx	eax, result[esi]  
	push	eax                
	push	offset format
    call	printf              ; call the printf command
	dec		esi

    add		esp, 2 * TYPE DWORD
	pop		ecx
    loop	PrintArray2

	push	10					; newline
	call	putchar
	add		esp, 4

	; Function epilog
	mov		esp, ebp
	pop		ebp
	ret
extendMath ENDP

extendMath2 PROC
;----------------------PART 2----------------------------------------
	; Function prolog
	push	ebp
	mov		ebp, esp
	mov		esi, 0
	mov		edx, 0

	shl		op3[esi + 6], 2		;multiplying op3 array by 4
	rcl		op3[esi + 5], 2
	rcl		op3[esi + 4], 2
	rcl		op3[esi + 3], 2
	rcl		op3[esi + 2], 2
	rcl		op3[esi + 1], 2
	rcl		op3[esi], 2

	mov		ecx, 7				;reset counter
L2:					
	mov		al, op3[esi]		
	adc		al, op4[esi]		;adding op4 to op3 array
	mov		op3[esi], al
	inc		esi
	loop	L2

								
	mov		ecx, 7				;reset registers
	mov		esi, 6				;start at highest byte value
	mov		eax, 0
L3:								;divide array by 2 loop
	mov		dl, 0
	mov	    al, op3[esi]		;mov byte into register
	mov		bl, 2				
	div		bl					;division by 2
	mov		result2[esi], al	;mov new value back into results
	dec		esi					;mov to next smaller byte
	loop	L3

;-------The rest of code prints out array----------
	mov		ecx, 7
	mov		esi, 6
PrintArray3:
	push	ecx
	mov		al, result2[esi]  
	push	eax                
	push	offset format
    call	printf              ; call the printf command
	dec		esi

    add		esp, 2 * TYPE DWORD
	pop		ecx
    loop	PrintArray3

	push	10					; newline
	call	putchar
	add		esp, 4

	; Function epilog
	mov		esp, ebp
	pop		ebp
	ret
extendMath2 ENDP

END