##---- Examen practicas de Arquitectura de Ordenadores
##-- Escribe tus datos

##-- NOMBRE: Obijuan
##-- APELLIDOS: 

##-- Antes de empezar a escribir código leemos el enunciado
##-- Después, lo volvemos a leer. Hay que dedicar tiempo a pensar
##-- Lo que no esté especificado, lo tendrás que decidir tu
##-- Tú eres el ingeniero/a. Tendrás que decidir que es lo más 
##-- adecuado, sin violar especificaciones
#-- 

#---------------------------------------------------
#--  IMPLEMENTA AQUI EL PROGRAM PRINCIPAL
#---------------------------------------------------

	.data
	
	 #-- ESPECIFICACION DEL ENUNCIADO: Cadena definida en tiempo de compilacion
	 #-- Es la que queremos pasar a Mayusculas 
	 #-- Podemos elegir cualquier cadena. Lo unico que necesitamos
	 #-- es que tenga al menos un carácter, ya que en este programa
	 #-- principal sólo vamos a probar la función upper_char()
	 #-- para convertir el primer carácter a mayúsculas
test:   .asciz "test\n"

	 #-- Para el examen basta con hacer un caso de prueba
	 #-- Pero yo aprovecharia para comprobar más casos, antes de
	 #-- de pasar a la implementacion de upper().
	 #-- ¿Que pasa si el primer caracteres es una mayusucula?
	 #-- La deberia dejar tal cual, sin nmodificar
	 #-- Que pasa si es un caracter que no es letra, como el asterisco por ejemplo?
	 #-- ¿Funciona mi funcion en esos casos?


        #-- Aquí empieza nuestro código del programa principal
	.text
	
	#-- ESPECIFICACION DEL ENUNCIADO:
	#-- Imprimir cadena original de test
	la a0, test
	li a7, 4
	ecall
	
	#-- ESPECIFICACION DEL ENUNCIADO:
	#-- Llamar a la funcion upper_char con el primer caracter
	#-- de la cadena
	la a0, test     #-- Direccion del primer caracter de la cadena
	jal upper_char
	
	#-- ESPECIFICACION DEL ENUNCIADO:
	#-- Imprimir la cadena con el primer caracter en mayusculas
	la a0, test
	li a7, 4
	ecall
	
	#-- Para mayor legibilidad de las pruebas, si se imprimen las 
	#-- lineas por separado es mejor. Por eso  he añadido un \n al 
	#-- final de la cadena test. Pero esto es decision de cada uno
	
	#-- ESPECIFICACION DEL ENUNCIADO: Terminar
	#-- Pero aunque el enunciado no me lo dijese, sabemos que SIEMRPRE
	#-- tenermos que terminar nuestros programas devolviendo el 
	#-- control al sistema operativo
	li a7, 10  #-- Servicio exit
	ecall



#----------------------------------------------------
#- IMPLEMENTA AQUI LAS FUNCIONES NECESARIAS
#----------------------------------------------------


#------------------------------------------------------------
#- Funcion upper_char(): Convertir un caracter a mayusculas  
#- Entradas:
#-   a0: Direccion del caracter a convertir a mayusculas
#- Devuelve:
#-   Nada
#------------------------------------------------------------
upper_char:

        #--- No hace falta crear ninguna pila porque desde esta
        #--- funcion no llamamos a niguna otra, y por tanto no hace
        #--- falta guardar el registro ra
        #--- Tambpoco necesitamos guardar en la pila ninugna
        #-- otra información relevante
        
        #-- ¿Y si se pone unna pila? Bueno, no es crítico,
        #--  Lo único que tu programa estará ejecutando
        #-- instrucciones que realmente no son necesarias (no es óptimo)
	
	#-- Leer el caracter que queremos pasar a mayusculas
	#-- Este caracter está almacenado en memoria, en la dirección
	#-- indicada por a0, que es el puntero pasado como argumento
	lb t0, 0(a0)
	
	#---- Comprobar si el caracter esta en el rango ['a' - 'z']: ASCII: [97, 122]
	#-- Si Es menor que 'a' (97): No convertir
	li t1, 'a'
	blt t0, t1, fin_upper_char
	
	#-- Comprobar si es mayor que 'z'
	li t1, 'z'
	addi t1, t1, 1
	bge t0, t1, fin_upper_char
	
	#-- Si llegamos aqui es porque el caracter esta
	#-- en minusculas (entre 'a' y 'z')
	#-- Restamos 32 y lo guardamos
	
	addi t0, t0, -32
	sb t0, 0(a0)
	
	#--- Esta comprobacion hay multiples formas de hacerla
	
	#-- Retornar de la funcion
fin_upper_char:	
	ret
	
	
