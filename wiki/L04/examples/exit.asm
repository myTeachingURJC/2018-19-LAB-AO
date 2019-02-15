# Ejemplo de llamada al sistema: EXIT
# Se devuelve el control al sistema operativo, y nuestro
# programa termina de una forma "controlada"

	.text
	
	# Nuestro programa hace sus operaciones
	# (las que sean, no nos importa)
	
	# Hemos terminado. Le devolvemos el control
	# al sistema operativo
	li a7, 10   # Seleccionar el servicio 10: EXIT
	ecall       # Invocar el servicio
	
	# El sistema operativo toma el control
	# Nuestro programa termina
	# El simulador nos informa de que se ha terminado
