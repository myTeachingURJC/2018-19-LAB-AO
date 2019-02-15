# Programa de ejemplo del lectura de un numero
# desde el teclado
# Ejemplo de uso de la llamada al sistema ReadInt

	.text
	
	# Llamar al servicio ReadInt
	li a7, 5
	ecall
	
	# Esta llamada deveulve el numero en el registro a0
	# Lo movemos al registro t0
	mv t0, a0
	
	#--- Terminar
	li a7, 10
	ecall
