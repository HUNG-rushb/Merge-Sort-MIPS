.data
myString: .space 12

.text
main :
	la $a0, myString
	addi $a1, $0, 11
	li $v0, 8
	syscall
	
	li $v0,4
	syscall