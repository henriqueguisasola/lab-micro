	.text
        .globl main
main:
	LDR	r2, =0
	LDR	r3, =1
	LDR	r1, =10
	LDR	r5, =1
loop:
	ADD	r4, r3, r2
	MOV	r2, r3
	MOV	r3, r4
	
	ADD     r5, r5, #1
    	CMP     r5, r1
   	BNE 	loop
	MOV	r0, r3  
	SWI     0x123456
