.NOLIST
#define   EQU   .equ
#define   equ   .equ
#define   END   .end
#define   end   .end
#include "ti83plus.inc"
.LIST

     .org 9D93h
     .db $BB,$6D
      B_CALL(_ClrLCDFull)
     ret

end