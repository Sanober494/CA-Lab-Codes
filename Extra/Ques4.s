#difference of hard coded numbers without any float operations

.data
msg: .word 20
msg1: .word 30
dot: .asciiz "."

.text
main:

lw $t0, msg
lw $t1, msg1
div $t1,$t0
mflo $t2
mfhi $t3

li $v0, 1
move $a0, $t2
syscall

li $v0, 4
la $a0, dot
syscall 

li $v0, 1
move $a0, $t3
syscall

li $v0,10
syscall
