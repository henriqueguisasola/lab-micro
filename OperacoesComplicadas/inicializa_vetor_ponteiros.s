	.text
        .globl main
main:
	ADR 	r3, a
	LDR	r2, =8
	LDR	r4, =0
	ADD	r5, r3, r2, LSL #2 
loop:
	STR	r4, [r3], #4

    	CMP     r3, r5
   	BNE 	loop  
	SWI     0x123456

a: 
	.word   
