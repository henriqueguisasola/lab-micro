	.text
        .globl main
main:
	LDR 	r1, =12
	ADR 	r2, array
	LDR 	r3, [r2, #20]
	ADD 	r0, r1, r3
	STR	r0, [r2, #40]
	SWI     0x123456

array: 
	.word   0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24
