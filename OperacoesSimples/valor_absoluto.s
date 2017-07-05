	.text
        .globl main
main:
	LDR	r0, =0xFFFFFFFB
	MOVS	r0, r0
	RSBMI	r1, r0, #0                         
        SWI     0x123456
