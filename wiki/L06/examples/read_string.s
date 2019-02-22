# Ejemplo de lectura de una cadena desde la consola
# NOTA: en la documentacion del RARs (F1) No aparece
# como se usa. En este ejemplo se muestra cómo

	.data
cad1:	.space 1024

	.text
	
	#-- En a0 se debe guardar la direccion de memoria
	#-- donde almacenar la cadena
	
	la a0, cad1
	
	#-- En el registro a1 se coloca el valor maximo
	#-- del buffer para almacenar la cadena
	li a1, 1024
	
	#-- Pedir la cadena al usuario
	li a7, 8
	ecall
	
	#--Imprimir la cadena por la consola
	li a7,4
	ecall
	
	#-- Terminar
	li a7, 10
	ecall