	.text
        .globl main
main:
	LDR	r0, =0b01010101000111101001101010001011
	LDR	r1, =0
	LDR	r2, =0
	LDR	r3, =31
loop:
	MOV	r4, r0, LSL r2
	MOV	r4, r4, LSR r3
	EOR	r1, r1, r4
	ADD	r2, r2, #1
	CMP	r2, r3
	BLS	loop
	SWI     0x123456
