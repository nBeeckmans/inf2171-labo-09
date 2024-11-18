	.global fold
.data 
	.eqv tlen, 10
	.eqv esize, 4 
t:	.word 8, 1, 2, 10, 5, 5, -2, 2, 5, 4

.text 
	la a0, t 
	li a1, tlen
	li a2, esize
	la a3, somme
	li a4, 0
	call fold 
	
	call printInt
	
	li a0, 0
	call exit
	
somme : 
	lw a1, 0(a1)
	add a0, a0, a1
	ret 
fold : 
	# a0, adresse tableau
	# a1, n 
	# a2, sizeof 
	# a3, call 
	# a4, init
	
	# ret a0 -> accumulateur

	addi sp, sp, -64 
	sd s0, 0(sp)
	sd s1, 8(sp)
	sd s2, 16(sp)
	sd s3, 24(sp)
	sd s4, 32(sp)
	sd ra, 40(sp)
	
	mv s0, a0
	mv s1, a1
	mv s2, a2 
	mv s3, a3 
	mv s4, a4 
	
while_fold: 
	beqz s1, end_fold
	mv a0, s4 
	mv a1, s0
	
	jalr ra, s3, 0 
	
	mv s4, a0
	add s0, s0, s2
	addi s1, s1, -1
	j while_fold
end_fold: 
	mv a0, s4
	ld s0, 0(sp)
	ld s1, 8(sp)
	ld s2, 16(sp)
	ld s3, 24(sp)
	ld s4, 32(sp)
	ld ra, 40(sp)
	addi sp, sp, 64
	
	ret