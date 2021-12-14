.data
.text
li $v0, 5
syscall
add $t1, $0, $v0

li $v0, 5
syscall
add $t2, $0, $v0

li $v0, 5
syscall
add $t3, $0, $v0

# Calculate
sub $t4, $t1,$t2
add $t5, $t4, $t3

# Print
li $v0, 1
add $a0, $t5, $0
syscall


