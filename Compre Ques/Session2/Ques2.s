#leaf procedure to find if the number is armstrong or not

.data
num: .word 153
yes: .asciiz "is armstrong"
no: .asciiz "is not armstrong"

.text
main:

lw $t0, num
lw $t1, num
li $t5, 0

jal search
move $t7, $v1
beq $t7, $t0, yep

li $v0, 4
la $a0, no
syscall

li $v0, 10
syscall

yep:
li $v0, 4
la $a0, yes
syscall

li $v0, 10
syscall 

search: 
li $t5, 0        

loop:
beq $t1, $zero, ep
div $t1, $t1, 10
mfhi $t2
mflo $t1
mul $t3, $t2, $t2
mul $t4, $t3, $t2
add $t5, $t5, $t4
j loop

ep:
move $v1, $t5
jr $ra
