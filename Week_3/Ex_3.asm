.text
	li $v0, 5   # read input
	syscall
	move $s0, $v0

	li $s5, 200   # b trong s5
	li $s6, 4   # c trong s6
	
	# luu cac case
	li $s1, 1
	li $s2, 2
	li $s3, 3
	li $s4, 4
	
	# switch case
	beq $s0, $s1, case1
	beq $s0, $s2, case2
	beq $s0, $s3, case3
	beq $s0, $s4, case4
	
	# No-operation  a = 0
	li $s7, 0
	move $a0, $s7
	li $v0, 1
	syscall
	j exit
case1:
	add $s7, $s5, $s6	# a = b + c
	move $a0, $s7
	li $v0, 1
	syscall
	j exit
case2:
	sub $s7, $s5, $s6	# a = b - c
	move $a0, $s7
	li $v0, 1
	syscall
	j exit
case3:
	mul $s7, $s5, $s6	# a = b * c
	move $a0, $s7
	li $v0, 1
	syscall
	j exit
case4:
	div $s5, $s6		# a = b / c
	mflo $s7
	move $a0, $s7
	li $v0, 1
	syscall
	j exit
	
exit:
