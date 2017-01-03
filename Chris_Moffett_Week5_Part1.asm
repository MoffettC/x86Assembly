; Program Name : CS212_Week5_Part1.asm

; Program Description : Week5 Part1
; Author: Chris Moffett
; Date: 09/22/16

INCLUDE Irvine32.inc

.data
prompt1 BYTE "Please enter the amount of times you would like to add 3 digits",0
prompt2 BYTE "Please enter each digit and press enter", 0
val1 DWORD ?
val2 DWORD ?
val3 DWORD ?

.code
main proc
mov	eax,yellow + (blue * 16) ; Set text color to yellow text on blue background:, taken from previous library
call	SetTextColor
call	Clrscr				; clear the screen
mov	edx,OFFSET prompt1		; User enters loop amount
call	WriteString
call	Crlf				; new line
call	ReadInt				;enter loop amount
mov ecx, eax				;take loop amount and assign it
							
L1:							;loop
	call adder
	loop L1									

exit
main endp

adder PROC					;Procedure to add 3 numbers and display to user
mov	edx,OFFSET prompt2		;Prompt for 3 numbers
call	WriteString
call	Crlf				; new line

call	ReadInt				;1st digit
mov val1, eax	
call	ReadInt				;2nd digit
mov val2, eax	
call	ReadInt				;3rd digit
mov val3, eax		

mov eax, 0					;reset value
add eax, val1				;add all three
add eax, val2
add eax, val3
call WriteInt				;display
call ReadInt
ret
adder ENDP

end main