#leaf procedure to reverse a number

.data
apple: .asciiz "Enter number: "

.text
main:

li $v0, 4
la $a0, apple
syscall

li $v0, 5
syscall
move $t0, $v0

jal reverse

li $v0, 10
syscall 

reverse:

loop: 
beq $t0, $zero, ep
div $t0, $t0, 10
mfhi $t2
mflo $t0
li $v0, 1
move $a0, $t2
syscall
j loop

ep:
jr $ra
