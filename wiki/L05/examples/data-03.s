#-- Ejemplo de copia de variables:
#-- la variable var1 se escribe sobre var2

	.data
var1:	.word 0xCAFEBACA
var2:   .word 0xFACEB00C

	.text
	
	# -- En t0 ponemos la direccion de la variable 1
	la t0, var1
	
	# -- Leemos la variable 1 en t1
	lw t1, 0(t0)
	
	# -- Escribimos la variable 1 sobre variable 2
	sw t1, 4(t0)
	
	#-- El programa principal
	#-- no hace nada
	
	#--- Terminar
	li a7, 10
	ecall
	
