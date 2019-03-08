#-- Determinar si una cadena es un palindromo o no
#-- El usuario debe introducir la palabra por la consola
#-- Ejemplos de palindromos:  rotor

	.data
	
	#-- Almacenamiento de la cadena introducida por el usuario
cadena:	.space 1024

	#-- Mensajes a imprimir en la consola
pal_si:  .asciz "ES UN PALINDROMO"
pal_no:  .asciz "NO es palindromo"

	.text
	
	#-- Esperar a que el usuario introduzca la cadena
	la a0, cadena
	li a1, 1024
	li a7, 8 #-- ReadString
	ecall 
	
	#-- Inicializar los punteros a la cadena
	#-- t0: Puntero izquierdo
	#-- t1: Puntero derecho
	la t0, cadena
	mv t1, t0
	 
	#----------- Actualizar t1 para que apunte al final de la cadena
	#-- Comprobar si el caracter actual es 0
bucle1:
	lb t2, 0(t1)
	beq t2, zero, final_cadena
	
	#-- Apuntar al siguiente caracter
	addi t1, t1, 1
	b bucle1
	
final_cadena:	
	#-- t1 apunta al final de la cadena
	#-- Hay que retroceder 2 caracteres: uno es el 0, el otro \n
	addi t1, t1, -2
	
	#-- Ahora t1 apunta al último carácter ASCII legible
	#-- Que comiencen los juegos del palindromo!

bucle:		
	#-- Condicion de salida: si el puntero derecho (t1) es menor que el izquierdo (t0)
	#-- Terminamos: es un palindromo
	blt t1, t0, es_palindromo
	
	#-- Leer caracteres izquierdo (t2) y derecho (t3)
	lb t2, 0(t0)
	lb t3, 0(t1)
	
	#-- Si no son iguales: no es un palindromo
	bne t2, t3, no_palindromo
	
	#-- Actualizar los punteros
	addi t0, t0, 1  #-- Puntero izquierdo
	addi t1, t1, -1 #-- Puntero derecho
	
	#-- repetir
	b bucle
	

	#------- La palabra NO es un palindromo
no_palindromo:	
	#-- Imprimir mensaje
	la a0, pal_no
	li a7, 4  # -- PrintString
	ecall
	
	b fin

						
	#--------- La palabra SÍ es un palíndromo
es_palindromo:
	
	#-- Imprimir mensaje
	la a0, pal_si
	li a7, 4  #-- PrintString
	ecall

fin:	
	# -- Terminar
	li a7, 10
	ecall #-- Exit
	
	
	
	