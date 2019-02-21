#-- Ejemplo de almacenamiento de 4 medias palabras
#-- (numeros de 16 bits)

	.data
var1:	.half 0xCAFE
var2:   .half 0xBACA
var3:	.half 0xFACE
var4:	.half 0xB00C

	.text
	
	#--- Terminar
	li a7, 10
	ecall
	
