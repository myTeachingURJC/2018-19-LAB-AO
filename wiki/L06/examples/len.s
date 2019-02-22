# Calcular la longitud de una cadena
	.data
cad1:	.asciz "Cadena de prueba"

#-- Comienzo del programa
	.text

	#-- Usamos el registro t0 para contener la direccion
	#-- del caracter actual
	la t0, cad1
	
	#-- Usamos el registro t1 como contador de caracteres
	li t1, 0

bucle:	
	#-- Leer el caracter actual (apuntado por t0)
	lb t2, 0(t0)
	
	#-- Es 0? Si: terminar. Hemos llegado al final
	beq t2, zero, fin

	#-- No se ha llegado al final
	#-- Apuntar al siguiente caracter: t0 = t0 + 1
	addi t0, t0, 1
	
	#-- Incrementar el contador de caracteres
	#-- t1 = t1 + 1
	addi t1, t1, 1
	
	#-- Repetir el bucle
	b bucle		
	
fin:	#-- Imprimir la longitud de la cadena
	mv a0, t1
	li a7, 1
	ecall  #-- PrintInt
			 
        #-- Terminar
        li a7, 10
        ecall
                