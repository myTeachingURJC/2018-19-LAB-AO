#-- Prueba de alineamiento

	.data
	
	#-- Reservar espacio para una variable de 16 bits (2 bytes)
var1:	.space 2

	#-- Reservar espacio para una variable de 32 bites (4 bytes)
	.align 2
var2:   .space 4

	.text
	
	#-- Almacenar 0xCAFE en var2
	li t1, 0xCAFE #-- t1 = 0xCAFE
	la t0, var2   #-- Leer direccion de var2
	sw t1, 0(t0)  #-- Almacenar t1 en var2
	
	#--- Terminar
	li a7, 10
	ecall
	
