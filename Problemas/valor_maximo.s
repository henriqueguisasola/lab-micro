	.text
        .globl main
main:
	ADR 	r0, b
	LDR	r5, =12
	LDR	r3, =0x5000
	LDR	r1, =0
	LDR	r2, =0
loop:
	LDR 	r4, [r0], #4
	CMP	r1, r4
	MOVMI	r1, r4
	ADDS	r2, r2, #1
	CMP	r5, r2
	BNE	loop
	STR	r1, [r3]
	SWI     0x123456

b: 
	.word   0, 87, 47, 7, 37, 11, 22, 97, 4, 53, 24, 12
