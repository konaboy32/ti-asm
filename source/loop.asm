.nolist
#include "ti83plus.inc"
.list
.org $9d93
	.db 	t2bytetok, tasmcmp

	; clear screen and init
	B_CALL(_ClrLCD)
	ld		a, 0
	ld		(curRow), a
	ld		(curCol), a
	ld		b, 0
	
	; increment b, display label and print value of b
myloop:
	
	; display label
	ld		hl, mylabel
	B_CALL(_PutS)		
	inc		b
	ld 		h, 0
	
	; display counter
	ld 		l, b
	B_CALL(_DispHL)
    B_CALL(_NewLine)
	
	; display keypressed
	B_CALL(_GetKey)
	ld 		h, 0
	ld		l, a
	push	hl
	ld 		hl, keypressed
	B_CALL(_PutS)
	pop		hl
	B_CALL(_DispHL)
	B_CALL(_NewLine)
	
	jr		myloop
	
mylabel:
	.db 	"The answer:", 0
	
keypressed:
	.db 	"Key:", 0
.end