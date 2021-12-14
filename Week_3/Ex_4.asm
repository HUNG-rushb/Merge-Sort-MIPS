# Nhap vao so n > 0
# Xuat ra so fibonacci thu n
.text
	# Get input
	li $v0, 5
	syscall
	move $s0, $v0 

	# Input == 0 || 1
	beq $s0, 0, case_0
	beq $s0, 1, case_1
	
	# f0 va f1 de chay lan luot
	li $t2, 0 # f0
	li $t3, 1 # f1
	li $t4, 0 # bien dem count bat dau tu 0
	
Fibonacci_loop:
	addi $t4, $t4, 1	# count += 1
	add $t2, $t3, $t2	# tang Fibonacci
	beq $s0, $t4, done_f0	# count == n

	addi $t4, $t4, 1	# count += 1
	add $t3, $t3, $t2	# tang fibonacci
	beq $s0, $t4, done_f1	# count == n
	
	j Fibonacci_loop

done_f0:
	li $v0, 1
	move $a0, $t3
	syscall
	j exit

done_f1:	
	li $v0, 1
	move $a0, $t2
	syscall
	j exit 

case_0: 
	# Tra ve 0
	li $v0, 1
	li $a0, 0
	syscall
	j exit

case_1:
	# Tra ve 1
	li $v0, 1
	li $a0, 1
	syscall
	j exit

exit:
