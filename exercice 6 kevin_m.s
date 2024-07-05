.global _start
chaine: .asciz "#ABZ]aez}"
.align
_start:


adr r1, chaine
while:	
		ldrb r2, [r1], #1
		cmp r2, #0
		beq end_while
		cmp r2, #'a'
		blo end_if
		cmp r2, #'z'
		bhi end_if
		sub r3, r2, #'a' - 'A'
		strb r3, [r1,#-1]
		
end_if:
		b while
end_while: