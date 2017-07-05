	.text
        .globl main
main:
	LDR 	r4, =5
	ADR 	r1, a
	ADR	r2, b
	LDR	r3, =0
loop:
	LDR 	r5, [r2], #4
	ADD 	r6, r4, r5
	STR	r6, [r1], #4

	ADD     r3, r3, #1
    	CMP     r3, #11
   	BNE 	loop  
	SWI     0x123456

b: 
	.word   0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
a: 
	.word   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
