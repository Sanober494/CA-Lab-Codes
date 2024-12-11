#Find the qoutient of a number using repeated subtraction


.data
num: .word 10
num2: .word 2
res: .asciiz "The result is:"


.text
main:

li $t0, 0   #counter
lw $t1, num
lw $t2, num2

loop:
blt $t1, $zero, ep
sub $t1, $t1, $t2
addi $t0, $t0, 1
j loop

ep:
li $v0, 4
la $a0, res
syscall

addi $t0, $t0, -1

li $v0, 1
move $a0, $t0
syscall

li $v0, 10
syscall 
