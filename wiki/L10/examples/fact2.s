# Programa para calcular el factorial de 2,
# llamando a la subrutina fact1

	.text
	
	#-- Llamar a la subrutina de calculo
	#-- del factorial de 2
	jal fact2
	
	#-- El resultado se devuelve por a0
	#-- Lo imprimimos por la consola
	li a7, 1
	ecall   # PrintInt
	
	#-- Terminar
	li a7, 10
	ecall

#---------------------------------------------
#-- Subrutina para calcular el factorial de 2
#-- Entradas: NINGUNA
#-- Devuelve: a0 = 2 * fact1
#----------------------------------------------
fact2:  #-- Como vamos a llamar a una subrutina, 
        #-- hay que almacenar la direccion de retorno
        #-- en la pila
        addi sp, sp, -32
        sw ra, 28(sp)
        sw s0, 24(sp)
        addi s0, s0, 28
        
        #----- Calcular el factorial: 2 * fact1
        
        #-- Calcular el factorial de 0
        jal fact1
        
        #----- Multiplcar por 2
        #- a0 = a0 * 2
        li t0, 2
        mul a0, a0, t0
      
        #-- Recuparar pila y retornar  
        lw ra, 28(sp)
        lw s0, 24(sp)
        addi sp, sp, 32
        ret	

#---------------------------------------------
#-- Subrutina para calcular el factorial de 1
#-- Entradas: NINGUNA
#-- Devuelve: a0 = 1 * fact0
#----------------------------------------------
fact1:  #-- Como vamos a llamar a una subrutina, 
        #-- hay que almacenar la direccion de retorno
        #-- en la pila
        addi sp, sp, -32
        sw ra, 28(sp)
        sw s0, 24(sp)
        addi s0, s0, 28
        
        #----- Calcular el factorial: 1 * fact0
        
        #-- Calcular el factorial de 0
        jal fact0
        
        #-- Multiplcar por 1 (no hace falta)
      
        #-- Recuparar pila y retornar  
        lw ra, 28(sp)
        lw s0, 24(sp)
        addi sp, sp, 32
        ret	
			
#----------------------------------------------
#-- Subrutina para calcular el factorial de 0
#-- Entradas: NINGUNA
#-- Devuelve: a0 = 1
#---------------------------------------------
fact0:  li a0, 1
	ret
	
	
	
