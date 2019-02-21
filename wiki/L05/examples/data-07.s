#-- Copia de la variable 1 sobre las variables 7 y 8
	.data
var1:	.byte 0xCA
var2:   .byte 0xFE
var3:   .byte 0xBA
var4:   .byte 0xCA
var5:	.byte 0xFA
var6:   .byte 0xCE
var7:	.byte 0xB0
var8:   .byte 0x0C

	.text
	
	# -- Leer la variable var1
	la t0, var1
	lb t1, 0(t0)
	
	# -- Escribir en var7 y var7
	la t0, var7
	sb t1, 0(t0)  # var7 = var1
	sb t1, 1(t0)  # var8 = var1
	
	#--- Terminar
	li a7, 10
	ecall
	
