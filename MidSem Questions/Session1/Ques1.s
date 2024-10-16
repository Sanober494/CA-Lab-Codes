#MIPS program to multiply elements of the same index of two arrays and then add all the products     

.data
arr1: .word 1, 2, 3, 4, 5
arr2: .word 2, 3, 4, 5, 6
len: .word 5
result: .asciiz "The solution is: "

.text
main:
la $t0, arr1
la $t1, arr2

li $t3, 0     # i = 0
lw $t4, len

li $t2, 0 # sum = 0

loop:
beq $t3, $t4, endpgm
lw $t5, 0($t0)
lw $t6, 0($t1)
mul $t7, $t5, $t6
add $t2, $t2, $t7
addi $t0, $t0, 4
addi $t1, $t1, 4
addi $t3, $t3, 1
j loop

endpgm:
li $v0, 4
la $a0, result
syscall 

li $v0, 1
move $a0, $t2
syscall

li $v0, 10
syscall
