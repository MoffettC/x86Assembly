; Module Name: macro_examples.asm
; Description: Macro for calling C functions
; Date: 10/30/2016
; Author: Chris Moffett

; These libraries are needed for the C library functions.
; Could also add them to the linker Additional Dependencies line
INCLUDELIB msvcrtd
INCLUDELIB legacy_stdio_definitions
INCLUDELIB ucrtd

; Usual directives
.386
.model flat,C
.stack 4096

; Declare some standard C functions externals
extern printf:PROC
extern exit:PROC

; C calling conventions: 
;       EBP, EBX, ESI, EDI should not be modified in a function call (non-volatile)
;       EAX, ECX, EDX can be modified (volatile)

;----------------------------------------------------
; MACROS
;----------------------------------------------------

;-----------------------------------------------------
; Description: Replaces "\n" with cr,lf
; Receives: Pointer to string in ESI
; Returns: Updated string
;-----------------------------------------------------
mBackslashN MACRO
	LOCAL L1, L2, Next

	;; The string is scanned, "\n" is replaced with cr,lf
	;; Scanning continues until null terminating character is found
	push	esi
L1:
	cmp		BYTE PTR [esi], 0
	je		L2
	cmp		BYTE PTR [esi], '\'
	jne		Next
	cmp		BYTE PTR [esi+1], 'n'
	jne		Next
	;; OK found \n
	mov		BYTE PTR [esi], 0Ah
	mov		BYTE PTR [esi+1], 0Dh
	add		esi, 2
	jmp		L1

Next:
	inc		esi
	jmp		L1

L2:
	;; At this point, the string has been modified if "\n" was found
	pop		esi
ENDM


mCallC MACRO command, formatStr, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10
	LOCAL string, TheExit
	extern command:PROC		;converts param into external command

	.data
	string DWORD formatStr	;saves string into local param

	.code
	pushad		;; Save all registers

	;; Replace the "\n" substrings with cr,lf
	mov		esi, string
	mBackslashN

	;; Push up to ten parameters to use when calling printf
	IFNB	<p10>
		push	p10
	ENDIF
	IFNB	<p9>
		push	p9
	ENDIF
	IFNB	<p8>
		push	p8
	ENDIF
	IFNB	<p7>
		push	p7
	ENDIF
	IFNB	<p6>
		push	p6
	ENDIF
	IFNB	<p5>
		push	p5
	ENDIF
	IFNB	<p4>
		push	p4
	ENDIF
	IFNB	<p3>
		push	p3
	ENDIF
	IFNB	<p2>
		push	p2
	ENDIF
	IFNB	<p1>
		push	p1
	ENDIF

	;; Now call printf with offset of string
	push	string
	call	command	

	;; Now restore stack based on how many parameters were pushed
	IFNB	<p10>
		add		esp, 11 * TYPE DWORD
		jmp		TheExit
	ENDIF
	IFNB	<p9>
		add		esp, 10 * TYPE DWORD
		jmp		TheExit
	ENDIF
	IFNB	<p8>
		add		esp, 9 * TYPE DWORD
		jmp		TheExit
	ENDIF
	IFNB	<p7>
		add		esp, 8 * TYPE DWORD
		jmp		TheExit
	ENDIF
	IFNB	<p6>
		add		esp, 7 * TYPE DWORD
		jmp		TheExit
	ENDIF
	IFNB	<p5>
		add		esp, 6 * TYPE DWORD
		jmp		TheExit
	ENDIF
	IFNB	<p4>
		add		esp, 5 * TYPE DWORD
		jmp		TheExit
	ENDIF
	IFNB	<p3>
		add		esp, 4 * TYPE DWORD
		jmp		TheExit
	ENDIF
	IFNB	<p2>
		add		esp, 3 * TYPE DWORD
		jmp		TheExit
	ENDIF
	IFNB	<p1>
		add		esp, 2 * TYPE DWORD
		jmp		TheExit
	ENDIF
	add		esp, 1 * TYPE DWORD

TheExit:
	popad
ENDM

;----------------------
lf EQU 0Ah
.data
format BYTE "The integer is %d %c", 0

.code
main PROC
	mCallC printf, OFFSET format, 20, lf

	;exit(0);
	push	0
	call	exit
main ENDP

END main

; You can use the following symbolic constants to make
; accessing parameters easier
IFNDEF paramaterA
parameterA EQU [ebp+8]
parameterB EQU [ebp+12]
parameterC EQU [ebp+16]
parameterD EQU [ebp+20]
parameterE EQU [ebp+24]
parameterF EQU [ebp+28]
parameterG EQU [ebp+32]
ENDIF