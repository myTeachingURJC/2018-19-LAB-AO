
	.text
	
	#-- Valores iniciales, 1, 1
	addi t0, zero, 1
	addi t1, zero, 1

bucle:		
	#-- Calcular siguiente término en t2
	add t2, t0, t1   # t2 = t0 + t1
	
	#-- Actualizar registros
	add t0, t1, zero  #-- t0 = t1
	add t1, t2, zero  #-- t1 = t2
	
	j bucle
	