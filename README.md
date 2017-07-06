### Compilando
```
  arm-elf-gcc -Wall -g -o alo hello.s
  arm-elf-gdb -tui alo
```
### Rodando
```
  (gdb) target sim
  (gdb) load
  (gdb) break main
  (gdb) run
  (gdb) continue
```
### Observando Resultados
#### - Vendo Registradores
```
  info registers
```
#### - Vendo memória
```
  x/20 tag
  x/20d tag
```
### Principais comandos
#### MOV

Move um valor de um registrador(ou uma constante) para um outro registrador

#### ADD, SUB, RSB, MULS

`ADD r0, r1, r2` = `r0 = r1 + r2`
`SUB r0, r1, r2` = `r0 = r1 - r2`
`RSB r0, r1, r2` = `r0 = r2 - r1`
`MULS r0, r1, r2` = `r0 = r1 * r2`

#### LDR e STR

`LDR r0, [r1], #20`: Carrega o valor da memória na posição r1 no registrador r0, em seguida adiciona 20 em r1
`STR	r0, [r1, #20]`: Armazena o valor do registrador r0 na posição de memória de r1, em seguida adiciona 20 em r1

#### B, CMP, operador S

`B func`: Descola para a função `func`, caso seja adionado `L`, para retornar usar `MOV pc, lr`
`CMP r0, r1`: Compara r0 e r1, fazendo `r0 - r1`, e armazenando o "resultado" em cprs
`operador S`: Adiciona os "excedentes" de uma operação no cprs
