# Subrutina para calcular el factorial de 0

	.text
	
	#-- Llamar a la subrutina de calculo
	#-- del factorial de 0
	jal fact0
	
	#-- El resultado se devuelve por a0
	#-- Lo imprimimos por la consola
	li a7, 1
	ecall   # PrintInt
	
	#-- Terminar
	li a7, 10
	ecall
	
#----------------------------------------------
#-- Subrutina para calcular el factorial de 0
#-- Entradas: NINGUNA
#-- Devuelve: 1
#---------------------------------------------
fact0:  li a0, 1
	ret
	
	
	
