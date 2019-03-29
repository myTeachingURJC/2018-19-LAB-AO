#-- Ejemplo de creacion de una lista
	
	.text
	
#----------------------------
#-- Programa principal
#----------------------------	
main:	

	#-- En s0 guardamos la cabeza de la lista
	#-- Inicialmente es null (s0 = 0)
	mv s0, zero


loop:
	#-- Pedir al usuario un elemento de la lista
	#-- Si se introduce el valor 0 se termina
	li a7, 5
	ecall #-- ReadInt
	
	#-- Si es el valor 0 se termina
	beq a0, zero, fin
	
	# -- Crear el nodo de la lista
	# -- a0: valor introducido por el usuario
	# -- a1: puntero al siguiente elemento
	mv a1, s0
	jal node_create 
	
	#-- Actualizar la cabeza: s0 apunta siempre al ultimo
	#-- elemento introducido
	mv s0, a0
	
	#-- Repetir
	b loop
	
fin:	
	
	#-- Terminar
	li a7, 10
	ecall  #-- Exit
	

#--------------------------------------------------
#-- Crear un nodo de la lista
#-- e inicializarlo con un valor 
#-- ENTRADAS:
#--   a0: Numero entero a almacenar en el nodo
#--   a1: Puntero al siguiente elemento
#-- DEVUELVE:
#--   a0: Direccion del nodo creado
#--------------------------------------------------
#-- Estructura del nodo
#--  offset 0:  Next
#--  offset 4:  Valor
#---------------------------------------------------
node_create:
	
	#-- Crear la pila para almacenar a0
	#-- Aunque no es necesario, creamos la pila con la
	#-- estructura habitual: guardando ra y s0
	addi sp, sp, -32
	sw ra, 28(sp)
	sw s0, 24(sp)
	addi s0, sp, 28
	
	#-- Almacenar a0 en la pila
	sw a0, -20(s0)
	
	#-- Reservar 8 bytes de memoria dinamica (2 bytes)
	li a0, 8  #-- Bytes a reservar
	li a7, 9
	ecall
	
	#-- a0 contiene la direccion del nuevo nodo creado
	
	#-- Recuperar valor de inicializacion de la pila
	lw t0, -20(s0)
	
	#-- a0 contiene la direccion del nodo reservado
	#-- Inicializar next
	sw a1, 0(a0)
	
	#-- Almacenar el valor en el nodo creado
	sw t0, 4(a0)
	
	#-- Recperar la pila
	lw ra,28(sp)
	lw s0,24(sp)
	addi sp, sp, 32
	ret
	
	
	