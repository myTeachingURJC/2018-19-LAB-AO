#-- Almacenamiento de 8 variables de tipo byte
#-- en la memoria
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
	#--- Terminar
	li a7, 10
	ecall
	
