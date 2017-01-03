; File Name :		Chris_Moffett_Week9_Part1.asm
; Description :		Week 9 Part 1
; Author:			Chris Moffett
; Date:				10/18/2016
; Requirements:		The project must include the libraries needed for the C standard I/O library

.386
.model flat,C
.stack 4096 

; C library functions
extern printf:PROC
extern putchar:PROC

.data

.code