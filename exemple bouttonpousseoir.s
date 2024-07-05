.global _start
_start:

main:
    @ Pointeur vers le registre des boutons
    ldr r0, =0xFF20005C 

    @ Pointeur vers le registre de contrôle des LEDs
    ldr r1, =0xFF200000

    @ Initialisation des ports pour les boutons
    ldr r2, =0xF @ 0b1111
    str r2, [r0]

    @ Boucle principale
loop:
    @ Lecture de l'état des boutons
    ldr r2, [r0]

    @ Vérification du bouton 0
    tst r2, #1
    beq check_button1
    bl display_led0
    b clear_button0

check_button1:
    tst r2, #2
    beq check_button2
    bl display_led1
    b clear_button1

check_button2:
    tst r2, #4
    beq check_button3
    bl display_led2
    b clear_button2

check_button3:
    tst r2, #8
    beq loop
    bl display_led3
    b clear_button3

clear_button0:
    ldr r2, =1
    str r2, [r0]   @ Écrire 1 pour effacer le bit de capture de front du bouton 0
    b loop

clear_button1:
    ldr r2, =2
    str r2, [r0]   @ Écrire 1 pour effacer le bit de capture de front du bouton 1
    b loop

clear_button2:
    ldr r2, =4
    str r2, [r0]   @ Écrire 1 pour effacer le bit de capture de front du bouton 2
    b loop

clear_button3:
    ldr r2, =8
    str r2, [r0]   @ Écrire 1 pour effacer le bit de capture de front du bouton 3
    b loop

display_led0:
    @ Allumer la LED 0 (exemple) en définissant le bit 0
    ldr r3, =1            @ Bit 0 (LED 0)
    str r3, [r1]
    bx lr

display_led1:
    @ Allumer la LED 1 (exemple) en définissant le bit 1
    ldr r3, =2            @ Bit 1 (LED 1)
    str r3, [r1]
    bx lr

display_led2:
    @ Allumer la LED 2 (exemple) en définissant le bit 2
    ldr r3, =4            @ Bit 2 (LED 2)
    str r3, [r1]
    bx lr

display_led3:
    @ Allumer la LED 3 (exemple) en définissant le bit 3
    ldr r3, =8            @ Bit 3 (LED 3)
    str r3, [r1]
    bx lr

	