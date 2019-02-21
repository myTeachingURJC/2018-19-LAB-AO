# -- Ejemplo de almacenamiento de dos palabras
# -- en la memoria

	.data
var1:	.word 0xCAFEBACA
var2:   .word 0xFACEB00C

	.text
	#-- El programa principal
	#-- no hace nada
	
	#--- Terminar
	li a7, 10
	ecall
	
