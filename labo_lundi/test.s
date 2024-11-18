	# Appelant (programme principal)
	#
	# call: 0x0000000000400008
	# foo:  0x0000000000400014
	# sp:   0x000000007FFFEFFC
	
	li a0, 42
	li a1, -2
call:
	jal foo
	li a7, 10
	ecall

	# Appelé (routine)
foo:
	# Prologue
	addi sp, sp, -16
	sd ra, 0(sp)
	sw a0, 8(sp)
	sw a1, 12(sp)
	
	lb a2, 13(sp)
	
	ebreak	# <-- ICI
	