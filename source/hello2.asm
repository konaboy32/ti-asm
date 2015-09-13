.nolist
#include "ti83plus.inc"
.list
.org $9D93
	.db 	t2ByteTok,tasmCmp

	; clear screen and init
	bcall(_ClrLCD)
	ld		a,$00
	ld		(curRow), a
	ld		(curCol), a
	
	; display hello world
	ld		hl, my_label
	bcall(_PutS)
    bcall(_NewLine)
	
	; Solve the problem 32 + 20
	ld 		a, 30
	add 	a, 27
	ld 		h, 0
	ld 		l, a
	bcall(_DispHL)
	
	; Display 'I' at location (6, 8).
	LD     A, 6
    LD     (CurRow), A    ; Set row 3
    LD     A, 8
    LD     (CurCol), A    ; Set column 4
    LD     A, 'G'         ; Use a character constant instead of
    b_call(_PutC)        ; giving a cryptic ASCII code.

	;Display 33 at location (1, 7) with different coordinate setup.
	LD     HL, 1*256+7    ; Could also be $0403
    LD     (CurRow), HL   ; Set coordinates
    LD     A, 65
    b_call(_PutC)
	ret
	
my_label:
	.db 	"The answer is:",$00
.end