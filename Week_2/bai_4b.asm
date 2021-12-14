.data
myString: .ascii "1913652 - Trinh Duy Hung"
.text
main:
	la $t0, myString
	lb $t1, 0($t0)
	lb $t2, 23($t0)
	
	sb $t1, 23($t0)
	sb $t2, 0($t0)
	
	
	li $v0, 4
	la $a0, ($t0)
	syscall