.global _start
tab: .int 9, -4, 27592, 0, -27592, 9, -4, 27592, 0, -27592
fintab:
_start:
	
	mov r3,#0
	adr r5,tab
	adr r1,fintab

tq: cmp r5,r1
	bge fin
	ldr r2,[r5],#4
	cmp r2,r3
	movgt r3,r2
	b tq
	
fin:
b fin
	
	


	
	