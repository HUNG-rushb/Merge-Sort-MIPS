.data
myArray: .word 0, 0, -342, 0, 0, 12353, 0, 0, 0, 0

.text
main:
	la $t0, myArray
	lw $t1, 8($t0)
	lw $t2, 20($t0)
	sub $t3, $t1, $t2
	
	li $v0, 1
	addi $a0, $t3, 0
	syscall




