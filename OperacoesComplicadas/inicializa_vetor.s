	.text
        .globl main
main:
	ADR 	r1, a
	LDR	r2, =8
	LDR	r3, =0
	LDR	r4, =0
loop:
	STR	r4, [r1], #4

	ADD     r3, r3, #1
    	CMP     r3, r2
   	BNE 	loop  
	SWI     0x123456

a: 
	.word
