.text
.globl main

main:
	MOV	r0, #2
	MOV	r1, #3
	MOV	r2, #4
	MOV	r9, #0
	BL	func
	B	fim

fim:
	SWI	0x123456

func:
	MULS    r9, r0, r1
	ADD	r9, r9, r2
	MOV	pc, lr
