#-- Ejemplo de memoria dinamica
#-- Reserva de dos bloques de 10 bytes
	
	.text
	
	#-- Reservar el primer bloque de 10 bytes
	li a0, 10
	li a7, 9   #-- Sbrk
	ecall
	
	#-- Almacenar dos palabras en las primeras 
	#-- posiciones
	li t0, 0xCACABACA
	li t1, 0xCAFEB0B0
	sw t0, 0(a0)
	sw t1, 4(a0)
	
	#-- Reservar el segundo bloque de 10 bytes
	#-- Reservar el primer bloque de 10 bytes
	li a0, 10
	li a7, 9   #-- Sbrk
	ecall
	
	#-- Almacenar dos palabras en las primeras
	#-- posiciones
	li t0, 0xB0CAF0CA
	li t1, 0xDED0FE00
	sw t0, 0(a0)
	sw t1, 4(a0)
	
	#-- Terminar
	li a7, 10
	ecall
