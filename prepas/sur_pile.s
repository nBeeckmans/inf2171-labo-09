	.eqv mot1, 0
	.eqv mot2, 81
.text 
	addi sp, sp, -176  # alignement sur 16 octets
	addi a0, sp, mot1
	li   a1, 80
	call readString
	
	addi a0, sp, mot2
	li   a1, 80
	call readString
	
	addi a0, sp, mot2
	call uppercase 
	
	addi a0, sp, mot1 
	call uppercase 
	
	addi a0, sp, mot2 
	call printString 
	
	li a0, '\n'
	call printChar
	
	addi a0, sp, mot1
	call printString 
	
	addi sp, sp, 168
	li a0, 0 
	call exit