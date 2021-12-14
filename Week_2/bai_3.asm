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

li $v0, 5
syscall
add $t4, $0, $v0

# X
li $v0, 5
syscall
add $t5, $0, $v0

# Calculate
mul $t6, $t1, $t5
sub $t6, $t6, $t2
mul $t6, $t6, $t5
add $t6, $t6, $t3
mul $t6, $t6, $t5
sub $t6, $t6, $t4
# Save answer
add $s0, $0, $t6

# Print answer

li $v0, 1
addi $a0, $s0, 0
syscall


