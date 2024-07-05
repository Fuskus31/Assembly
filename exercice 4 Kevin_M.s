.global _start

operateur: .byte '+' @peut aussi contenir '*' ou '-'
.align
_start:



mov r1,#2
mov r2,#7
adr r0,operateur
ldrb r4,[r0]

cmp r4,#'-'
subeq r3,r1,r2


cmp r4,#'*'
muleq r3,r1,r2

cmp r4,#'+'
addeq r3,r1,r2

bl:
b bl