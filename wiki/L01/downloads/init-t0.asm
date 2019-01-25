	.text
	
	#-- t0 = x0 + 1
	addi t0, zero, 1
	
	#-- Bucle infinito: no queremos que el procesador
	#-- haga nada más
stop:	j stop

	#-- Hay que forzar la parada en el simulador para
	#-- terminarlo