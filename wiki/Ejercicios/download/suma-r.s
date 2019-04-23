# -- Suma de una lista de números
# -- Algoritmo recursivo

	.data
lista:  .word 1,2,3,4,5
N:      .word 2

	.text
	
	# -- Llamar a la funcion de suma
	la a0, lista  #  a0 = puntero a lista de numeros
	la a1, N
	lw a1, 0(a1)  #  a1 = N
	
	#-- Llamar a la funcion de suma
	jal sumar
	
	#-- Imprimir el resultado
	li a7, 1  #-- PrintINT
	ecall
	
	# -- Terminar
	li a7, 10  #-- Exit
	ecall
	
	
#------------------------------------------
#- Subrutina para sumar una lista de numeros
#- Algoritmo recursivo
#- suma(lista, N) = lista[0] + suma(Lista[1:], N-1)
#
#- Entradas:
#-   a0:  Puntero a la lista de numeros (lista)
#-   a1:  Cantidad de numeros a sumar (N)
#- Devuelve:
#-   a0: La suma total
#--------------------------------------------
sumar:

	#-- Comprobar la condicion de terminacion
	bne a1, zero, suma_recursiva
	
	#-- Parametro N es 0: Retornar 0
	li a0, 0
	ret
	
#-- N es distinto de cero. Calcular la suma recursiva	
suma_recursiva:

	#-- Crear la pila
	addi sp, sp, -32
	sw ra, 28(sp)
	sw s0, 24(sp)
	addi s0, sp, 28
	
	# -- Almacenar a0 en la pila (puntero a la lista)
	sw a0, -20(s0)
	
	
	# -------- Calcular suma(lista[1:], N-1)
	#-- Decrementar a1 (N-1)
	addi a1, a1, -1
	#-- Apuntar al siguiente elmento de la lista
	addi a0, a0, 4
	jal sumar
	
	#-- En a0 tenemos el resultado de la suma
	#-- Recuperar el puntero a la lista
	lw t0, -20(s0)
	
	#-- Obtener el elemento a sumar
	lw t1, 0(t0)
	
	#-- Sumar el elemento a la suma parcial anterior
	add a0, a0, t1 
	
	#-- recuperar la pila
	lw ra, 28(sp)
	lw s0, 24(sp)
        addi sp, sp, 32
        ret
        
