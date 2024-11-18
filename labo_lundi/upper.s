# upper.s 
	.global uppercase 
.data 
str1 : .space 81
str2 : .space 81
.text  
	
	la a0, str1
	li a1, 80 
	call readString

	la a0, str2
	li a1, 80 
	call readString
	
	la a0, str1
	jal uppercase
	
	la a0, str2
	jal uppercase
	
	la a0, str2
	call printString
	
	li a0, '\n'
	call printChar
	
	la a0, str1
	call printString 
	
	li a0, 0
	call exit 
	
uppercase:
	# a0, adresse du String
	lbu t0, 0(a0)
loop_uppercase:
	beqz t0, fin_loop_uppercase 
	li t1, 'a'
	li t2, 'z' 
	blt t0, t1, passer_majusculation
	bgt t0, t2, passer_majusculation
	addi t0, t0, -32
	sb t0, 0(a0)
passer_majusculation: 
	addi a0, a0, 1 
	lbu t0, 0(a0)
	j loop_uppercase 
fin_loop_uppercase:
	ret

