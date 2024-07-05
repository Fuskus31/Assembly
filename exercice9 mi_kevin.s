.global _start
	tab: .int 9, -4, 27592, 0, -27592, 9, -4, 27592, 0, -27592
	fintab:
ABS: 
	cmp r1,#0
	rsblt r0,r1,#0 @donc si par ex r1 = -4 on fait 0 - (-4)
	movge r0,r1
	mov pc,lr


_start:
	adr r5,tab
	adr r3,fintab
	
tq:	cmp r5,r3
	bhs fin
	ldr r1,[r5],#4
	bl ABS
	add r2,r2,r0
	b tq
	

fin:
 b fin







	

	
	