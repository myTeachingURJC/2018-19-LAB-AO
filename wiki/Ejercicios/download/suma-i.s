# -- Suma de una lista de números
# -- Algoritmo iterativo
#-- Presentado al simulacro examen: 17
#-- Tiempo 1h

	.data
lista:  .word 1,2,3,4,5
N:      .word 5

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
#- Algoritmo iterativo
#- Entradas:
#-   a0:  Puntero a la lista de numeros (lista)
#-   a1:  Cantidad de numeros a sumar (N)
#- Devuelve:
#-   a0: La suma total
#--------------------------------------------
sumar:
	#-- Suma parcial en t0
	li t0, 0

suma_loop:

	#-- Si quedan 0 numeros por sumar: terminar
	beq a1, zero, fin_sumar

	#-- Leer el numero actual
	lw t1, 0(a0)

	#-- Sumarlo al total
	add t0, t0, t1

	#-- Apuntar al siguiente elemento
	addi a0, a0, 4

	#-- Queda uno menos
	addi a1, a1, -1

	#-- Repetir
	b suma_loop

fin_sumar:  #-- Devolver la suma en a0
	    mv a0, t0
	    ret
