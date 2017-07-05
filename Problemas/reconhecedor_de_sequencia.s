	.text
        .globl main
main:
	LDR	r8, =0x5
	LDR	r9, =0x4
	LDR	r1, =0xAAAA5555
	LDR	r0, =0
	LDR	r2, =0
	RSB	r7, r9, #32
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
