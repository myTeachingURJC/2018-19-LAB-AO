##---- Examen practicas de Arquitectura de Ordenadores
##-- Escribe tus datos

##-- NOMBRE: Obijuan
##-- APELLIDOS: 

#---------------------------------------------------
#--  IMPLEMENTA AQUI EL PROGRAM PRINCIPAL
#---------------------------------------------------



	.data
cad:	.asciz "**Summer is coming**-2019\n"

#---- ESPECIFICACION DEL ENUNCIADO: Cadena definida en tiempo de ejecutacion
#---- La itnroduce el usuario
#---- El enunciado no nos dice nada del tamaño máximo. Usamos el que nosotros queramos
#--- aplicando el sentido común para poder probar
cad2:   .space 200

	.text
	
	
	#--- ESPECIFICACION DEL ENUNCIADO: Debe hacer lo mismo que
	#-- el programa principal de upper.asm
	
	#-- Imprimir la cadena completa
	la a0, cad
	li a7, 4
	ecall

	#-- Llamar a upper() para convertirla a mayusculas
	la a0, cad
	jal upper
	
	#-- Imprimir la nueva cadena
	la a0, cad
	li a7, 4
	ecall
	
	
	#---- Ampliacion------------------------
	
	#-- Pedir al usuario la cadena
	la a0, cad2
	li a1, 200
	li a7, 8
	ecall

	#-- Llamar a upper() para convertirla a mayusculas
	la a0, cad2
	jal upper
	
	#-- Imprimir la nueva cadena
	la a0, cad2
	li a7, 4
	ecall
			
	#-- Terminar
	li a7, 10
	ecall
	
	
#----------------------------------------------------
#- IMPLEMENTA AQUI LAS FUNCIONES NECESARIAS
#----------------------------------------------------	
		
#-- Hacemos copy&paste de las funciones upper() y upper_char() para
#-- realizar las pruebas				
				
				
#----------------------------------------------------------
#-- Funcion upper(a0): Pasar una cadena a mayusculas
#-- Entradas:
#--   a0: Puntero a la cadena
#-- Devuelve:
#--   nada
#-----------------------------------------------------------
upper:

	addi sp, sp, -32
	sw ra, 28(sp)
	sw s0, 24(sp)
	addi s0,sp,28

upper_loop:	
			
	#-------- Recorrer la cadena hasta llegar al final
	lb t0, 0(a0)  #-- Leer caracter actual
	beq t0, zero, fin_upper  #-- Es 0? hemos terminado
	
	#-- No hemos llegado al final de la cadena
	#-- Convertir el caracter actual a mayusculas
	#-- Almacenar a0 en la pila para no perderlo (No violar el convenio)
	sw a0, -20(s0)
	jal upper_char
	
	#-- Recuperar a0 de la pila
	lw a0, -20(s0)
	
	#-- Apuntar al siguiente caracter
	addi a0, a0, 1
	
	#-- Repetir
	b upper_loop
	

fin_upper:			
	lw ra, 28(sp)
	lw s0, 24(sp)
	addi sp,sp,32

	ret

#------------------------------------------------------------
#- Funcion upper_char(): Convertir un caracter a mayusculas  
#- Entradas:
#-   a0: Direccion del caracter a convertir a mayusculas
#- Devuelve:
#-   Nada
#------------------------------------------------------------
upper_char:
	
	#-- Leer el caracter que queremos pasar a mayusculas
	lb t0, 0(a0)
	
	#---- Comprobar si el caracter esta en el rango ['a' - 'z']: ASCII: [97, 122]
	#-- Es menor que 'a' (97): No convertir
	li t1, 'a'
	blt t0, t1, fin_upper_char
	
	#-- Es mayor que 'z'
	li t1, 'z'
	addi t1, t1, 1
	bge t0, t1, fin_upper_char
	
	#-- El caracter esta en minusculas
	#-- Restamos 32 y lo guardamos
	
	addi t0, t0, -32
	sb t0, 0(a0)
	
fin_upper_char:	
	ret
	
