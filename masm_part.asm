; Module Name: template_c_conv.asm
; Description: Short description of what the code in this module does
; Date: Today's date
; Author: Your name

; Usual directives
.model flat,C

.code

;-----------------------------------------------------
; Description: Copies a string with a given length
;   char *copyStringN(char *a, char *b, int c)
; Receives: Pointers to source and destination strings,
;           length of string
; Returns: A pointer to the destination string
;-----------------------------------------------------
masmProc PROC

	mov	eax, 1
	ret

masmProc ENDP

END