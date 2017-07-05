.text
.globl main

main:
	MOV	r0, #4	@ variavel d
	MOV	r1, #3	@ variavel c
	MOV	r2, #2	@ variavel b
	MOV	r13, #8000
	STMEA	r13!, {r0-r2}
	BL	mul
	BL	add
	B	fim

fim:
	SWI	0x123456

add:
	LDMEA	r13!, {r4, r5}
	ADD	r6, r4, r5
	STMEA	r13!, {r6}
	MOV	pc, lr

mul:
	LDMEA	r13!, {r4, r5}
	MULS	r6, r4, r5
	STMEA	r13!, {r6}
	MOV	pc, lr
