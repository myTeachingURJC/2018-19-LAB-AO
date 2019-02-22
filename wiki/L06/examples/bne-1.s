# Ejemplo de comparacion de dos registros, usando bne
# Si el valor dado los registros es el mismo,
# el programa imprimirá la cadena: "IGALES"
# de lo contrario imprimirá "DISTINTOS"


#-- En el segmento de datos guardamos las
#-- cadenas a imprimir
	         .data
msg_iguales:     .asciz "IGUALES"
msg_diferentes:  .asciz "DIFERENTES"

#-- Comienzo del programa
		 .text
		 
		 #-- Dar dos valores cualesquiera a los registros t0 y t1
		 #-- Según si son iguales o no, el programa hará una
		 #-- cosa u otra. Probaremos poniendo valores iguales primero
		 li t0, 20
		 li t1, 25
		 
		 #-- Realizar la comparacion
		 #  ¿t0 != t1?. Si es asi saltar a la etiqueta no_iguales
		 bne t0, t1, no_iguales    
		 
		 #-- Si son iguales el microprocesador continua
		 #-- ejecutando instrucciones por aqui
		 
		 #-- Imprimimos el mensaje de que son iguales 
		 la a0, msg_iguales
		 b print
		 
no_iguales:	#-- Este codigo se ejecuta si los registros son diferentes
		#-- Imprimimos la cadena
		
		la a0, msg_diferentes
		
print:		#-- Imprimir el mensaje. En a0 se encuentra la direccion de
                #-- la cadena a imprimir
                li a7, 4
                ecall 
                
                #-- Terminar
                li a7, 10
                ecall
                