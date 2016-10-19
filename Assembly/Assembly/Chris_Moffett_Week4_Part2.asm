; Program Name : CS212_Week4_Part2.asm

; Program Description : Week4 Part2
; Author: Chris Moffett
; Date: 09/17/16

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
valueB BYTE  1,2,3,-1,-2,-3
valueD DWORD 6,5,4, 3, 2, 1
result DWORD LENGTHOF valueD dup(0)

.code
main proc
mov ecx, SIZEOF valueB						;loop counter
mov esi, 0	
mov ebx, -2									;double check -2 value

L1:
	movsx eax, valueB[esi *TYPE valueB]		;move first value w/sign extension
	add eax, valueD[esi *TYPE valueD]		;add second to first value
	mov result[esi *TYPE result], eax		;move result to result array
	inc esi
	loop L1									



invoke ExitProcess, 0
main endp
end main