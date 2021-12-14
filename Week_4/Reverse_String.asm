.data
my_string:		.asciiz"Computer Architecture 2020\n"
reversed_string:	.space	100

.text
main:
	# print my_string first
	li	$v0, 4
	la 	$a0, my_string 
	syscall
	
	jal 	string_length
	
	add 	$t1, $zero, $v0		# t1 chua size
	add 	$t2, $a0, $zero		# luu my_string vao t2
	
reverse_the_string:
	li 	$t0, 0	# so dem
	li 	$t3, 0	# luu my_string se bi thu gon
		
	reverse_loop:
		add 	$t3, $t2, $t0	# them vao t3 mot chuoi trong t2 bat dau tu vi tri t0
		lb 	$t4, 0($t3)	# lay ki tu dau tien
		
		beqz	$t4, Exit
		
		sb	$t4, reversed_string($t1) # luu vao byte thap nhat
		
		subi 	$t1, $t1, 1 	# giam do dai chuoi di 1
		addi 	$t0, $t0, 1	# so dem += 1
		j	reverse_loop
	
Exit:
	li 	$v0, 4	# Print the result
	la 	$a0, reversed_string
	syscall
	
	li 	$v0, 10	# exit (terminate execution)
	syscall
		
string_length:
	li 	$t0, 0	# so dem (size)
	li 	$t2, 0	# chua my_string bi rut gon
	
	string_length_loop:
		# a0 dang chua my_string
		add 	$t2, $a0, $t0		# cat tung chu ra
						# them vao t2 mot chuoi trong a0 bat dau tu vi tri t0
						
		lb 	$t1, 0($t2)		# lay ki tu dau tien
		
		beqz 	$t1, string_length_exit	# ket thuc khi gap ki tu "\n"
		
		addiu 	$t0, $t0, 1		# so dem += 1 
		j 	string_length_loop
		
	string_length_exit:
		subi	$t0, $t0, 1		# tru di ky tu 0x0a
		
		add 	$v0, $zero, $t0
		add 	$t0, $zero, $zero	# tra ve t0 = 0
		jr 	$ra			# tro ve jal	
