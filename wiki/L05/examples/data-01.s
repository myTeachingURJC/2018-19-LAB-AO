# -- Ejemplo de lectura de una variable almacenada
# -- en la memoria

	.data
var1:	.word 0xCAFEBACA

	.text
	
	# -- Leer la variable de memoria
	la t0, var1     #  En t0 metemos la direccion de la variable
	lw t1, 0(t0)    # Acceder a esa direccion para leerla
	
	#--- Terminar
	li a7, 10
	ecall
	