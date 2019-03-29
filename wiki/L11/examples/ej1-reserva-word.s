#-- Ejemplo de memoria dinamica
	
	.text
	
	#-- Reservar una palabra de memoria (4 bytes)
	li a0, 4
	li a7, 9   #-- Sbrk
	ecall
	
	#-- En a0 tenemos la direccion asignada
	#-- Guardamos un valor en esa dirección
	li t0, 0xCACABACA
	sw t0, 0(a0)
	
	#-- Terminar
	li a7, 10
	ecall
