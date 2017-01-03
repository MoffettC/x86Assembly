; Program Name : CS212_Week5_EC.asm

; Program Description : Week5 EC
; Author: Chris Moffett
; Date: 09/22/16

INCLUDE Irvine32.inc

.data
prompt1 BYTE "First 50 Fibonacci Numbers",0
val1 DWORD 0
val2 DWORD 1
nextFib DWORD 0
nArray DWORD 50 DUP(0)

.code
main proc
mov		eax,yellow + (blue * 16)	; Set text color to yellow text on blue background:, taken from previous library
call	SetTextColor
call	Clrscr					; clear the screen
mov		edx,OFFSET prompt1		
call	WriteString
call	Crlf				

mov ecx, SIZEOF nArray		;loop counter
mov edx, 0					;zero out

mov ebx, 0					;0 index			
mov edx, val1		
mov nArray[ebx], edx		;mov 0 into 0 index

add ebx, 4					;inc index
mov edx, val2
mov nArray[ebx], edx		;mov 1 into 1 index
mov ebx, 0					;reset index to beginning

L1:							
	mov edx, 0				;reset fib counter

	add edx,  nArray[ebx]
	add ebx, 4				;inc index

	add edx,  nArray[ebx]
	add ebx, 4				;inc index

	mov nArray[ebx], edx
	mov eax, nArray[ebx]
	call WriteDec			;display
	sub ebx, 4				;subtracts index by 1 so next fibonacci calc is correct

	call	Crlf				
	loop L1									
call ReadInt				;hit a key to move on

exit
main endp
end main