.data
my_array:	.float -10.5, 9.9, -8.8, -7.7, -6.6, -5.5, -4.4, -3.3, -2.2, -1.1, 0.0, 1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8, -9.9
print_min:	.asciiz"\nMin is: "
print_max: 	.asciiz"Max is: "

.text
	jal	find_max
	jal	find_min
	
	# print result	
	li 	$v0, 4
	la	$a0, print_max
	syscall
	
	li	$v0, 2
	mov.s 	$f12, $f10	# f10 min
	syscall
	
	li 	$v0, 4
	la	$a0, print_min
	syscall
	
	li	$v0, 2
	mov.s 	$f12, $f11	# f11 max
	syscall
	
	li	$v0, 10
	syscall
	
find_max:
	li	$t0, -1		# counter
	la	$t1, my_array	# t1 chua array
	l.s	$f1, ($t1)	# max = array[0]

	max_loop:
		# f1 chua max
		addi    $t0, $t0, 1	# increase counter
		bge 	$t0, 20, exit_find_max
		
		# lay phan tu tiep theo
		l.s 	$f3, 0($t1)	# f3 chua current
		addi	$t1, $t1, 4
		
		# compare
		c.le.s	$f1, $f3	# max < current
		bc1f 	max_loop	# continue if max > current
		
		# set new max
		mov.s	$f1, $f3
    		j     	max_loop
    			
	exit_find_max:
		mov.s	$f10, $f1
		jr 	$ra

find_min:
	li	$t0, -1		# counter
	la	$t1, my_array	# t1 chua array
	l.s	$f1, ($t1)	# min = array[0]

	min_loop:
		# f1 chua min
		addi    $t0, $t0, 1	# increase counter
		bge 	$t0, 7, exit_find_min
		
		# lay phan tu tiep theo
		l.s 	$f3, 0($t1)	# f3 chua current
		addi	$t1, $t1, 4
		
		# compare
		c.le.s	$f3, $f1	# current < min
		bc1f 	min_loop	# continue if min < current
		
		# set new min
		mov.s	$f1, $f3
    		j     	min_loop
    			
	exit_find_min:
		mov.s	$f11, $f1
		jr 	$ra








