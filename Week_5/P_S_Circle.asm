.data
pi:		.float 3.14
two: 		.float 2.00
zero:		.float 0.00
perimeter: 	.asciiz"Chu vi hinh tron: "
area:		.asciiz"\nDien tich hinh tron: "
wrong: 		.asciiz"Your radius is invalid."
	
.text
# Read radius
li	$v0, 6
syscall
mov.s	$f1, $f0	# f1 == radius

la	$a1, zero
l.s	$f10, ($a1)	# f10 == 0

# radius <= 0	
c.le.s	$f1, $f10	# < 0
bc1t	invalid_radius
c.eq.s 	$f10, $f1	# == 0
bc1t	invalid_radius

#--------------------------------------
la	$a1, pi
l.s	$f2, ($a1)	# f2 == 3.14

la 	$a1, two
l.s	$f3, ($a1)	# f2 == 2.00

# perimeter
mul.s 	$f4, $f1, $f2	# f4 = radius * 3.14
mul.s	$f5, $f4, $f3	# f5 = 2 * 3.14 * radius

# area
mul.s	$f6, $f1, $f2	# f6 = radius * 3.14
mul.s	$f7, $f6, $f1	# f7 = radius * radius * 3.14

# Print result
li 	$v0, 4
la	$a0, perimeter
syscall

li	$v0, 2
mov.s 	$f12, $f5
syscall

li 	$v0, 4
la	$a0, area
syscall

li	$v0, 2
mov.s 	$f12, $f7
syscall

# exit
li 	$v0, 10
syscall

invalid_radius:
	li 	$v0, 4
	la	$a0, wrong
	syscall

	li 	$v0, 10
	syscall
