	.text
        .globl main
main:
        LDR     r0, =0xFFFF0000                 
        LDR     r1, =0x87654321
        BL      firstfunc
        LDR     r2, =0xFFFFFFFF                
        LDR     r3, =0x12345678
	BL	secondfunc
        LDR     r4, =0x67654321                 
        LDR     r5, =0x23110000
	BL	thirdfunc               
        SWI     0x123456                
firstfunc:
        ADDS    r0, r0, r1              
        MOV     pc, lr     
secondfunc:
        ADDS    r2, r2, r3              
        MOV     pc, lr
thirdfunc:
        ADDS    r4, r4, r5              
        MOV     pc, lr
