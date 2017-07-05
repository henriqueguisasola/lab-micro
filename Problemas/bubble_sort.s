.text
.globl main

entrada:
	.byte	8
	.byte	32
	.byte	97
	.byte	13
	.byte	25

	.align	2

palavras:
	.space	200

main:
	LDR	r0, =entrada
	LDR	r1, =palavras
	MOV	r2, #5
	MOV	r8, r2

	BL	monta_palavras
	LDR	r1, =palavras
	BL	ordena_palavras
	LDR	r0, =entrada
	LDR	r1, =palavras
	BL	monta_saida
fim:
	SWI	0x123456

ordena_palavras:
	SUBS	r8, r8, #1
	MOVEQ	pc, lr
	MOV	r9, r1
	MOV	r5, r8
compara_e_troca:
	LDMIA	r9, {r3, r4}
	CMP	r3, r4
	STRGT	r4, [r9]
	STRGT	r3, [r9, #4]
	ADD	r9, r9, #4
	SUBS	r5, r5, #1
	BNE	compara_e_troca
	B	ordena_palavras

monta_palavras:
	MOV	r6, #0
monta_palavras_loop:
	CMP	r6, r2
	MOVGE	pc, lr
	LDRB	r4, [r0]
	STR	r4, [r1]
	ADD	r0, r0, #1
	ADD	r1, r1, #4
	ADD	r6, r6, #1
	B	monta_palavras_loop
monta_saida:
	MOV	r6, #0
monta_saida_loop:
	CMP	r6, r2
	MOVGE	pc, lr
	LDR	r4, [r1]
	STRB	r4, [r0]
	ADD	r0, r0, #1
	ADD	r1, r1, #4
	ADD	r6, r6, #1
	B	monta_saida_loop
