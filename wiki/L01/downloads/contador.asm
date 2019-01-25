#-- Programa que incrementa el registro t0
#-- de uno en uno, indefinidamente
#-- Para verlo en acción, bajar la velocidad de 
#-- ejecucion a 1 instrucción por segundo
	
	.text
	
	#-- Inicializar t0 (t0 = 1)
	addi t0, zero, 1
	
bucle:
	#-- Incrementar el registro t0 en una unidad
	addi t0, t0, 1  #-- t0 = t0 + 1
	
	#-- Repetir indefinidamente		
	j bucle
