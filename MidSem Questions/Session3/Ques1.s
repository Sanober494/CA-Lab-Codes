#MIPS program to sum all the even indexed elements together and all the odd indexed elements together, then find the difference of the two sums.

.data
arr: .word 1, 2, 3, 4, 5, 6
len: .word 6
result: .asciiz "The solution is: "

.text
main:

la $t0, arr

#performimg even index operation
lw $t1, 0($t0)
lw $t2, 8($t0)
lw $t3, 16($t0)
add $t4, $t1, $t2
add $t5, $t4, $t3

#performimg odd index operation
lw $t6, 4($t0)
lw $t7, 12($t0)
lw $t8, 20($t0)
add $t9, $t6, $t7
add $s0, $t9, $t8

#getting the result
sub $s1, $t5, $s0

#print the result
li $v0, 4
la $a0, result
syscall

li $v0, 1
move $a0, $s1
syscall

li $v0, 10
syscall
