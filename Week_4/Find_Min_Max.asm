.data
my_Array_1:	.word -5, 0, 1, 2, 3, 4, 5, 6, 7
my_Array_2:	.word 0, 1, 2, 3, 4, 5, 6, 7, 8, 
my_Array_3:	.word -4, -3, -2, -1, 0, 1, 2, 3, 4
eol:		.asciiz "\n"

.text
	# print the array first
	jal 	print_the_array
	
	# find range
	jal 	find_range
	
	# range = max - min
	sub 	$s6, $s5, $s4
	
	#li 	$v0, 1
	#la 	$a0, eol
	#syscall
	
	# print range
	li 	$v0, 1
	addi 	$a0, $s6, 0
	syscall
	
	# exit
	j exit

# ----------------------------------------------------------------------------
print_the_array:
	li 	$t0, 0	# counter
	la 	$t1, my_Array_1
	
	print_array_loop:
		bge 	$t0, 9, exit_print
		
		# load word from address and go to the next address
		lw 	$t2, 0($t1)
		addi	$t1, $t1, 4
		
		# syscall to print the value
		li 	$v0, 1
		move 	$a0, $t2
		syscall
		
		# print space
   	 	li      $v0, 11 
   	 	li      $a0, 32 
    		syscall

		# increase counter
		addi    $t0, $t0, 1
    		j     	print_array_loop
  
	exit_print:
		jr 	$ra
		
exit:
	li 	$v0, 10
	syscall

#---------------------------------------------------------------------
find_range:
	addi 	$sp, $sp, -4	# adjust stack for 1 item 
	sw	$ra, 0($sp)	# save return address
	
	# find min, max
	jal 	find_max
	jal	find_min
	
	# finish
	lw	$ra, 0($sp)	# restore return address
	addi	$sp, $sp, 4	# pop 1 item from stack
	
	# return
	jr 	$ra
	
#------------------------------------------------------------------------------
find_max:
	li	$t3, -1		# counter
	la	$t4, my_Array_1	# t4 chua array
	lw	$t5, ($t4)	# max = array[0]
	
	find_max_loop:
		# t5 chua max
		addi    $t3, $t3, 1	# increase counter
		bge 	$t3, 9, exit_find_max
		
		# lay phan tu tiep theo
		lw 	$t2, 0($t4)	# t2 chua current
		addi	$t4, $t4, 4
		
		# so sanh
		slt	$s7, $t5, $t2	# neu max < current => s7 == 1
		blez	$s7, find_max_loop
		
		# set new max
		addi 	$t5, $t2, 0
    		j     	find_max_loop
    			
	exit_find_max:
		addi	$s5, $t5, 0
		jr 	$ra	
#-----------------------------------------------------------------		
find_min:
	li	$t3, -1		# counter
	la	$t6, my_Array_1	# t6 chua array
	lw	$t7, ($t6)	# min = array[0]

	find_min_loop:
		# t7 chua min
		addi    $t3, $t3, 1	# increase counter
		bge 	$t3, 9, exit_find_min
		
		# phan tu tiep theo
		lw 	$t2, 0($t6)	# t2 chua current
		addi	$t6, $t6, 4	
		
		# so sanh
		slt	$s7, $t2, $t7	# neu current < min => s7 == 1
		blez	$s7, find_min_loop

		# set new min
		lw	$t7, ($t2)
    		j     	find_min_loop
		
	exit_find_min:
		addi 	$s4, $t7, 0
		jr 	$ra
# ------------------------------------------------------------------







