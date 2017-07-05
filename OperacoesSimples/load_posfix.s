	.text
        .globl main
main:
	LDR 	r1, =5
	ADR 	r2, array
	LDR 	r3, [r2], #20
	LDR		r4, [r2]
	ADD 	r0, r1, r4
	SWI     0x123456

array:
	.word   0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24
