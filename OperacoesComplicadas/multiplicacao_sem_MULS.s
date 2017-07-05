	.text
        .globl main
main:
	LDR	r0, =-2
	LDR	r1, =-4
	LDR	r4, =0
	ADD	r4, r4, r0, LSR #31
	ADD	r4, r4, r1, LSR #31

	MOVS	r0, r0
	RSBMI	r0, r0, #0
	MOVS	r1, r1
	RSBMI	r1, r1, #0

	UMULL	r2, r3, r1, r0
	
	CMP	r4, #1
	BNE	fim	
 	
	MVN	r2, r2
	MVN	r3, r3
	ADDS	r3, r3, #1
	ADDCS	r2, r2, #1
fim:
	SWI     0x123456
