	.text
        .globl main
main:
	MOV	r6, #0xA
	MOV	r4, r6
loop:
	SUBS	r4, r4, #1
	MULNE	r5, r6, r4
	MOVNE	r6, r5
	BNE	loop
	SWI     0x123456
