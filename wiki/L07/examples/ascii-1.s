#-- Ejemplo de codificacion en ascii
#-- Usando las comillas simples nos
#-- referimos al código ASCII de un carácter

	.text
	
	#-- Que valores se cargan en t0 y t1?
	li t0, 'G'  
	li t1, 'g'
	
	#-- Terminar
	li a7, 10
	ecall
	