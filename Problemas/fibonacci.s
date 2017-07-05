	.text
        .globl main
main:
	LDR 	r0, =0x4000
	LDR	r1, =0
	LDR	r2, =1
	LDR	r4, =11
	LDR	r5, =0
	STRB	r1, [r0], #1
	STRB	r2, [r0], #1
loop:
	ADD	r3, r2, r1
	STRB	r3, [r0], #1
	MOV	r1, r2
	MOV	r2, r3
	
	ADD     r5, r5, #1
    	CMP     r5, r4
   	BNE 	loop  
	SWI     0x123456
