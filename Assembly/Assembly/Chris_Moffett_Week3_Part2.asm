; Program Name : CS212_Week3_Part2.asm

; Program Description : Week3 Part2
; Author: Chris Moffett
; Date: 09/11/16

.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword

.data
myByte BYTE 10001111b
zeroFlag BYTE ?

.code
main proc

neg myByte				;Convert to positive then mov
movzx ax, myByte		
neg myByte				;Convert back to negative
movsx bx, myByte		

add zeroFlag, 1 
sub zeroFlag, 1			;Set zeroFlag (ZR) thru arithmatic operation

neg myByte				;convert back to positive, set carryFlag (CY)

sub myByte, 150			;Set overFlowFlag (OV)

invoke ExitProcess, 0
main endp
end main