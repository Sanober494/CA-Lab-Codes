#difference of two hard coded numbers

.data
msg: .word 20
msg1: .word 30

.text
main:

lw $t0, msg
lw $t1, msg1
sub $t2, $t0,$t1

li $v0, 1
move $a0, $t2
syscall

li $v0,10
syscall
