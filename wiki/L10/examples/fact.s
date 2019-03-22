#  Calcular el factorial de un numero,
#  de forma recursiva

	.text
	
	#-- Calcular el factorial de 6
	li a0, 6
	jal fact
	
	#-- Imprimir el resultado en consola
	li a7, 1
	ecall  #-- PrintInt
	
	#-- Terminar
	li a7, 10
	ecall
	
#----------------------------------------------
#- Subrutina para calculo del factorial
#- ENTRADA:
#-   a0: Numero (n) a calcular su factorial (n>=0)
#  DEVUELVE:
#-   a0: El factorial
#----------------------------------------------
fact:
	#-- Comprobar el caso en el que estamos
	#-- Si a0 != 0 es el caso recursivo
	bne a0, zero, fact_rec
	
	#-- Caso terminal
	#-- FActorial de 0 es 1
	li a0, 1
	ret
	
	#-- Caso recursivo n>0
fact_rec:
	
	#-- Crear la pila
	addi sp, sp, -32
	sw ra, 28(sp)
	sw s0, 24(sp)
	addi s0,sp, 28  #-- Frame pointer
	
	#-- Almacenar n en la pila
	sw a0, -20(s0)
	
	#-- Calcular el factorial de n-1
	addi a0, a0, -1
	jal fact
	
	#-- a0 = fact(n-1)
	#-- recuperamos n. t0 = n
	lw t0, -20(s0)
	
	#-- Realizar la multiplicacion
	# a0 = n * fact(n-1)
	mul a0, a0, t0
	
	#-- Restablecer la pila
	lw ra, 28(sp)
	lw s0, 24(sp)
	addi sp, sp, 32
	ret
	
	
	