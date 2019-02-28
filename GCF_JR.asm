INCLUDE Irvine32.inc

.data
dividend byte 0
divisor byte 0
prompt1 byte "Enter the divident: ",0
prompt2 byte "Enter the divisor: ",0
division byte 0
remainder byte 0
output byte "GCF: ",0

.code
main PROC
		call getInput	;Get the dividend and divisor

		MOV EAX,0		;Clear register
		MOV AH,dividend
		MOV AL,divisor
		call getRemainder ;Get the remaider of the two values

		call findGCF   ;Find Greaters common factor.

		call print
exit
main ENDP

getInput PROC
	;Prompt user for the dividend
	MOV EDX,offset prompt1
	call writestring
	
	;Read dividend
	call readDec
	MOV dividend,AL

	;Prompt user for the divisor
	MOV EDX,offset prompt2
	call writestring

	;Read divisor.
	call readDec
	MOV divisor,Al

ret
getInput ENDP

getRemainder PROC 
 
; Find Remainder
.while(AH >= AL)  ;While dividend is greater than or equal to divisor
	SUB AH, AL
.endw
	MOV remainder,AH 

	MOV dividend,AH 
	MOV divisor,AL 
ret
getRemainder ENDP

findGCF PROC

	.If(remainder > 0)
		;Remainder should go to the divisor
		MOV AL,remainder
		MOV AH,divisor
		call getRemainder

		;The divisor should go to the dividend 
		call findGCF
	.endif
ret
findGCF endp

print PROC
MOV EAX,0      ;Clear Register
MOV EDX, offset output  ;Create pointer.
	
	call writestring
	MOV AL,divisor

	call writedec
	call crlf
ret
print ENDP
end main