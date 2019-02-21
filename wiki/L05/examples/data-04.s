#-- Ejemplo de copia de una media palabra a 
#-- otra posicion de memoria

	.data
var1:	.half 0xCAFE
var2:   .half 0xBACA
var3:	.half 0xFACE
var4:	.half 0xB00C

	.text
	
	# -- Leer la variable var 2
	la t0,var2
	lh t1, 0(t0)
	
	# -- Escribirla sobre la variable 4
	la t0, var4
	sh t1, 0(t0)
	
	#--- Terminar
	li a7, 10
	ecall
	
