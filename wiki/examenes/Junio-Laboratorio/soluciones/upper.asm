##---- Examen practicas de Arquitectura de Ordenadores
##-- Escribe tus datos

##-- NOMBRE: Obijuan
##-- APELLIDOS:

#---------------------------------------------------
#--  IMPLEMENTA AQUI EL PROGRAM PRINCIPAL
#---------------------------------------------------
	.data
	
	####---- ESPECIFICACION DEL ENUNCIADO: Nos indicas que se use esta cadena
	####---- definida en tiempo de compilacion
	####--- Tiene que ser esta cadena por ESPECIFICACION.
	####--- Si además queremos añadir alguna más, adelante
cad:	.asciz "**Summer is coming**-2019\n"

	.text
	
	
	#--- ESPECIFICACION DEL ENUNCIADO: Imprimir la cadena originl
	la a0, cad
	li a7, 4
	ecall

	#-- ESPECIFICACION DEL ENUNCIADO: Llamar a upper()
	#-- Llamar a upper() para convertirla a mayusculas
	la a0, cad
	jal upper
	
	#-- Imprimir la nueva cadena
	#-- ESPECIFICACION DEL ENUNCIADO: Imprimir la nueva cadena
	la a0, cad
	li a7, 4
	ecall
	
	#-- No se dice nada del formato de cómo deben salir en pantalla, así que
	#-- podemos elegir el que nostros queramos.
	#-- Para que sea más legible, lo más lógico es imprimir una cadena y debajo
	#-- la otra, para compararlas mejor. Pero esto es decisión de cada uno
			
	#-- Terminar
	li a7, 10
	ecall
	
	
#----------------------------------------------------
#- IMPLEMENTA AQUI LAS FUNCIONES NECESARIAS
#----------------------------------------------------		

#----------------------------------------------------------
#-- Funcion upper(a0): Pasar una cadena a mayusculas
#-- Entradas:
#--   a0: Puntero a la cadena
#-- Devuelve:
#--   nada
#-----------------------------------------------------------
upper:

	#-- Tenemos que usar pila obligatoriamente, porque
	#-- se debe llamar a la funcion upper_char()

	addi sp, sp, -32
	sw ra, 28(sp)
	sw s0, 24(sp)
	addi s0,sp,28

upper_loop:	
			
	#-- ESPECIFICACION DEL ENUNCIADO: Algoritmo iterativo
			
	#-------- Recorrer la cadena hasta llegar al final
	lb t0, 0(a0)  #-- Leer caracter actual
	beq t0, zero, fin_upper  #-- Es 0? hemos terminado
	
	#-- No hemos llegado al final de la cadena
	#-- Convertir el caracter actual a mayusculas
	#-- Almacenar a0 en la pila para no perderlo (No violar el convenio)
	sw a0, -20(s0)
	
	##-- ESPECIFICACION DEL ENUNCIADO: Hay que llamar a la funcion upper_char
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

#--- Esta es la misma funcion upper_char que tenemos en el fichero upper_char.asm
#--- Para que funcione el programa completo la ponemos aqui
#--- (hacemos copy & paste)

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
	
