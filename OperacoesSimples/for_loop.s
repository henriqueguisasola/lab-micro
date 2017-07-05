	.text
        .globl main
main:
	ADR 	r0, b
	LDR	r1, =0x4000
	LDR	r3, =0
	ADD	r0, r0, #28
loop:
	LDR 	r4, [r0]
	STR	r4, [r1], #4
	SUB	r0, r0, #4
	ADD	r3, r3, #1
	CMP	r3, #8
	BNE	loop
	SWI     0x123456

b: 
	.word   0, 1, 2, 3, 4, 5, 6, 7
