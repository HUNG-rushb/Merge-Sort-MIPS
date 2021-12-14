.text	
	li $v0, 5   # a trong s0
	syscall
	move $s0, $v0

	li $v0, 5   # b trong s1
	syscall
	move $s1, $v0

	li $v0, 5    # c trong s2
	syscall
	move $s2, $v0

	# luu 2 gia tri de so sanh
	li $s3, -5   # -5 trong s3
	li $s4, 3    # 3 trong s4

	# cho a < -5
	slt $t0, $s0, $s3
	bne $t0, $0, Multiply

	# cho 3 <= a
	slt $t0, $s0, $s4
	beq $t0, $0, Multiply

	# else
	add $s0, $s1,$s2 # a = b + c
	move $a0, $s0
	li $v0, 1
	syscall
	j exit

# if true
Multiply:
	mul $s0, $s1, $s2
	move $a0, $s0
	li $v0, 1
	syscall
	j exit
	
exit: