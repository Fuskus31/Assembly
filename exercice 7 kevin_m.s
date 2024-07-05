.global _start
MAT :.byte 0, 1, 2, 3
     .byte 4, 5, 6, 7
_start:
	mov r0,#1 @pour la ligne de la matrce ( voir explication pdf)
	mov r1,#2 @pour les colonnes de la matrice
	mov r2,#0
	adr r3, MAT @matrice
	add r4, r1, r0, lsl #2
	strb r2, [r3, r4]
	
	
	
bcl:
	ldrb r5,[r3],#1
	b bcl
