# Programa para calcular el factorial de 3,
# usando una subrutina recursiva

	.text
	
	#-- fact(3)
	li a0, 5
	jal fact
	
	#-- El resultado se devuelve por a0
	#-- Lo imprimimos por la consola
	li a7, 1
	ecall   # PrintInt
	
	#-- Terminar
	li a7, 10
	ecall

#---------------------------------------------
#-- Subrutina para calcular el factorial de un
#-- numero n pasado como parametro
#-- Entradas: a0: numero n a calcular el factorial
#-- Devuelve: a0: El factorial de n
#-- El factorial se calcula de forma recursiva:
#--   fact(n) = n * fact(n-1)
#----------------------------------------------
fact:   
	#-- Primero comprobamos la condicion de terminacion
	#-- Si n es 0, devolvemos 1 y retornamos
	#-- Como hay más llamadas a subrutinas no es
	#-- necesario crear la pila
	
	bne a0, zero, factorial_rec
	
	#-- n es 0
	#-- El factorial de 0 es 1. Lo devolvemos
	li a0, 1
	ret
	
factorial_rec:
	
        #-- Como vamos a llamar a una subrutina, 
        #-- hay que almacenar la direccion de retorno
        #-- en la pila
        addi sp, sp, -32
        sw ra, 28(sp)
        sw s0, 24(sp)
        addi s0, sp, 28
        
        #----- Calcular el factorial: n * fact(n-1)
        
        #-- Como hay que llamar a una subrutina, perderemos
        #-- el valor que hay en a0
        #-- Lo guardamos en la pila
        sw a0, -20(s0)
        
        #-- a0 = n - 1
        addi a0, a0, -1
        
        #-- Calcular fact(n-1)
        jal fact
        
        #----- Multiplcar por n
        #-- Recuperar n de la pila
        lw t0, -20(s0)
         
        #- a0 = n * fact(n-1)
        mul a0, a0, t0
      
        #-- Recuparar pila y retornar  
        lw ra, 28(sp)
        lw s0, 24(sp)
        addi sp, sp, 32
        ret	

	
	
