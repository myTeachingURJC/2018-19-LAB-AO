## Probando dos llamadas a subrutina encadenadas
## El programa principal llama a la subrutina 1 (Nivel 1)
## y esta a la subrutina 2 (Nivel 2) y luego se deberia
## retornar a la subrutina 1 y finalmete a la 2... PERO...
## En cada nivel se imprime un mensaje

	    .data
	
msg_main:   .asciz "Main(); Estamos en nivel 0\n"
msg_sub1:   .asciz "Sub1(): Estamos en nivel 1\n"
msg_sub2:   .asciz "Sub2(): Estamos en nivel 2\n"
msg_fin:    .asciz "Fin: Estamos en nivel 0\n"
		
	    .text
	    
	    #-- Imprimir mensaje
	    la a0, msg_main
	    li a7, 4
	    ecall  #-- PrintString
	    
	    #-- Llamar a la subrutina de NIVEL 1
	    jal sub1
	    
	    
	    #-- Imprimir mensaje fin
	    la a0, msg_fin
	    li a7, 4
	    ecall  #-- PrintString
	    
	    #-- Terminar
	    li a7, 10
	    ecall

	    
  
#-- Subrutina Nivel 1
sub1:	    la a0, msg_sub1
	    li a7, 4
	    ecall #-- PrintString
	    
	    #-- Llamar a la subrutina de Nivel 2
	    jal sub2
	    
	    ret
	    
#-- Subrutina Nivel 2
sub2:	    la a0, msg_sub2
	    li a7, 4
	    ecall #-- PrintString
	    ret	    
