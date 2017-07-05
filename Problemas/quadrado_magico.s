	.text
        .globl main
main:
	LDR	r9, =1
	ADR 	r0, matrix
	LDR	r1, =4 @ N
	MUL	r10, r1, r1 @ N^2
	ADD	r10, r10, #1 @ N^2 + 1
	MUL 	r2, r10, r1 @ N(N^2 + 1)
	MOV	r2, r2, LSR #1
	LDR	r3, =0 @ Contador cada linha / coluna
	LDR	r4, =0 @ Soma da linha / coluna
	LDR 	r8, =0 @ Contador todas as linhas / colunas
	MOV 	r7, r0 @ Guardar a Posição Inicial do array
	ADD 	r6, r1, #1
	BL	soma_diagonal_principal
	B	soma_todas_as_linhas

fim:
	SWI     0x123456


soma_todas_as_colunas:
	BL 	soma_coluna
	ADD 	r8, r8, #1
	ADD	r0, r0, r8
	CMP	r8, r1
	BNE	soma_todas_as_colunas
	MOV	r0, r7 @ retorna o endereço inicial do array para a posiçao inicial
	SUB 	r6, r1, #1
	B	soma_diagonal_secundaria

soma_todas_as_linhas:
	BL 	soma_linha
	ADD 	r8, r8, #1
	CMP	r8, r1
	BNE	soma_todas_as_linhas
	MOV	r0, r7 @ retorna o endereço inicial do array para a posiçao inicial
	MOV	r8, #0
	B	soma_todas_as_colunas


soma_linha:
	#r0 é a possição do primeiro elemento da linha a ser somada
	LDRB	r5, [r0], #1
	ADD	r4, r4, r5
	ADD 	r3, r3, #1
	CMP	r3, r1
	BNE 	soma_linha
	CMP 	r4, r2
	BNE	set_not_magic
	MOV	r3, #0 @ Zera variáveis de controle
	MOV	r4, #0
	MOV	pc, lr

soma_coluna:
#r0 é a possição do primeiro elemento da coluna a ser somada
	LDRB	r5, [r0], r1
	ADD	r4, r4, r5
	ADD 	r3, r3, #1
	CMP	r3, r1
	BNE 	soma_coluna
	CMP 	r4, r2
	BNE	set_not_magic
	MOV	r3, #0 @ Zera variáveis de controle
	MOV	r4, #0
	MOV	r0, r7 @ retorna o endereço inicial do array para a posiçao inicial
	MOV	pc, lr

soma_diagonal_principal:
@r0 é a possição do primeiro elemento da matriz
	LDRB	r5, [r0], r6
	ADD	r4, r4, r5
	ADD 	r3, r3, #1
	CMP	r3, r1
	BNE 	soma_diagonal_principal
	CMP 	r4, r2
	BNE	set_not_magic
	MOV	r3, #0 @ Zera variáveis de controle
	MOV	r4, #0
	MOV	r0, r7 @ retorna o endereço inicial do array para a posiçao inicial
	MOV	pc, lr

soma_diagonal_secundaria:
@r0 é a possição do primeiro elemento da matriz
	ADD	r0, r0, r6
	LDRB	r5, [r0]
	ADD	r4, r4, r5
	ADD 	r3, r3, #1
	CMP	r3, r1
	BNE 	soma_diagonal_secundaria
	CMP 	r4, r2
	BNE	set_not_magic
	MOV	r3, #0 @ Zera variáveis de controle
	MOV	r4, #0
	MOV	r0, r7 @ retorna o endereço inicial do array para a posiçao inicial
	B	fim

set_not_magic:
	LDR	r9, =0
	B	fim

matrix: 
	.byte	16
	.byte	3
	.byte	2
	.byte	13
	.byte	5
	.byte	10
	.byte	11
	.byte	8
	.byte	9
	.byte	6
	.byte	7
	.byte	12
	.byte	4
	.byte	15
	.byte	14
	.byte	1
	
	.align	2
