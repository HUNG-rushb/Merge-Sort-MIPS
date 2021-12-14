.data
string: .asciiz "Computer Architecture CSE-HCMUT"

.text
	la $s1, string	# chuoi
	li $t1, -1	# bien dem, vi tri bat dau tu 0

Loop:
	addi $t1, $t1, 1	# vi tri += 1
	lb $s0, string($t1)	# xet tung chu dua vao s0
	beq $s0, 'e', Found	# Da tim thay
	beq $s0, 0x00 , Couldnt_find	# Chuoi khong chua ki tu e
	j Loop

Found:	
	# tim thay chu e dau tien
	# in ra vi tri
	li $v0, 1
	move $a0, $t1
	syscall
	j exit
	
Couldnt_find:
	# tra ve -1
	li $v0, 1
	li $a0, -1
	syscall
	j exit
	
exit:
