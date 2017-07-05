.text
.globl main

main:
	MOV	r0, #1
	MOV	r1, #47
	MOV	r13, #8000
	BL	push
	MOV	r0, #2
	LDR	r1, =0x0000AB13
	BL	push
	MOV	r0, #4
	LDR	r1, =0xFD1234DE
	BL	push
	B	fim

fim:
	SWI	0x123456

push:
	CMP	r0, #2
	BMI	push_byte
	BEQ	push_hw
end_push:
	STR	r1, [r13], #4 
	MOV	pc, lr

push_byte:
	MOV	r1, r1, LSL #6
	MOV	r1, r1, LSR #6
	B	end_push

push_hw:
	MOV	r1, r1, LSL #4
	MOV	r1, r1, LSR #4
	B	end_push

