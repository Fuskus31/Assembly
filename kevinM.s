.global _start

wait1:
	stmfd sp!,{r1, r2, lr}
	ldr r1, =0x100000
	mov r2, #0
bcl_wait1:
	cmp r2, r1
	bhi end_wait1
	add r2, r2, #1
	b bcl_wait1
end_wait1:
	ldmfd sp!,{r1, r2,pc}

wait:
	stmfd sp!,{r2, lr}
	mov r2, #0
bcl_wait:
	cmp r2, r0
	bhi end_wait
	bl wait1
	add r2, r2, #1
	b bcl_wait
end_wait:
	ldmfd sp!,{r2, pc}

ouvrir_porte:
	stmfd sp!,{r0, r1, r2, lr}
	ldr r1, =0xff200000
	mov r0, #2
	ldr r2, =0b1111111111
	str r2, [r1]
	bl wait
	ldr r2, =0b1111001111
	str r2, [r1]
	bl wait
	ldr r2, =0b1110000111
	str r2, [r1]
	bl wait
	ldr r2, =0b1100000011
	str r2, [r1]
	bl wait
	ldr r2, =0b1000000001
	str r2, [r1]
	ldmfd sp!,{r0, r1, r2, pc}

fermer_porte:
	stmfd sp!,{r0, r1, r2, lr}
	ldr r1, =0xff200000
	mov r0, #1
	ldr r2, =0b1000000001
	str r2, [r1]
	bl wait
	ldr r2, =0b1100000011
	str r2, [r1]
	bl wait
	ldr r2, =0b1110000111
	str r2, [r1]
	bl wait
	ldr r2, =0b1111001111
	str r2, [r1]
	bl wait
	ldr r2, =0b1111111111
	str r2, [r1]
	ldmfd sp!,{r0, r1, r2, pc}

affiche_etage: 
  @recoit dans r0 le numéro d'un étage et l'affiche.
	stmfd sp!,{r0, r1, r2, lr}
  	ldr r1,=0xff200020
	cmp r0,#1
	
	streq r0,[r1]
	cmp r0,#2
	streq r0,[r1]

	ldmfd sp!,{r0, r1, r2, pc}  
  
  
_start:
	mov r0,#1
	bl affiche_etage
	bl ouvrir_porte
	bl fermer_porte
end:
	b end
