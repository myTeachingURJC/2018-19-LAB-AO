# Imprimir los numeros del 1 al 10
# Ejemplo de creacion de un bucle

#-- Comienzo del programa
	.text

	#-- Usamos el registro t0 para contar
	li t0, 1
	
	#-- Usamos t1 para almacenar el valor tope
	li t1, 11
	
bucle:
	#-- Imprimir t0
	mv a0, t0
	li a7, 1
	ecall  #-- PrintInt
	
	#-- Imprimir un espacio
	#-- para separar los numeros
	li a0, ' '
	li a7, 11
	ecall  #-- PrintChar
	
	#-- Incrementar el reg t0
	addi t0, t0, 1
	
	#-- Mientras que t0 < 11, repetir bucle
	blt t0, t1, bucle
			 
        #-- Terminar
        li a7, 10
        ecall
                