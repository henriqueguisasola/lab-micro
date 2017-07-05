	.text
        .globl main
main:
	LDR	r7, =28
	LDR	r8, =0b1011
	LDR	r1, =0b10111101000111101001101110001011
	LDR	r0, =0
	LDR	r2, =0
loop:
	MOV	r6, r1, LSL r0
	MOV	r6, r6, LSR r7
	CMP	r6, r8
	ADDEQ	r2, r2, #1
	MOV	r2, r2, LSL #1
	ADD	r0, r0, #1
	CMP	r0, r7
	BLS	loop
	MOV	r2, r2, LSR #1
	SWI     0x123456
