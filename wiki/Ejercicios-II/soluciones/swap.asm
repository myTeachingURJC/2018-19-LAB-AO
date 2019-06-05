#-- Funcion de swap

	.data

#-- Para probar la funcion de SWAP se puede hacer de muchas formas
#-- En el enunciado no se especifica, por lo que se puede hacer como
#-- se quiera
#-- Una forma podría ser colocando dos caracteres, llamar a swap 
#-- y comprobar que se han intercambiado
test:   .asciz "AB"

	.text
	
	
	#-- En a0 ponemos la direccion de "A"
	la a0, test

	#-- En a1 ponemos la direccion de "B": es la de "A" + 1
	addi a1, a0, 1

	#-- Llamamos a swap
	jal swap
	
	#-- Si imprimimos la cadena vemos que se han intercambiado
	#-- los dos caracteres
	#-- tambien se puede comprobar sin imprimir, simplemente
        #-- mirando la memoria al simular paso a paso
	la a0, test
	li a7, 4
	ecall
	
	#-- Terminar
	li a7, 10
	ecall
	
#-----------------------
#-- Subrutina SWAP
#-- Intercambia los contenidos de las posiciones de memoria pasadas
#-- Entradas:
#--  a0:  Puntero posicion de memoria
#--  a1:  Puntero a otra posicion de memoria
#-- Devuelve: nada
#-----------------------------
swap:
	#-- Leer el contenido de a0
	lb t0, 0(a0)
	
	#-- Leer el contenido de a1
	lb t1, 0(a1)
	
	#-- Guardar t1 en la direccion apuntada por a0
	sb t1, 0(a0)
	
	#-- Guardar t0 en la direccion apuntada por a1
	sb t0, 0(a1)
	
	ret


