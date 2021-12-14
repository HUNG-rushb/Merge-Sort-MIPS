.text
main:
	addi $t0, $0, 100000
	addi $t0, $t0, 5000
	addi $s0, $t0, -400
	
	li $v0, 1
	addi $a0, $s0, 0
	syscall
	