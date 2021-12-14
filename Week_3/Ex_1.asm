.data 
odd_string:	.asciiz"\nComputer Architecture 2020\n"
even_string: 	.asciiz"\nComputer Science and Engineering, HCMUT\n"

.text
main:
	# read input
	li $v0, 5
	syscall
	move $s0, $v0

	# input < 0
	slt $s7, $s0, $0
	beq $s7, $0, minus_case
	
divide_2: 
	li $s2, 2
	div $s0, $s2
	# mfhi la lenh lay so du s0 chia cho s2
	mfhi $s5
	#  s5 == 1 || 0
	beq $s5, 0, Even
	beq $s5, 1, Odd

Odd:
	li $v0, 4
	la $a0, odd_string
	syscall
	j Exit
	
Even:
	li $v0, 4
	la $a0, even_string
	syscall
	j Exit
		
minus_case:
	sub $s0, $0, $s0
	j divide_2
	
Exit:
