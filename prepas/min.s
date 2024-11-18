.data 
	.eqv tlen, 10
	.eqv esize, 4 
t:	.word 8, 1, 2, 10, 5, 5, -2, 2, 5, 4
.text 
	la a0, t 
	li a1, tlen
	li a2, esize
	la a3, min
	li a4, 0
	
	call fold
	
	call printInt
	
	li a0, 0
	call exit
min : 
	# a0 == min 
	# a1 == adresse 
	
	lw a1, 0(a1)
	
	blt a0, a1, skip_swap
	mv a0, a1
skip_swap:
	ret 