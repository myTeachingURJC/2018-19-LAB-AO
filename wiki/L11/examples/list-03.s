#-- Ejemplo de creacion de una lista con los
#-- valores introducidos por el usuario
#-- Se recorre la lista de forma iterativa y 
#-- se imprimen los valores en orden inverso
#-- a como fueron introducidos
	
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
	#-- Imprimir la lista, desde la cabeza hasta el final
	#-- (orden inverso al introducido por el usuario)
	mv a0, s0
	jal print_list
	
	#-- Terminar
	li a7, 10
	ecall  #-- Exit
	
#--------------------------------------------
#-- Impriimir la lista
#-- La lista se recorre de manera iterativa
#-- ENTRADAS:
#--   a0: Puntero a la cabeza de la lista
#-- DEVUELVE:
#--   nada
#--------------------------------------------
print_list:

	#-- Si la lista es null, se termina
	beq a0, zero, fin_print
	
	#-- Preservar a0 en t0
	mv t0, a0
	
	#-- Imprimir el valor del nodo actual
	lw a0, 4(a0) #-- a0 = value
	li a7, 1
	ecall    #-- PrintInt
	
	#-- Imprimir un espacio para separar los valores
	li a0, ' '
	li a7, 11
	ecall  #-- PrintChar
	
	
	#-- Apuntar al siguiente nodo
	mv a0, t0
	lw a0, 0(a0)  #-- a0 = next
	b print_list
	
fin_print:
	ret


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
	
	
	