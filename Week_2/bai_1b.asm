.data
out_string: 	.asciiz"\nKien Truc May Tinh 2020\n"
.text
main:
	li $v0, 4           
	la $a0, out_string
	syscall