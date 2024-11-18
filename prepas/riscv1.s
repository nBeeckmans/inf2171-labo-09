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
	call uppercase

	la a0, str2
	call uppercase
	
	la a0 str2
	call printString
	
	li a0, '\n'
	call printChar

	la a0, str1
	call printString
	
	li a0, 0
	call exit

uppercase: 
	# a0, ptr 
	# a1, taille 
	
	# a = 97, A = 65 donc -> pour passer en maj : 65 - 97 = - 32
	
loop_uppercase:	
	lbu t0, 0(a0)
	blez t0, end_loop_uppercase
	li t1, 'a'
	li t2, 'z' 
	blt t0, t1, skip_maj
	bgt t0, t2, skip_maj
	addi t0, t0, -32 
skip_maj: 
	sb t0, 0(a0)
	addi a0, a0, 1 
	addi a1, a1, -1
	j loop_uppercase 
end_loop_uppercase: 
	ret