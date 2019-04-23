#-- Algoritmo de Fibonacci recursivo

	.text
	
	#-- Pedir al usuario el termino n
	li a7, 5
	ecall
	
	#-- a0 contiene el numero introducipor por el usuario
	
	#-- llamar a la subrutina fibo(a0)
	jal fibo
	
	#-- El resultado se devuelve por a0
	
	#-- Imprimir resultado
	li a7, 1
	ecall   #-- PrintInt
	
	#-- Terminar
	li a7, 10
	ecall
	
	
#------------------------------------------------------------------------
#-- Subrutina: fibo(n). Calculo de la secuencia de fibonacci  
#-- en modo recursivo
#-- Si n < 2, se devuelve 1. En caso contrario: fibo(n-1) + fibo(n-2)
#-- Entradas:
#--   a0:: Término de fibonacci a calcular (n)
#-- Devuelve:
#--  a0: El valor del término n
#------------------------------------------------------------------------
fibo:	
	#-- Comprobar el caso base. a0 >= 2?
	li t0, 2
	bge a0, t0, fibo_r
	
	#-- Caso n<2: Se devuelve siempre 1
	li a0, 1
	ret
	
	#-- Caso recursivo (n >=2 )
fibo_r: 

	#-- Crear la pila. La necesitamos por dos motivos:
	#-- 1) Para almacenar la direccion de retorno, porque hacen
	#--    llamadas a subrutinas
	#-- 2) Para almacenar valores intermedios y no perderlos al 
	#--    invocar otras subrutinas
	addi sp, sp, -32
	sw ra, 28(sp)
	sw s0, 24(sp)
	addi s0, sp, 28
	
	#------ Hay que cacular fibo(n-1) + fibo(n-2)
	#-- Calculamos n-1 y lo guardamos en la pila
	addi a0, a0, -1
	sw a0, -20(s0)   #-- A la pila: n-1
	
	#-- Llamamos a fibo(n-1)
	jal fibo
	
	#-- Resultado: a0 = fibo(n-1)
	
	#-- Ahora hay que calcular fibo(n-2)
	#-- Como hay que llamar a otra subrutina,
	#-- guardamos en la pila fibo(n-1)
	sw a0, -24(s0)
	
	#-- Cargamos en a0 n-1 de la pila
	lw a0, -20(s0)
	addi a0, a0, -1  #-- a0 = n-2
	jal fibo
	
	#-- a0 = fibo(n-2)
	
	#-- Recuperamos de la pila fibo(n-1)
	lw t0, -24(s0)
	
	#-- a0 = fibo(n-2) + fibo(n-1)
	add a0, a0, t0
	
	#-- Recuperar la pila
	lw ra, 28(sp)
	lw s0, 24(sp)
	addi sp, sp, 32
	ret
	
