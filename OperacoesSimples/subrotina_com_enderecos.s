.text
.globl main

main:
	MOV	r0, #2
	MOV	r1, #3
	MOV	r2, #4
	MOV	r3, #8000
	MOV	r9, #0
	STMIA	r3, {r0, r1, r2}
	BL	func
	B	fim

fim:
	SWI	0x123456

func:
	LDMIA	r3, {r4, r5, r6}
	MULS    r9, r4, r5
	ADD	r9, r9, r6
	MOV	pc, lr
