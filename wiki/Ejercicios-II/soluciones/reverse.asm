#-- Programa reverse

	.data
	
	#-- La especificacion nos indica que la cadena esta definida
	#-- en tiempo de compilacion
cad1:   .asciz "Winter is Coming..."

	.text
	
	#-- Cargar en s0 la direccion de la cadena
	la s0, cad1
	
	#-- Ponemos la direccion en a0 para llamar a reverse
	mv a0, s0
	
	#-- Llamar a reverse
	jal reverse
	
	#-- Imprimir la nueva cadena para comprobar que se ha intercambiado
	mv a0, s0
	li a7, 4
	ecall
	
	#-- Terminar
	li a7, 10
	ecall
	
#-----------------------
#-- Subrutinna SWAP
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
	
#------------------------------------------------
#-- Reverse  	
reverse:
	addi sp, sp, -32
	sw ra, 28(sp)
	sw s0, 24(sp)
	addi s0,sp,28
	
	#-- a1 apunta también al comienzo de la cadena
	mv a1, a0
avanzar:
	#-- Ir al final de la cadena
	lb t0, 0(a1)
	beq t0, zero, fin_cadena
	
	#-- No hemos llegado al final de la cadena
	addi a1, a1, 1
	b avanzar

	#-- a1 apunta al final
fin_cadena:

	#-- Retrocedemos 1 para que apunte al último carácter
	addi a1, a1, -1
	
	
bucle:	
	#-- Comprobar condicion de salida
	#-- si a0 >= a1 terminar
	bge a0, a1, fin_reverse
	
	#-- Intercambiar a1 y a0
	#-- guardamos a1 y a0 en la pila para NO violar el convenio
	sw a0, -20(s0)
	sw a1, -24(s0)
	
	jal swap
	
	#-- Recuperamos a0 y a1 de la pila
	lw a0, -20(s0)
	lw a1, -24(s0)
	
	
	#-- Incrementar a0
	addi a0, a0, 1
	
	#-- Decrementar a1
	addi a1, a1, -1
	
	 #-- Repetir
	 b bucle 
	
fin_reverse:

	#-- Recuperar la pila, la direccion de retorno y el frame pointer
	lw ra, 28(sp)
	lw s0, 24(sp)
	addi sp,sp,32

	ret
	
	
	
