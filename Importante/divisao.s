	.text
	.global main

main:
	LDR	r1, =7
	LDR	r2, =3
	MOV	r3, =0x0

	MOV		r8, r1
	MOV 	r6, r2

ALIGN_DIVISOR:
	MOVS 	r7, r2, LSR #30
	BNE 	CONTINUE
	MOV 	r2, r2, LSL #1
	B 	ALIGN_DIVISOR

CONTINUE:
	CMP 	r8, r2
	BMI 	ELSE
	SUB 	r8, r8, r2
	MOV 	r3, r3, LSL #1
	ADD 	r3, r3, #1
	B 	THEN

ELSE:
	MOV 	r3, r3, LSL #1
	B 	THEN

THEN:
	MOV 	r2, r2, LSR #1
	CMP 	r8, r6
	BPL 	CONTINUE
	CMP	r2, r6
	BPL	ELSE
FIM:
	MOV	r5, r8
	SWI 	0x123456
